/// Hält die Gesamtanzahl an Counts und die Count Historie.
///
/// @author Colin Begero
/// @version 1.0
class Counter {

  static final Counter _singleton = Counter._internal();
  late List<DateTime> _events;
  int _counts = 0;

  ///Konstruktor
  factory Counter() {
    return _singleton;
  }

  Counter._internal();


  add(DateTime time) {
    _counts++;
    _events.add(time);
    _exceptionCheck();
  }

  getEvents() {
    return _events;
  }
  getCounts() {
    return _counts;
  }

  deleteEvent(DateTime event) {
    _events.remove(event);
    _counts--;
    _exceptionCheck();
  }

  _exceptionCheck() {
    if (_counts != _events.length) {
      throw Exception('Unevenly incremented variables, which should be the same');
    }
  }

}