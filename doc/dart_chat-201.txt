# Server

## Packages used
- **args**
https://pub.dartlang.org/packages/args
- **mongo_dart**
https://pub.dartlang.org/packages/mongo_dart
- **random_string**
https://pub.dartlang.org/packages/random_string
- **shelf**
https://pub.dartlang.org/packages/shelf
- **shelf_rest**
https://pub.dartlang.org/packages/shelf_rest

## Impacted files
- ```dart_chat_vm```
  - ```pubspec.yaml```
  - ```bin/db_reference.dart```
  - ```bin/server.dart```
  - ```lib/src/api.dart```
  - ```lib/src/auth.dart```
  - ```lib/src/config.dart```
  - ```lib/src/cors.dart```
  - ```lib/server.dart```

## Server configuration
- In ```dart_chat_vm``` sub-project
  - Open ```pubspec.yaml```
    - Add ```args```, ```dart_chat_common```, ```logging```, ```mongo_dart```, ```random_string``` and ```shelf_rest``` as dependencies
    - Click on **Get dependencies**
  - Remove ```example``` and ```test``` directories
  - Rename ```lib/dart_chat_vm.dart``` into ```lib/server.dart```
  - Remove ```lib/src/dart_chat_vm_dart```
  - Rename ```lib/dart_chat_common_dart``` into ```lib/server.dart```
  - Create ```lib/src/config.dart```
  - In ```lib/server.dart```, export ```lib/src/config.dart```

## Server Authentication
- In ```dart_chat_vm``` sub-project
  - Create ```lib/src/auth.dart```
  - In ```lib/server.dart```, export ```lib/src/auth_model.dart```
- In ```dart_chat_common``` sub-project
  - Create ```lib/src/shared/auth_model.dart```
  - In ```lib/shared.dart```, export ```lib/src/auth_model.dart```
  - Run ```tool/build.dart``` to build ```lib/shared/auth_model.g.dart```

## CORS
- In ```dart_chat_vm``` sub-project
  - Create ```lib/src/cors.dart```
  - In ```lib/server.dart```, export ```lib/src/cors.dart```

## Server Chat API
- In ```dart_chat_vm``` sub-project
  - Create ```lib/src/auth.dart```
  - In ```lib/server.dart```, export ```lib/src/api.dart```
  - Create ```bin/server.dart```

## Server Chat API tests
- In ```dart_chat_vm``` sub-project
  - Run ```bin/server.dart --help```
  - Run ```bin/server.dart```
  - Create ```test/user.json```
  - Create user
    - Run ```curl -v -d@user.json http://localhost:8080/chat/user```
    - Run ```mongo dart_chat```
      - Execute ```db.users.find().pretty()``` to check
    - Copy returned ```_id``` <ID>
  - Authenticate user
    - Run ```curl -v -d@user.json http://localhost:8080/chat/user/auth```
  - Get user by returned ```_id``` from previous step
    - Run ```curl -v curl -v ${ADDR}/chat/user/<ID>```
  - Stop ```bin/server.dart```

## Prepare reference DB
- In ```dart_chat_vm``` sub-project
  - Create ```bin/db_reference.dart```
  - Run ```bin/db_reference.dart```
  - Run ```mongo dart_chat```
      - Execute ```db.users.find().pretty()``` to check
