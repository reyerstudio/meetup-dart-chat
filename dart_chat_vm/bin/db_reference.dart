import 'dart:async';

import 'package:logging/logging.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'package:dart_chat_vm/server.dart';
import 'package:dart_chat_common/shared.dart';

final _log = new Logger('db_reference');

Future<Null> main(List<String> args) async {
  var config = loadConfig(args);
  initLogging(config.log);

  // Open database
  var db = new Db(config.dbUrl);
  await db.open();

  // First drop content
  await db.drop();

  // Fill with reference data
  var salt = generateSalt();
  var users = <ChatUser>[
    new ChatUser(
      id: new ObjectId().toHexString(),
      username: "alice",
      password: hashPassword("alicepass", salt, config.secret),
      salt: salt,
    ),
    new ChatUser(
      id: new ObjectId().toHexString(),
      username: "bob",
      password: hashPassword("bobpass", salt, config.secret),
      salt: salt,
    ),
    new ChatUser(
      id: new ObjectId().toHexString(),
      username: "charlie",
      password: hashPassword("charliepass", salt, config.secret),
      salt: salt,
    ),
    new ChatUser(
      id: new ObjectId().toHexString(),
      username: "dan",
      password: hashPassword("danpass", salt, config.secret),
      salt: salt,
    ),
  ];
  await db.collection(dbUsersCollection).insertAll(users.map((ChatUser user) {
    var json = user.toJson();
    _log.info(json);
    return json;
  }));

  // Close database
  await db.close();
}
