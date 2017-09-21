import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf_rest/shelf_rest.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:logging/logging.dart';

import 'package:dart_chat_vm/server.dart';
import 'package:dart_chat_common/shared.dart';

const String dbUsersCollection = "users";
const String dbMessagesCollection = "messages";

/// Chat API definition.
class ChatApi {
  static final _log = new Logger('server.chat_api');

  final AuthTokenCodec _authTokenCodec;
  final Db _db;
  final String _secret;

  DbCollection _usersCollection;

  ChatApi(this._authTokenCodec, this._db, this._secret) {
    _usersCollection = _db.collection(dbUsersCollection);
  }

  /// Creates the given [ChatUser].
  @Post("user")
  Future<ChatUser> createUser(@RequestBody() ChatUser user) async {
    _log.info("createUser: ${user.toJson()}");

    // Security stuff
    var salt = generateSalt();
    user
      ..id = new ObjectId().toHexString()
      ..password = hashPassword(user.password, salt, _secret)
      ..salt = salt;

    // Insert new user into DB and return non-sensitive data
    var json = user.toJson();
    await _insertChatUser(json);
    return _publicChatUser(json);
  }

  /// Returns the [AuthTokenData] if given username and password are correct
  @Post("user/auth")
  Future authUser(@RequestBody() ChatUser credentials) async {
    _log.info("authUser: ${credentials.toJson()}");

    var dbUser = await _findChatUserByUsername(credentials.username);
    if (dbUser == null) {
      return new Response.notFound("Not found");
    }
    var foundUser = new ChatUser.fromJson(dbUser);
    if (foundUser.password != hashPassword(credentials.password, foundUser.salt, _secret)) {
      throw new Exception('Wrong credentials');
    }
    var now = new DateTime.now().toUtc();
    var token = _authTokenCodec.encode(new AuthTokenData()
      ..userId = foundUser.id
      ..creationDate = now
      ..expirationDate = now.add(new Duration(hours: 4)));
    return new AuthToken()..token = token;
  }

  /// Returns the requested [ChatUser].
  @Get("user/{id}")
  Future getChatUser(String id) async {
    _log.info("getChatUser: $id");
    var dbUser = await _findChatUserById(id);
    if (dbUser == null) {
      return new Response.notFound("Not found");
    }
    return _publicChatUser(dbUser);
  }

  /// Database methods
  Future<Null> _insertChatUser(Map json) => _usersCollection.insert(json);
  Future<Map> _findChatUserById(String userId) => _usersCollection.findOne(where.eq('_id', userId));
  Future<Map> _findChatUserByUsername(String username) => _usersCollection.findOne(where.eq('username', username));
}

/// Remove sensible data from ChatUser.
ChatUser _publicChatUser(Map<String, dynamic> json) {
  if (json == null) {
    return new ChatUser();
  }

  // Remove sensible data
  for (var sensible in ['password', 'salt']) {
    json.remove(sensible);
  }
  return new ChatUser.fromJson(json);
}
