# Pre-requisites

## Install softwares
- Dart installed
https://www.dartlang.org/install

- Flutter installed
https://flutter.io/setup

- Configure your PATH to use ```pub global```
https://www.dartlang.org/tools/pub/cmd/pub-global#running-a-script-from-your-path

- Webstorm installed
https://www.jetbrains.com/webstorm

- Webstorm IDE Dart and Flutter plugins installed
https://flutter.io/intellij-setup

- MongoDB installed and running
https://www.mongodb.org

## Create project structure

![Create empty project](dart_chat-101.gif)

### Create empty project
- Open **Webstorm**
- Select **Create New Project**
- In **New project** window
  - Select **Empty project**
  - Fill **Location** with ```~/reyer/meetup/dart_chat```
- In **Webstorm** window, open **Webstorm** -> **Preferences** menu
- In **Preferences** window
  - Select **Directories**
  - Click on **x** on right side to **Remove Content Entry** (```~/reyer/meetup/dart_chat```)

[![Create sub-projects](https://asciinema.org/a/utG21QtVPXCOV07bohywY6b5A.png)](https://asciinema.org/a/utG21QtVPXCOV07bohywY6b5A)

### Create sub-projects
- Open **Terminal**
- Create project folders
```
$ mkdir -p ~/reyer/meetup/dart_chat/dart_chat_{common,vm,angular}
```
- Activate **stagehand** for boilerplate
```
$ pub global activate stagehand
```
- Use boilerplate for each project
```
$ cd ~/reyer/meetup/dart_chat/dart_chat_common
$ stagehand package-simple
$ cd ~/reyer/meetup/dart_chat/dart_chat_vm
$ stagehand package-simple
$ cd ~/reyer/meetup/dart_chat/dart_chat_angular
$ stagehand web-angular
$ cd ~/reyer/meetup/dart_chat
$ flutter create dart_chat_flutter
```

![Add Content Roots](dart_chat-103.gif)
![Add Content Roots - Final](dart_chat-104.png)

### Add Content Roots
- In **Webstorm** window, open **Webstorm** -> **Preferences** menu
- In **Preferences** window, select **Directories**
  - Click **Add Content Root** button
  - Select ```~/reyer/meetup/dart_chat/dart_chat_common```
  - Click **Add Content Root** button
  - Select ```~/reyer/meetup/dart_chat/dart_chat_vm```
  - Click **Add Content Root** button
  - Select ```~/reyer/meetup/dart_chat/dart_chat_angular```
  - Click **Apply** button
  - Click **OK** button

![Flutter project](dart_chat-105.png)

### Open Flutter project
- In **Webstorm** window, open **File** -> **Open** menu
- In **Finder** pop-up, select ```~/reyer/meetup/dart_chat/dart_chat_flutter```
