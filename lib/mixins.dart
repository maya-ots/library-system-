// ======================================================
// MIXINS
// ======================================================
mixin LoggerMixin {
  void log(String msg) => print("[LOG] $msg");
}

mixin TimeMixin {
  DateTime get now => DateTime.now();
}