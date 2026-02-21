// ======================================================
// ABSTRACT CLASSES
// ======================================================
abstract class Database {
  Future<void> save();
  Future<void> load();
}