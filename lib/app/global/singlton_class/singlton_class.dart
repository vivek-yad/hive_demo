class AppState {
 /// AppState class has a private constructor (AppState._internal())
  static final AppState _singleton = AppState._internal();


  ///factory constructor that returns the _singleton instance
  factory AppState() {
    return _singleton;
  }

  AppState._internal();

  ///AppState class also has a private _username variable that can be accessed using a getter and a setter.
  late String _username;

  String get username => _username;

  set username(value) {
    _username = value;
  }
}
