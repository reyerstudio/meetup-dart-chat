import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ansicolor/ansicolor.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:web_socket_channel/io.dart';

import 'package:dart_chat_common/client.dart';
import 'package:dart_chat_common/shared.dart';

final _log = new Logger('client');

Future<Null> main(List<String> args) async {
  var config = loadConfig(args);
  if (config == null) {
    exit(1);
  }
  initLogging(config.log);
  readCredentials(config);
  await startApp(config);
}

void readCredentials(ClientConfig config) {
  if (config.username == null) {
    stdout.write("Username: ");
    config.username = stdin.readLineSync();
  }

  if (config.password == null) {
    stdout.write("Password: ");
    stdin.echoMode = false;
    config.password = stdin.readLineSync();
    stdin.echoMode = true;
    stdout.writeln();
  }
}

Future startApp(ClientConfig config) async {
  bool messageSending = false;
  var service = new ChatService(
    new IOClient(),
        (url) => new IOWebSocketChannel.connect(url),
    config,
  );
  service.onMessage = (message) {
    if (messageSending == true) {
      messageSending = false;
    } else {
      stdout.writeln();
    }
    drawApp(service);
  };

  // Login user
  var user = await service.login(config.username, config.password);
  if (user == null) {
    stderr.writeln("Wrong credentials");
    exit(1);
  }

  // Draw UI
  drawApp(service);

  // Listen lines from stdin
  stdin.transform(new Utf8Decoder()).transform(new LineSplitter()).listen(
        (String text) {
      if (text.trim().isNotEmpty) {
        messageSending = true;
        service.sendMessage(text);
      } else {
        drawApp(service);
      }
    },
  );
}

void drawApp(ChatService service) {
  AnsiPen headerPen = new AnsiPen()
    ..white()
    ..rgb(r: 33.0 / 256, g: 150.0 / 256, b: 243.0 / 256, bg: true);
  AnsiPen ownMessagePen = new AnsiPen()
    ..black()
    ..rgb(r: 187.0 / 256, g: 222.0 / 256, b: 251.0 / 256, bg: true);
  AnsiPen messagePen = new AnsiPen()..white();
  const String appHeader = "  Dart Chat";

  var messages = service.messages;
  var users = service.users;
  var user = service.user;

  var cols = stdout.terminalColumns;
  var lines = stdout.terminalLines;

  String header = user == null ? appHeader : "$appHeader - ${user.username}";
  List<ChatMessage> msgLines;

  if (messages.length > lines - 3) {
    var skip = messages.length - (lines - 3);
    msgLines = messages.skip(skip).toList();
  } else {
    msgLines = messages;
  }

  for (var line = 0; line < lines - 1; line++) {
    if (line == 0) {
      stdout.writeln(headerPen.write(header + " " * (cols - header.length)));
    } else if (line == lines - 2) {
      stdout.writeln("-" * cols);
    } else {
      var msgIndex = line - 1;
      if (msgIndex < msgLines.length) {
        var msg = msgLines[msgIndex];
        var text = "  ${users[msg.userId].username}: ${msg.text}";
        if (msg.userId == service.user.id) {
          stdout.writeln(ownMessagePen.write(text + " " * (cols - text.length)));
        } else {
          stdout.writeln(messagePen.write(text + " " * (cols - text.length)));
        }
      } else {
        stdout.writeln();
      }
    }
  }
  stdout.write("> ");
}
