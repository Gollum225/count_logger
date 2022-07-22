import 'package:shared_preferences/shared_preferences.dart';

/// Speichert Daten persistent
/// init() Methode muss aufgerufen werden, bevor das erste Mal Daten gelesen
/// oder geschrieben werden.
///
/// @author Niklas Weber
/// @version 0.1
class Persistence {
  static final Persistence _instance = Persistence._internal();
  late SharedPreferences _sharedPreferences;

  factory Persistence() {
    return _instance;
  }

  Persistence._internal();

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

}