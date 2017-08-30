import 'package:logging/logging.dart';
import 'package:logging_handlers/server_logging_handlers.dart';

// Initialize logger
initLogging(Level level) {
  hierarchicalLoggingEnabled = true;
  Logger.root.level = level;
  Logger.root.onRecord.listen(new LogPrintHandler());
}
