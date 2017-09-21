# CLI Client

## Packages used
- **ansicolor**
https://pub.dartlang.org/packages/ansicolor

## Impacted files
- ```dart_chat_common```
  - ```lib/src/client/chat_api.dart```
  - ```lib/src/client/chat_service.dart```
  - ```lib/src/client/config.dart```
  - ```lib/src/client/websocket_manager.dart```
  - ```lib/client.dart```
- ```dart_chat_vm```
  - ```bin/client.dart```

## Client configuration
- In ```dart_chat_common``` sub-project
  - Create ```lib/src/client/config.dart```
  - Create ```lib/client.dart```

## REST API & Service
- In ```dart_chat_common``` sub-project
  - Create ```lib/src/client/chat_api.dart```
  - Create ```lib/src/client/chat_service.dart```
  - Create ```lib/src/client/websocket_manager.dart```
  - In ```lib/client.dart```, export ```lib/src/client/chat_api.dart```, ```lib/src/client/chat_service.dart``` and ```lib/src/client/websocket_manager.dart```

## CLI Client
- In ```dart_chat_vm``` sub-project
  - Open ```pubspec.yaml```
    - Add ```ansicolor``` as dependencies
    - Click on **Get dependencies**
  - Create ```bin/client.dart```

## Server & CLI Client tests
  - Run ```bin/client.dart --help```
  - Run ```tmux```
  - Run ```bin/server.dart```
  - Split horizontally => CTRL+B "
  - Move bottom pane => CTRL+B DOWN
  - Split vertically => CTRL+B %
  - Run ```bin/client.dart -U alice -P alicepass```
  - Move bottom right pane => CTRL+B RIGHT
  - Run ```bin/client.dart -U bob -P bobpass```
