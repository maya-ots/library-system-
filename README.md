

 #  Library Management System



A **console-based library management system** written in Dart, supporting **admin and student roles**, book borrowing, due dates, fines, search, and basic analytics.




 ## Features

### 1) User Management

* **Register and login** for both admin and student roles.
* **Admin role**: can add new books and view analytics dashboard.
* **Student role**: can borrow, return, and search books.

### 2) Book Management

* Store book details: `title`, `author`, `category`, `ISBN`, `summary`.
* Track availability (`Available` / `Borrowed`).
* Track **borrow count** for analytics and recommendations.
* Persistent storage using **JSON files** (`books.json` and `users.json`).

### 3) Borrowing & Fines

* Borrow books with a **7-day due period**.
* Track **due dates** per student.
* Check **overdue books** and calculate fines (`$1/day`).

### 4) Search

* Search books by:

  * Title
  * Author
  * Category
  * Keyword (fuzzy search in title, author, and summary)
* Case-insensitive search to improve usability.

### 5) Recommendations & Analytics

* Recommend books with the same author or category.
* Admin analytics dashboard shows:

  * Total books
  * Total users
  * Borrowed books
  * Top 5 most popular books

---

## Project Structure

```
my_project/
├── bin/
│   └── main.dart
├── lib/
│   └── abstracts.dart            
│   ├── book.dart         
│   ├── enums.dart          
│   ├── exceptions.dart       
│   ├── isolate_worker.dart 
│   ├── library.dart          
│   ├── mixins.dart       
│   ├── storage_service.dart        
│   └── user.dart             
├── books.json             
└── users.json             
```


## How to Run

1. **Clone the repository:**

```bash
git clone https://github.com/maya-ots/library-system-
cd my_project
```

2. **Run the application:**

```bash
dart run bin/main.dart
```

3. **Follow the console prompts** to:

   * Register or login
   * Borrow or return books
   * Search or add books (if admin)
   * Check fines and recommendations

---

## Example Usage

```text
=== LIBRARY SYSTEM ===
1. Register
2. Login
3. Show Books
4. Exit
Choose an option: 1

Enter username: student1
Enter password: 1234
Choose role (admin/student): student
User registered successfully as student
```

---

## Notes

* Books and users are **persisted in JSON files**, so data is saved between sessions.
* **Admins** have access to additional features like adding books and analytics.
* Search and recommendations are **case-insensitive** for better usability.

---

## Future Improvements

* Add **email notifications** for overdue books.
* Implement **book categories and tags** for more advanced search.
* Add **multi-language support** for the console interface.

---


