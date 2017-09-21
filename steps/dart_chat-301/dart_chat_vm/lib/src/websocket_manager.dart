import 'package:logging/logging.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:dart_chat_common/shared.dart';

final _log = new Logger('server.websocket_manager');

class WebsocketManagerServer extends BaseWebsocketManager {
  final AuthTokenCodec _authTokenCodec;

  WebsocketManagerServer(this._authTokenCodec);

  void processObject(WebSocketChannel channel, Object object) {
    if (object is AuthToken) {
      var authToken = object;
      var authTokenData = _authTokenCodec.decode(authToken.token);
      _log.info("userId '${authTokenData.userId}' connected");
      channels[channel] = authTokenData;
    } else {
      if (channels.containsKey(channel) == false || channels[channel].valid == false) {
        throw new Exception("Channel not authenticated");
      }
      broadcastObject(channel, object);
    }
  }
}
