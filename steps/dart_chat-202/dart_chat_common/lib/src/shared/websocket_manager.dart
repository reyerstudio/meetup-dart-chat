import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:dart_chat_common/shared.dart';

final _log = new Logger('shared.websocket_manager');

abstract class BaseWebsocketManager {
  Map<WebSocketChannel, AuthTokenData> channels = <WebSocketChannel, AuthTokenData>{};

  void processObject(WebSocketChannel channel, Object object);

  void broadcastObject(WebSocketChannel channel, Object object) {
    var data = JSON.encode(new WebsocketMessage.fromObject(object));
    _log.info("Sending: '${data}'");
    channels.keys.forEach((channel) => channel.sink.add(data));
  }

  void onConnection(WebSocketChannel channel) {
    _log.info("Websocket connected: ${channel.hashCode}");
    channel.stream.listen((message) => onMessage(channel, message), onDone: () {
      _close(channel);
    }, cancelOnError: true);
  }

  void onMessage(WebSocketChannel channel, String text) {
    try {
      var object = new WebsocketMessage.fromJson(JSON.decode(text)).toObject();
      processObject(channel, object);
    } catch (e, s) {
      _log.warning(e, s);
      _close(channel);
    }
  }

  void _close(WebSocketChannel channel) {
    if (channels.containsKey(channel)) {
      _log.info("userId '${channels[channel].userId}' disconnected");
      channels.remove(channel);
    }
    channel.sink.close();
  }
}
