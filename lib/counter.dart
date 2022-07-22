import 'model/persistence.dart';

/// Hält die Gesamtanzahl an Counts und die Count Historie.
///
/// @author Colin Begero
/// @version 1.0
class Counter {
  static final Counter _singleton = Counter._internal();

  // late List<DateTime> _events;
  late List<DateTime> _newEvents;
  int _counts = 0;
  var _database;

  ///Konstruktor
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
    _exceptionCheck();
  }

  getEvents() {
    List<DateTime> allEvents = _database.getEvents;
    allEvents.addAll(_newEvents);
    return allEvents;
  }

  getCounts() {
    return _counts;
  }

  deleteEvent(DateTime event) {
    if (_database.getEvents().remove(event) || _newEvents.remove(event)) {
      _counts--;
    }
    _exceptionCheck();
  }

  _exceptionCheck() {
    if (_counts != _database.getEvents().length) {
      throw Exception('Unevenly incremented variables, which should be the same');
    }
  }

  //neue Ereignisse in die Datenbank schreiben und die Liste leeren.
  writeToDatabase() {
    _database.safe(_newEvents);
    _newEvents = [];
  }

}