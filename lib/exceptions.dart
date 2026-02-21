// ======================================================
// EXCEPTIONS
// ======================================================
class BookNotFoundException implements Exception {
  final String message;
  BookNotFoundException(this.message);
  @override
  String toString() => "BookNotFoundException: $message";
}

class UserNotFoundException implements Exception {
  @override
  String toString() => "UserNotFoundException: User does not exist!";
}