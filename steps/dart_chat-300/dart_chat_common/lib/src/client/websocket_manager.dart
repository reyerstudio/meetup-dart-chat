import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:dart_chat_common/shared.dart';

final _log = new Logger('client.websocket_manager');

typedef void ChatMessageHook(ChatMessage message);

class WebsocketManagerClient extends BaseWebsocketManager {
  String userId;
  ChatMessageHook hook;

  WebsocketManagerClient(WebSocketChannel channel, AuthToken token, this.hook) {
    var tokenData = new AuthTokenCodec().decode(token.token, withValidation: false);
    channels[channel] = tokenData;
    _connect(channel, token);
  }

  void _connect(WebSocketChannel channel, AuthToken token) {
    // Listen to incoming websocket messages
    channel.stream.listen((message) => super.onMessage(channel, message));

    // Send AuthToken for authentication
    channel.sink.add(JSON.encode(new WebsocketMessage.fromObject(token)));
  }

  void processObject(WebSocketChannel channel, Object object) {
    if (object is ChatMessage) {
      hook(object);
    }
  }
}
