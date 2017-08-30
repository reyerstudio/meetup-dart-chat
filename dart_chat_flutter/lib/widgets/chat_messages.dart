import 'package:flutter/material.dart';

import 'package:dart_chat_common/client.dart';
import 'package:dart_chat_common/shared.dart';

class ChatMessages extends StatefulWidget {
  final ChatService _chatService;

  ChatMessages(this._chatService);

  @override
  State createState() => new _ChatMessagesState(_chatService);
}

class _ChatMessagesState extends State<ChatMessages> {
  final ChatService _chatService;
  TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  ChatUser get user => _chatService?.user;
  Map<String, ChatUser> get users => _chatService?.users;
  List<ChatMessage> get messages => _chatService.messages;
  void sendMessage(String text) => _chatService?.sendMessage(text);

  _ChatMessagesState(this._chatService) {
    _chatService.onMessage = (message) {
      this.setState(() => null);
    };
  }

  void _handleMessageChanged(String text) {
    setState(() {
      _isComposing = text.trim().isNotEmpty;
    });
  }

  void _handleSubmitted(String text) {
    if (_isComposing) {
      _textController.clear();
      setState(() {
        _isComposing = false;
      });
      sendMessage(text);
    }
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(children: [
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  onChanged: _handleMessageChanged,
                  decoration: new InputDecoration.collapsed(hintText: 'Send a message'),
                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text),
                  )),
            ])));
  }

  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            itemBuilder: (_, int index) => new ChatMessageListItem(_chatService, user, messages[index]),
            itemCount: messages.length,
            reverse: false,
          ),
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ],
    );
  }
}

class ChatMessageListItem extends StatelessWidget {
  final ChatService chatService;
  final ChatUser user;
  final ChatMessage message;

  bool get ownMessage => message.userId == user.id;
  ChatUser get messageUser => chatService?.users[message.userId];

  ChatMessageListItem(this.chatService, this.user, this.message);

  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: new BoxDecoration(
          color: ownMessage ? Theme.of(context).backgroundColor : Theme.of(context).cardColor,
          borderRadius: new BorderRadius.all(
            const Radius.circular(8.0),
          ),
        ),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new Icon(Icons.person),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Text(
                  messageUser?.username,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(message.text),
                ),
              ],
            ),
          ],
        ));
  }
}
