import 'persistence.dart';

/// Hält die Gesamtanzahl an Counts und die Count Historie.
///
/// @author Colin Begero
/// @version 1.0
class Counter {
  static final Counter _singleton = Counter._internal();

  late List<DateTime> _newEvents;

  /// Hält die Gesamtanzahl an Log Einträgen
  int _counts = 0;

  /// Hält Objekt, dass für persistente Speicherung verantwortlich ist
  late Persistence _database;

  /// Konstruktor
  factory Counter() {
    return _singleton;
  }

  Counter._internal() {
    _database = Persistence();
    _database.init();
    _counts = _database.getCount();
  }

  add(DateTime time) {
    _counts++;
    _newEvents.add(time);
    _database.addObject(tableName, time);
    _exceptionCheck();
  }

  getEvents() {
    List<DateTime> allEvents = _database.getObjects("history");
    allEvents.addAll(_newEvents);
    return allEvents;
  }

  getCounts() {
    return _counts;
  }

  deleteEvent(DateTime event) {
    if (_database.getObjects("history").remove(event) || _newEvents.remove(event)) {
      _counts--;
    }
    _exceptionCheck();
  }

  _exceptionCheck() {
    if (_counts != _database.getObjects("history").length) {
      throw Exception('Unevenly incremented variables, which should be the same');
    }
  }

  //neue Ereignisse in die Datenbank schreiben und die Liste leeren.
  writeToDatabase() {
    //_database.safe(_newEvents);
    //_newEvents = [];
  }

}