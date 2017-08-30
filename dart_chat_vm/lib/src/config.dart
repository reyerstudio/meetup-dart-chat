import 'package:args/args.dart';
import 'package:logging/logging.dart';

import 'package:dart_chat_common/config.dart';

class ServerConfig {
  String dbUrl;
  String host;
  int port;
  String secret;
  Level log;
}

ServerConfig loadConfig(List<String> args) {
  var parser = new ArgParser()
    ..addOption('db', abbr: 'd', defaultsTo: 'mongodb://127.0.0.1/dart_chat')
    ..addOption('host', abbr: 'h', defaultsTo: chatHostAddress)
    ..addOption('port', abbr: 'p', defaultsTo: chatHostPort.toString())
    ..addOption('log', abbr: 'l', help: 'Log level', defaultsTo: 'INFO')
    ..addOption('secret', abbr: 's', help: 'JWT secret', defaultsTo: '53cr3T')
    ..addFlag('help');

  // Parse command line arguments
  var results = parser.parse(args);
  if (results['help'] == true) {
    print(parser.usage);
    return null;
  }

  return new ServerConfig()
    ..dbUrl = results['db']
    ..host = results['host']
    ..port = int.parse(results['port'])
    ..secret = results['secret']
    ..log = Logger.root.level = Level.LEVELS.firstWhere(
        (level) => level.name == results['log'],
        orElse: () => Level.ALL);
}
