import 'package:flutter/material.dart';

import 'package:dart_chat_common/client.dart';
import 'package:dart_chat_common/shared.dart';

import 'chat_login.dart';
import 'chat_messages.dart';

class ChatScreen extends StatefulWidget {
  final ChatService _chatService;

  ChatScreen(this._chatService);

  @override
  State createState() => new _ChatScreenState(_chatService);
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatService _chatService;
  bool connecting = true;

  ChatUser get user => _chatService?.user;

  _ChatScreenState(this._chatService);

  @override
  Widget build(BuildContext context) {
    if (_chatService?.user == null) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Dart Chat - Login'),
        ),
        body: new ChatLogin(_chatService, (user) {
          setState(() => connecting = false);
        }),
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dart Chat - ${user.username}'),
      ),
      body: connecting ? new Text('Connecting to server...') : new ChatMessages(_chatService),
    );
  }
}
