import 'package:count_logger/exceptions/database_not_loaded_exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Speichert Daten in einer Hive Datenbank
/// init() Methode muss aufgerufen werden, bevor das erste Mal Daten gelesen
/// oder geschrieben werden.
///
/// @author Niklas Weber
/// @version 1.0
class Database {
  static bool _hiveInitialised = false;
  bool _databaseLoaded = false;
  late String _databaseName;
  late Box _database;

  Database(String name) {
    _databaseName = name;
  }

  init() async {
    if (!_hiveInitialised) {
      await Hive.initFlutter();
      _hiveInitialised = true;
    }
    _database = await Hive.openBox(_databaseName);
    _databaseLoaded = true;
  }

  List getObjects<T>() {
    _isLoaded();
    final list = _database.values.toList();
    return list;
  }

  /// Fügt ein neues Objekt in die Datenbank ein
  /// @throws database_not_loaded_exception, wenn init() Methode noch nicht
  /// aufgerufen wurde
  addObject<T>(T key, T objectToAdd) {
    _isLoaded();
    _database.put(key, objectToAdd);
  }

  _isLoaded() {
    if (!_databaseLoaded) {
      throw DatabaseNotLoadedException(_databaseName);
    }
  }
}
