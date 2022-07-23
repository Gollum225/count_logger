class DatabaseNotLoadedException implements Exception {
  static const String errorMessage = "Trying to access database before it was loaded: ";
  late String databaseName;
  DatabaseNotLoadedException(this.databaseName);

  @override
  String toString() {
    return errorMessage + databaseName;
  }
}