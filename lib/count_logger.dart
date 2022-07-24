import 'model/user.dart';
import 'model/counter.dart';
import 'model/persistence/database.dart';

/// Main Klasse des Programms
class CountLogger {
  static const String countersDatabase = "counters";
  late User user;
  late Set<Counter> counters;
  late Database countersDB;

  CountLogger() {
    countersDB = Database<Counter>(countersDatabase);
  }

  init() async {
    await countersDB.init();
    for (Counter counter in countersDB.getObjects()) {
      counters.add(counter);
    }
  }

  createCounter() {
    Counter counter = Counter();
    countersDB.addObject(counter);
  }
}