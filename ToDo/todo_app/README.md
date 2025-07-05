# ✅ Task 1 – Taskly

Taskly is a beautiful and functional To-Do List app built using **Flutter** for the [CODSOFT Android Development Internship]. It allows users to add, update, delete, and manage daily tasks with priorities, categories, and due dates — all stored locally using Hive.

---

## 🚀 Features

- 📝 Add, Edit, Delete tasks
- ✅ Mark tasks as completed
- ⏳ Set priorities (Low, Medium, High)
- 📆 Add due dates and categories
- 🔍 Search and filter tasks (Coming soon!)
- 📈 Daily completion stats (Coming soon!)
- 💾 Local storage using Hive
- 🧠 Clean Architecture + BLoC + Freezed

---


## 💡 Tech Stack

- **Flutter**
- **BLoC** for state management
- **Hive CE** for local storage
- **Freezed** for data classes
- **SharedPreferences** for one-time login name

---

## 🛠 How to Run

```bash
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter run
