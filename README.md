# Meetup - Live Coding - Full Stack Chat Application with Dart, Angular & Flutter

![Screenshot](screenshot.png)

## Background

Alice, Bob, Charlie and Dan are 4 techies friends that would like to chat with a standalone Full Stack Chat Application using Dart, Angular and Flutter.

Alice prefers to use Web application for chatting.

Bob likes Command Line application.

Charlie and Dan regulalry use Android and iOS bases smartphones.

## Steps

* [Pre-requisites](doc/dart_chat-100.md) ([Code](steps/dart_chat-100))
* [Shared Data Model & Common configuration](doc/dart_chat-200.md) ([Code](steps/dart_chat-200))
* [Server](doc/dart_chat-201.md) ([Code](steps/dart_chat-201))
* [Websocket](doc/dart_chat-202.md) ([Code](steps/dart_chat-202))
* [CLI Client](doc/dart_chat-300.md) ([Code](steps/dart_chat-300))
* [Angular Client](doc/dart_chat-301.md) ([Code](steps/dart_chat-301))
* [Android/iOS Clients with Flutter](doc/dart_chat-302.md) ([Code](steps/dart_chat-302))

## LOC
### Common
```
$ cloc dart_chat_common/lib dart_chat_common/tool
      18 text files.
      18 unique files.
       0 files ignored.

github.com/AlDanial/cloc v 1.74  T=0.14 s (125.1 files/s, 3682.2 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Dart                            18            102             24            404
-------------------------------------------------------------------------------
SUM:                            18            102             24            404
-------------------------------------------------------------------------------
```

### Server
```
$ cloc dart_chat_vm/bin/db_reference.dart dart_chat_vm/bin/server.dart dart_chat_vm/lib
       8 text files.
       8 unique files.
       0 files ignored.

github.com/AlDanial/cloc v 1.74  T=0.06 s (140.9 files/s, 5299.5 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Dart                             8             52             23            226
-------------------------------------------------------------------------------
SUM:                             8             52             23            226
-------------------------------------------------------------------------------
```

### CLI Client
```
$ cloc dart_chat_vm/bin/client.dart
       1 text file.
       1 unique file.
       0 files ignored.

github.com/AlDanial/cloc v 1.74  T=0.01 s (79.9 files/s, 10148.5 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Dart                             1             16              3            108
-------------------------------------------------------------------------------
```

### Angular Client
```
$ cloc dart_chat_angular/lib dart_chat_angular/web
      13 text files.
      13 unique files.
       2 files ignored.

github.com/AlDanial/cloc v 1.74  T=0.24 s (45.2 files/s, 4453.9 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Sass                             2             73              0            415
CSS                              2             47             13            315
Dart                             5             35              0            138
HTML                             2              0              0             48
-------------------------------------------------------------------------------
SUM:                            11            155             13            916
-------------------------------------------------------------------------------
```

### Flutter Client
```
 cloc dart_chat_flutter/lib/
       4 text files.
       4 unique files.
       0 files ignored.

github.com/AlDanial/cloc v 1.74  T=0.05 s (76.7 files/s, 6038.8 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Dart                             4             45              0            270
-------------------------------------------------------------------------------
SUM:                             4             45              0            270
-------------------------------------------------------------------------------
```

### Total
```
$ cloc dart_chat_common/lib dart_chat_common/tool dart_chat_vm/bin dart_chat_vm/lib dart_chat_angular/lib dart_chat_angular/web dart_chat_flutter/lib
      44 text files.
      44 unique files.
       2 files ignored.

github.com/AlDanial/cloc v 1.74  T=0.35 s (118.9 files/s, 6671.6 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Dart                            36            250             50           1146
Sass                             2             73              0            415
CSS                              2             47             13            315
HTML                             2              0              0             48
-------------------------------------------------------------------------------
SUM:                            42            370             63           1924
-------------------------------------------------------------------------------
```

## Thanks
Thank you to Dart, AngularDart and Flutter teams.
Thank you to all that inspired me for this project, see list below in alphabetic order:
- [Emily Fortuna](https://github.com/efortuna) - MemeChat
  - [Video @ Google I/O 2017](https://www.youtube.com/watch?v=w2TcYP8qiRI`)
  - [Code @ Github](https://github.com/efortuna/memechat)
- [David Morgan](https://github.com/davidmorgan) - Building a Chat App in Dart
  - [Article @ Medium](https://medium.com/dartlang/building-a-chat-app-in-dart-815fcd0e5a31)
- [Tobe Osakwe](https://github.com/thosakwe) - Building a Real-time Chat App with Angel Dart and Flutter
  - [Article @ Dart Academy](https://dart.academy/building-a-real-time-chat-app-with-angel-and-flutter/)
  - [Code @ Github](https://github.com/angel-example/flutter)
- [Monty Rasmussen](https://github.com/montyr75) - Build a Real-Time Chat Web App with Dart, Angular 2, and Firebase 3
  - [Article @ Dart Academy](https://dart.academy/build-a-real-time-chat-web-app-with-dart-angular-2-and-firebase-3/)
  - [Code @ Github](https://github.com/montyr75/dart_chat_ng2_fb3_start/)
