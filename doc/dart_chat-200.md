# Shared Data Model & Common configuration

## Packages used
- **json_serializable**
https://pub.dartlang.org/packages/json_serializable
- **logging**
https://pub.dartlang.org/packages/logging
- **logging_handlers**
https://pub.dartlang.org/packages/logging_handlers

## Impacted files
- ```dart_chat_common/```
  - ```pubspec.yaml```
  - ```lib/shared/data_model.dart```
  - ```lib/shared/logging.dart```
  - ```lib/config.dart```
  - ```lib/shared.dart```
  - ```tool/build.dart```
  - ```tool/build_actions.dart```
  - ```tool/watch.dart```

## Enable Dart support
- In **Webstorm** window
  - Open ```dart_chat_common/pubspec.yaml``` file
    - Click on **Enable Dart support**
    - Add ```json_serializable```, ```logging``` and ```logging_handlers``` as dependencies
    - Add ```build_runner``` as dev_dependencies
    - Click on **Get dependencies**

## Shared Data model
- In ```dart_chat_common``` sub-project
  - Remove ```example``` and ```test``` directories
  - Rename ```lib/dart_chat_common.dart``` into ```lib/shared.dart```
  - Remove ```lib/src/dart_chat_common.dart```
  - Create ```lib/src/shared/data_model.dart```
  - Create ```lib/shared.dart```
  - From ```https://github.com/dart-lang/json_serializable/tree/master/tool```
    - Copy ```tool/build.dart``` in the project
    - Copy ```tool/build_actions.dart``` in the project
    - Copy ```tool/watch.dart``` in the project
  - In ```tool/build_actions.dart```
    - Replace ```json_serializable``` by ```dart_chat_common```
    - Replace ```inputs: const ['example/*.dart', 'test/test_files/*.dart'])``` by ```inputs: const ['lib/src/shared/*_model.dart'])```
  - Run ```tool/build.dart``` to build ```lib/shared/data_model.g.dart```

## Common configuration
- In ```dart_chat_common``` sub-project
  - In ```pubspec.yaml```
    - Add ```logging``` and ```logging_handlers``` as dependencies
    - Click on **Get dependencies**
  - Create ```lib/shared/logging.dart```
  - Create ```lib/config.dart```
  - In ```lib/shared.dart```, export ```lib/src/shared/logging.dart```
