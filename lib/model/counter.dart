import 'persistence/database.dart';
import 'package:hive/hive.dart';

part '../generated/model/counter.g.dart';

/// Hält die Gesamtanzahl an Counts und die Count Historie.
///
/// @author Colin Begero
/// @version 1.0

@HiveType(typeId: 3)
class Counter {
  static final Counter _singleton = Counter._internal();

  @HiveField(0)
  String _id = "";

  @HiveField(1)
  String name = "";

  late List<DateTime> _newEvents;

  /// Hält die Gesamtanzahl an Log Einträgen
  int _counts = 0;

  /// Hält Objekt, dass für persistente Speicherung verantwortlich ist
  late Database _database;

  /// Konstruktor
  factory Counter() {
    return _singleton;
  }

  Counter._internal() {
    _database = Database(_id);
    _database.init();
  }

  add(DateTime time) {
    _counts++;
    _newEvents.add(time);
    _database.addObject(time);
    _exceptionCheck();
  }

  getEvents() {
    List allEvents = _database.getObjects();
    allEvents.addAll(_newEvents);
    return allEvents;
  }

  getCounts() {
    return _counts;
  }

  deleteEvent(DateTime event) {
    if (_database.getObjects().remove(event) || _newEvents.remove(event)) {
      _counts--;
    }
    _exceptionCheck();
  }

  _exceptionCheck() {
    if (_counts != _database.getObjects().length) {
      throw Exception('Unevenly incremented variables, which should be the same');
    }
  }

  //neue Ereignisse in die Datenbank schreiben und die Liste leeren.
  writeToDatabase() {
    //_database.safe(_newEvents);
    //_newEvents = [];
  }

}