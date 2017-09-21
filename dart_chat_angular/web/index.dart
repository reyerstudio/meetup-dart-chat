import 'package:angular/angular.dart';
import 'package:http/browser_client.dart';
import 'package:web_socket_channel/html.dart';

import 'package:dart_chat_common/client.dart';
import 'package:dart_chat_common/config.dart';

import 'package:dart_chat_webdev/components/app_component.dart';

var config = new ClientConfig()
  ..host = chatHostAddress
  ..port = chatHostPort
  ..secure = chatSecure
  ..username = "alice"
  ..password = "alicepass";

main() {
  bootstrap(AppComponent, [
    new Provider(
      ChatService,
      useValue: new ChatService(
        new BrowserClient(),
            (url) => new HtmlWebSocketChannel.connect(url),
        config,
      ),
    ),
  ]);
}
