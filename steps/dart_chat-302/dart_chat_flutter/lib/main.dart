import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:web_socket_channel/io.dart';

import 'package:dart_chat_common/client.dart';
import 'package:dart_chat_common/config.dart';

import 'widgets/chat_screen.dart';

final _log = new Logger('flutter');

var config = new ClientConfig()
  ..host = chatHostAddress
  ..port = chatHostPort
  ..secure = chatSecure
  ..username = defaultTargetPlatform == TargetPlatform.iOS ? 'charlie' : 'dan'
  ..password = defaultTargetPlatform == TargetPlatform.iOS ? 'charliepass' : 'danpass';

void main() {
  runApp(new DartChatApp(new ChatService(
    new IOClient(),
        (url) => new IOWebSocketChannel.connect(url),
    config,
  )));
}

class DartChatApp extends StatelessWidget {
  final ChatService _chatService;

  DartChatApp(this._chatService);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Dart Chat',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ChatScreen(_chatService),
    );
  }
}
