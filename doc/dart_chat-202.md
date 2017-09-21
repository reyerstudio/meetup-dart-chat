# Websocket

## Packages used
- **shelf_web_socket**
https://pub.dartlang.org/packages/shelf_web_socket
- **web_socket_channel**
https://pub.dartlang.org/packages/web_socket_channel

## Impacted files
- ```dart_chat_common```
  - ```pubspec.yaml```
  - ```lib/src/shared/websocket_manager.dart```
  - ```lib/src/shared/websocket_model.dart```
- ```dart_chat_vm```
  - ```lib/src/websocket_manager.dart```
  - ```lib/server.dart```

## Data model
- In ```dart_chat_common``` sub-project
  - Open ```pubspec.yaml```
    - Add ```web_socket_channel``` as dependencies
    - Click on **Get dependencies**
  - Create ```lib/src/shared/websocket_model.dart```
  - In ```lib/shared.dart```, export ```lib/src/shared/websocket_model.dart```
  - Run ```tool/build.dart``` to build ```lib/shared/websocket_model.g.dart```

## Base Manager
- In ```dart_chat_common``` sub-project
  - Create ```lib/src/shared/websocket_manager.dart```
  - In ```lib/shared.dart```, export ```lib/src/shared/websocket_manager.dart```

## Server Manager
- In ```dart_chat_vm``` sub-project
  - Open ```pubspec.yaml```
    - Add ```shelf_web_socket``` as dependencies
    - Click on **Get dependencies**
  - Create ```lib/src/websocket_manager.dart```
  - In ```lib/server.dart```, export ```lib/src/websocket_manager.dart```
  - Update ```bin/server.dart```
  - Run ```bin/server.dart```
