import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_rest/shelf_rest.dart' as shelf_rest;
import 'package:shelf_route/shelf_route.dart' as shelf_route;
import 'package:shelf_web_socket/shelf_web_socket.dart' as shelf_ws;

import 'package:dart_chat_vm/server.dart';
import 'package:dart_chat_common/shared.dart';

final _log = new Logger('server');

Future<Null> main(List<String> args) async {
  var config = loadConfig(args);
  if (config == null) {
    exit(1);
  }
  initLogging(config.log);

  // Open database
  var db = new Db(config.dbUrl);
  await db.open();

  // Create authentication token codec.
  var authTokenCodec = new AuthTokenCodec(config.secret);

  // Create Chat API Server.
  var chatApi = new ChatApi(authTokenCodec, db, config.secret);

  // Create Chat Websockets Server.
  var wsServer = new WebsocketManagerServer(authTokenCodec);

  // Create handlers.
  var router = shelf_rest.router()
    ..add("/ws", null, shelf_ws.webSocketHandler(wsServer.onConnection))
    ..addAll(chatApi, path: '/chat', middleware: shelf.logRequests(logger: (String msg, bool err) {
      var log = msg.split("\t").skip(1).join("\t");
      if (err) {
        _log.warning(log);
      } else {
        _log.info(log);
      }
    }));

  // Add CORS headers middleware
  var handler = const shelf.Pipeline().addMiddleware(corsMiddleware).addHandler(router.handler);

  // Print routes
  _log.info("Generated routes");
  shelf_route.printRoutes(router, printer: _log.info);

  // Start serving with Shelf.
  var server = await shelf_io.serve(handler, config.host, config.port);
  _log.info("Listening on ${server.address.host}:${server.port}");
}
