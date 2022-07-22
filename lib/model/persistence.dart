import 'package:shared_preferences/shared_preferences.dart';

/// Speichert Daten persistent
/// init() Methode muss aufgerufen werden, bevor das erste Mal Daten gelesen
/// oder geschrieben werden.
///
/// @author Niklas Weber
/// @version 1.0
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

  safe(List newEvents) async {
    //TODO
    //eventliste.addAll(newEvents);
  }
  set(int counter) {
    //TODO
    //counter = counter;
  }

  int getCount() {
    //TODO
    return 0;
  }

  List getEvents() {
    //TODO
    return [];
  }

}