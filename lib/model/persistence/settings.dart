import 'package:count_logger/model/log_entry.dart';

import '../user.dart';
import 'database.dart';

class Settings {
  static final Settings _singleton = Settings._internal();
  static const String userDatabaseName = "users";
  late Database _userDatabase;

  /// Konstruktor
  factory Settings() {
    return _singleton;
  }

  Settings._internal() {
    _userDatabase = Database(userDatabaseName);
    _userDatabase.init();
  }

}