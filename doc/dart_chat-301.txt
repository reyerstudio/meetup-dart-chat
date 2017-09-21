# Angular Client

## Packages used
- **angular**
https://pub.dartlang.org/packages/angular
- **angular_form**
https://pub.dartlang.org/packages/angular_form

## Impacted files
- ```dart_chat_angular```
  - ```pubspec.yaml```
  - ```lib/components/app_component.dart```
  - ```lib/components/app_component.html```
  - ```lib/directives/vu_hold_focus.dart```
  - ```lib/directives/vu_scroll_down.dart```
  - ```lib/services/chat_service.dart```
  - ```web/index.dart```
  - ```web/index.html```

## Angular Client
- In ```dart_chat_angular``` sub-project
  - Open ```pubspec.yaml```
    - Add ```angular_form``` and ```dart_chat_common``` as dependencies
    - Click on **Get dependencies**
  - Remove ```test``` directory
  - Remove ```src/todo_list``` directory
  - Rename ```web/main.dart``` into ```web/index.dart```
  - Update ```web/index.html```
  - Update ```web/main.dart```
  - Move ```lib/app_components.*``` into ```lib/components```
  - Update ```lib/components/app_component.dart```
  - Update ```lib/components/app_component.html```
  - Create ```lib/directives/vu_hold_focus.dart```
  - Create ```lib/directives/vu_scroll_down.dart```
  - Create ```lib/services/chat_service.dart```

## Angular Client tests
- In ```dart_chat_angular``` sub-project
  - Run ```web/index.html```
