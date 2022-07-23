import 'user.dart';
import 'package:hive/hive.dart';

part '../generated/model/log_entry.g.dart';

@HiveType(typeId: 2)
class LogEntry {
  @HiveField(0)
  late DateTime time;

  @HiveField(1)
  late User user;

  LogEntry(this.time, this.user);
}