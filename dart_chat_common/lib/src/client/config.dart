import 'package:args/args.dart';
import 'package:logging/logging.dart';

import 'package:dart_chat_common/config.dart';

class ClientConfig {
  String host;
  int port;
  bool secure;
  String username;
  String password;
  Level log;

  String get apiUrl => "${secure ? 'https' : 'http'}://${host}:${port}";
  String get wsUrl => "${secure ? 'wss' : 'ws'}://${host}:${port}";
}

ClientConfig loadConfig(List<String> args) {
  var parser = new ArgParser()
    ..addOption('host', abbr: 'h', defaultsTo: chatHostAddress)
    ..addOption('port', abbr: 'p', defaultsTo: chatHostPort.toString())
    ..addFlag('secure', abbr: 's', defaultsTo: false, negatable: false)
    ..addOption('username', abbr: 'U')
    ..addOption('password', abbr: 'P')
    ..addOption('log', abbr: 'l', help: 'Log level', defaultsTo: 'INFO')
    ..addFlag('help');

  // Parse command line arguments
  var results = parser.parse(args);
  if (results['help'] == true) {
    print(parser.usage);
    return null;
  }

  return new ClientConfig()
    ..host = results['host']
    ..port = int.parse(results['port'])
    ..secure = results['secure']
    ..username = results['username']
    ..password = results['password']
    ..log =
    Logger.root.level = Level.LEVELS.firstWhere((level) => level.name == results['log'], orElse: () => Level.ALL);
}
