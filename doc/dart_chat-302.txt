# Mobile Client

## Packages used
- **flutter**
https://pub.dartlang.org/packages/flutter

## Impacted files
- ```dart_chat_flutter```
  - ```pubspec.yaml```
  - ```lib/main.dart```
  - ```lib/widgets/chat_login.dart```
  - ```lib/widgets/chat_messages.dart```
  - ```lib/widgets/chat_screen.dart```

## Mobile client
- In ```dart_chat_flutter``` sub-project
  - Remove ```test``` directory
  - Open ```pubspec.yaml```
    - Add ```dart_chat_common``` as dependencies
    - Click on **Get dependencies**
  - Update ```lib/main.dart```
  - Create ```lib/widgets/chat_login.dart```
  - Create ```lib/widgets/chat_messages.dart```
  - Create ```lib/widgets/chat_screen.dart```

## Mobile client tests
- In console, launch ```open -a Simulator.app```
- In ```dart_chat_flutter``` sub-project
  - Run ```main.dart```
