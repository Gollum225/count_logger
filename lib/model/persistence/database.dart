import 'package:count_logger/exceptions/database_not_loaded_exception.dart';
import 'package:count_logger/model/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Speichert Objekte in einer Hive Datenbank
/// init() Methode muss aufgerufen werden, bevor das erste Mal Daten gelesen
/// oder geschrieben werden.
///
/// @author Niklas Weber
/// @version 1.0
class Database<E> {
  static bool _hiveInitialised = false;
  bool _databaseLoaded = false;
  late String _databaseName;
  late Box<E> _database;

  Database(String name) {
    _databaseName = name;
  }

  /// Muss einmalig aufgerufen werden,
  /// bevor eine der unteren Methoden verwendet wird
  init() async {
    if (!_hiveInitialised) {
      await Hive.initFlutter();
      Hive.registerAdapter(UserAdapter());
      _hiveInitialised = true;
    }
    _database = await Hive.openBox<E>(_databaseName);
    _databaseLoaded = true;
  }

  /// Gibt eine Liste aus allen Objekten in der Datenbank zurück
  /// @throws database_not_loaded_exception, wenn init() Methode noch nicht
  /// aufgerufen wurde
  E? getObject<T>(T key) {
    _isLoaded();
    return _database.get(key);
  }

  /// Gibt eine Liste aus allen Objekten in der Datenbank zurück
  /// @throws database_not_loaded_exception, wenn init() Methode noch nicht
  /// aufgerufen wurde
  List getObjects() {
    _isLoaded();
    final list = _database.values.toList();
    return list;
  }

  /// Fügt ein neues Objekt in die Datenbank ein
  /// @param key: Schlüssel unter dem das Objekt abgelegt werden soll
  /// @param objectToAdd: Objekt das hinzugefügt werden soll
  /// @throws database_not_loaded_exception, wenn init() Methode noch nicht
  /// aufgerufen wurde
  addObject<T>(T key, E objectToAdd) {
    _isLoaded();
    _database.put(key, objectToAdd);
  }

  /// Löscht ein Objekt aus der Datenbank
  /// @param key: Schlüssel des zu löschenden Objekts
  /// @throws database_not_loaded_exception, wenn init() Methode noch nicht
  /// aufgerufen wurde
  deleteObject<T>(T key) {
    _isLoaded();
    _database.delete(key);
  }

  _isLoaded() {
    if (!_databaseLoaded) {
      throw DatabaseNotLoadedException(_databaseName);
    }
  }
}
