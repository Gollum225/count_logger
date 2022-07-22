import 'package:shared_preferences/shared_preferences.dart';
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

}