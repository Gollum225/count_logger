import 'model/user.dart';
import 'model/counter.dart';
import 'model/persistence/database.dart';

class CountLogger {
  static const String countersDatabase = "counters";
  late User user;
  late Set<Counter> counters;
  late Database countersDB;

  CountLogger() {
    countersDB = Database<Counter>(countersDatabase);
  }

  init() async {
    countersDB.init();
    for (Counter counter in countersDB.getObjects()) {
      counters.add(counter);
    }
  }
}