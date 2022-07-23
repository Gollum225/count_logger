import 'persistence/database.dart';
import 'package:hive/hive.dart';

part '../generated/model/counter.g.dart';

/// Hält die Gesamtanzahl an Counts und die Count Historie.
///
/// @author Colin Begero
/// @version 1.0

@HiveType(typeId: 3)
class Counter {

  @HiveField(0)
  String _id = "";

  @HiveField(1)
  String name = "";

  /// Hält die Gesamtanzahl an Log Einträgen
  int _counts = 0;

  /// Hält Objekt, dass für persistente Speicherung verantwortlich ist
  late Database _database;

  /// Konstruktor
  Counter() {
    _database = Database(_id);
  }

  /// Muss vor allen anderen Methoden aufgerufen werden.
  init() async {
    await _database.init();
    _counts = _database.getObjects().length;
  }

  /// Fügt eine neue Zeit hinzu
  add(DateTime time) {
    _counts++;
    _database.addObject(time);
    _exceptionCheck();
  }

  /// Gibt eine Liste mit allen Events zurück.
  getEvents() {
    return _database.getObjects();
  }

  /// Gibt die an Events, die in der Datenbank sind.
  getCounts() {
    return _counts;
  }

  /// Entfernt ein Element aus der Datenbank.
  deleteEvent(DateTime event) {
    if (_database.deleteObject(event)) {
      _counts--;
    }
    _exceptionCheck();
  }

  /// Prüft, ob der Counter richtig mitgezählt wurde und der Größe der
  /// liste entspricht.
  _exceptionCheck() {
    if (_counts != _database.getObjects().length) {
      throw Exception('Unevenly incremented variables, which should be the same');
    }
  }
}