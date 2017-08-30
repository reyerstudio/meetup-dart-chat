import 'package:crypto/crypto.dart';
import 'package:logging/logging.dart';
import 'package:random_string/random_string.dart';

final _log = new Logger('server.auth');

String hashPassword(String password, String salt, String secret) =>
    sha256.convert(('$salt:$password:$secret').codeUnits).toString();

String generateSalt() => randomAlphaNumeric(24);

