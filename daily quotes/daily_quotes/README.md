
---

### ✅ **README for Task 2 – QuoteSpark (Quote of the Day App)**

```markdown
# ✅ Task 2 – QuoteSpark

QuoteSpark is a delightful Flutter app that displays a new inspiring quote each day. Users can **refresh**, **favorite**, and **share** quotes with others. All favorite quotes are saved locally using Hive and viewable anytime.

---

## 🚀 Features

- 🌟 Displays daily quote (from ZenQuotes API)
- ❤️ Mark/unmark quotes as favorite
- 📤 Share quotes via social apps
- 📚 View all saved favorite quotes
- 🧠 Clean Architecture + BLoC + Freezed

---


## 💡 Tech Stack

- **Flutter**
- **ZenQuotes API** (`https://zenquotes.io/api/random`)
- **BLoC** for state management
- **Hive CE** for storage
- **Freezed** for data classes
- **Share Plus** for social sharing

---

## 🛠 How to Run

flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter run
