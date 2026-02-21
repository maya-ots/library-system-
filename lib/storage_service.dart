import 'dart:convert';
import 'dart:io';
import 'book.dart';
import 'user.dart';

class StorageService {
  final String booksFile = "books.json";
  final String usersFile = "users.json";

  void saveBooks(List<Book> books) {
    List<Map<String, dynamic>> jsonList = books.map((b) => {
      'id': b.id,
      'title': b.title,
      'author': b.author,
      'category': b.category,
      'isAvailable': b.isAvailable,
      'borrowCount': b.borrowCount,
      'summary': b.summary,
      'isbn': b.isbn,
    }).toList();
    File(booksFile).writeAsStringSync(jsonEncode(jsonList));
  }

  List<Book> loadBooks() {
    if (!File(booksFile).existsSync()) return [];
    String jsonString = File(booksFile).readAsStringSync();
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((b) => Book(
      b['id'], b['title'], b['author'], b['category'],
      isAvailable: b['isAvailable'],
      borrowCount: b['borrowCount'],
      summary: b['summary'] ?? '',
      isbn: b['isbn'] ?? '',
    )).toList();
  }

  void saveUsers(List<User> users) {
    List<Map<String, dynamic>> jsonList = users.map((u) => {
      'username': u.username,
      'password': u.password,
      'role': u.role,
      'borrowedBookIds': u.borrowedBookIds,
      'dueDates': u.dueDates.map((key, value) => MapEntry(key.toString(), value)),
    }).toList();
    File(usersFile).writeAsStringSync(jsonEncode(jsonList));
  }

  List<User> loadUsers() {
    if (!File(usersFile).existsSync()) return [];
    String jsonString = File(usersFile).readAsStringSync();
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((u) {
      final user = User(u['username'], u['password'], u['role']);
      user.borrowedBookIds = u['borrowedBookIds'] != null
          ? List<int>.from(u['borrowedBookIds'])
          : <int>[];

      if (u['dueDates'] != null) {
        final Map due = Map<String, dynamic>.from(u['dueDates']);
        user.dueDates = Map<int, String>.fromEntries(
          due.entries.map((e) => MapEntry(int.parse(e.key.toString()), e.value.toString())),
        );
      } else {
        user.dueDates = <int, String>{};
      }

      return user;
    }).toList();
  }
}