import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:logging/logging.dart';

import 'package:dart_chat_common/shared.dart';

final Logger _log = new Logger("client.chat_api");

class ChatApi {
  final BaseClient _client;
  final String _url;

  String get _userEndpoint => "$_url/chat/user";

  ChatApi(this._client, this._url);

  Future<ChatUser> createUser(ChatUser user) async {
    var result = await _client.post(_userEndpoint, body: JSON.encode(user));
    return new ChatUser.fromJson(JSON.decode(result.body));
  }

  Future<AuthToken> authUser(String username, String password) async {
    var credentials = new ChatUser(username: username, password: password);
    var result = await _client.post("$_userEndpoint/auth", body: JSON.encode(credentials));
    return new AuthToken.fromJson(JSON.decode(result.body));
  }

  Future<ChatUser> getChatUser(String id) async {
    var result = await _client.get("$_userEndpoint/$id");
    return new ChatUser.fromJson(JSON.decode(result.body));
  }
}
