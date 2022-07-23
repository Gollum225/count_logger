import 'package:hive/hive.dart';
import 'dart:math';

part '../generated/model/user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  late String _name;

  @HiveField(1)
  late String _id;

  User() {
    _id = _generateRandomString(10);
  }

  String _generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }
}