import 'package:flutter/material.dart';

import 'package:dart_chat_common/client.dart';
import 'package:dart_chat_common/shared.dart';

typedef void OnLogin(ChatUser user);

class ChatLogin extends StatefulWidget {
  final ChatService _chatService;
  final OnLogin _onLogin;

  ChatLogin(this._chatService, this._onLogin);

  @override
  State createState() => new _ChatLoginState(_chatService, _onLogin);
}

class _ChatLoginState extends State<ChatLogin> {
  final ChatService _chatService;
  final OnLogin _onLogin;
  String username;
  String password;
  bool sending = false;

  TextEditingController _usernameController;
  TextEditingController _passwordController;

  _ChatLoginState(this._chatService, this._onLogin) {
    username = _chatService.config.username;
    password = _chatService.config.password;
  }

  @override
  void initState() {
    super.initState();
    _usernameController = new TextEditingController(text: username);
    _passwordController = new TextEditingController(text: password);
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Form(
        child: new Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(labelText: 'Username'),
              onChanged: (String string) => setState(() => username = string),
              controller: _usernameController,
            ),
            new TextField(
              decoration: new InputDecoration(labelText: 'Password'),
              onChanged: (String string) => setState(() => password = string),
              controller: _passwordController,
              obscureText: true,
            ),
            sending
                ? new CircularProgressIndicator()
                : new RaisedButton(
              onPressed: () {
                setState(() => sending = true);

                _chatService.login(username, password).then((loggedUser) {
                  _onLogin(loggedUser);
                }).catchError((e) {
                  showDialog(
                      context: context,
                      child: new SimpleDialog(
                        title: new Text('Login Error: $e'),
                      ));
                }).whenComplete(() {
                  setState(() => sending = false);
                });
              },
              color: Theme.of(context).primaryColor,
              highlightColor: Theme.of(context).highlightColor,
              child: new Text(
                'Submit',
                style: new TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
