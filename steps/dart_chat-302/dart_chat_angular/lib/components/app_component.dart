import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:dart_chat_common/shared.dart';

import '../directives/vu_hold_focus.dart';
import '../directives/vu_scroll_down.dart';
import '../services/chat_service.dart';

@Component(
  selector: 'dart-chat-app',
  templateUrl: 'app_component.html',
  directives: const [
    COMMON_DIRECTIVES,
    formDirectives,
    MaterialIconComponent,
    materialDirectives,
    VuScrollDown,
    VuHoldFocus,
  ],
  providers: const [AngularChatService],
  styleUrls: const ['app_component.css'],
)
class AppComponent {
  final AngularChatService _chatService;

  @ViewChild("textInput")
  MaterialInputComponent textInput;

  String username;
  String password;
  String inputText = "";

  ChatUser get user => _chatService?.user;
  String get avatar => _chatService?.user?.avatar ?? "user.png";
  List<ChatMessage> get messages => _chatService?.messages;

  AppComponent(this._chatService) {
    username = _chatService?.config?.username;
    password = _chatService?.config?.password;
  }

  ChatUser getChatUser(String id) => _chatService?.users[id];
  String getAvatar(String id) => _chatService?.users[id]?.avatar ?? "user.png";

  void sendTextMessage() {
    if (textInput?.inputText?.trim()?.isNotEmpty == true) {
      _chatService.sendMessage(textInput?.inputText?.trim());
      textInput?.inputText = "";
    }
  }

  Future<Null> login() async => _chatService.login(username, password);
  void logout() => _chatService.logout();
}
