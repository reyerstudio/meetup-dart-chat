import 'dart:async';

import 'package:angular/angular.dart';

import 'package:dart_chat_common/client.dart';
import 'package:dart_chat_common/shared.dart';

@Injectable()
class AngularChatService {
  final ChatService _chatService;

  ClientConfig get config => _chatService?.config;
  ChatUser get user => _chatService?.user;
  List<ChatMessage> get messages => _chatService?.messages;
  Map<String,ChatUser> get users => _chatService?.users;

  AngularChatService(this._chatService);

  Future<ChatUser> login(String username, String password) => _chatService.login(username, password);
  Future<Null> logout() => _chatService.logout();
  void sendMessage(String text) => _chatService?.sendMessage(text);
}
