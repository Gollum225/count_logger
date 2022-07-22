import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Speichert Daten persistent
/// init() Methode muss aufgerufen werden, bevor das erste Mal Daten gelesen
/// oder geschrieben werden.
///
/// @author Niklas Weber
/// @version 1.0
class Persistence {
  static const String historyTableName = "history";
  static final Persistence _instance = Persistence._internal();
  late SharedPreferences _sharedPreferences;
  late var history;

  factory Persistence() {
    return _instance;
  }

  Persistence._internal();

  init() async {
    await Hive.initFlutter();
    history = await Hive.openBox(historyTableName);
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  add<T>(String tableName, T objectToAdd) {
    history.put(objectToAdd);
  }

  int getCount() {
    return 0;
  }

  List<T> getObjects<T>(String tableName) {
    final list = history.values;
    return list;
  }

}