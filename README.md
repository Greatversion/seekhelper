# 👥 SeekHelperPro – Flutter User Directory App

A beautiful, responsive, and animated user management app built with **Flutter**, implementing **Provider for state management**, **GoRouter**, **Hero animations**, and **API integration**. Easily add, view, and search users with a smooth UI and modern UX.

---

## 🚀 Features

- 🔍 **Search** users by name
- ➕ **Add** new users via a dedicated screen
- 🔁 **Dynamic list** updates on user addition
- 🌐 **API Integration** with loading & error handling
- ✨ **Hero animations** between home & detail screens
- 💡 **Modern UI** using Material Design & animations
- 📶 **Offline handling** with helpful error messages
- 🔎 **Live filtering** with instant search experience

---

## 📱 Screenshots

| Home Screen | Detail Screen | Add User |
|------------|---------------|----------|
| ![Home](screenshots/home.png) | ![Detail](screenshots/detail.png) | ![Add](screenshots/add.png) |

> (Replace with real screenshots in `/screenshots` directory)

---

## 🧑‍💻 Tech Stack

- **Flutter**
- **Provider** for state management
- **GoRouter** for navigation
- **REST API** (`jsonplaceholder.typicode.com`)
- **Material Design** with `ThemeMode`
- **Animations**: `flutter_staggered_animations`, `Hero`

---

## 🏗️ Project Structure

lib/
│
├── models/
│ └── userModel.dart
│
├── services/
│ └── api.service.dart
│
├── view_model/
│ └── userViewModel.dart
│
├── views/
│ ├── home/
│ │ └── homeScreen.dart
│ ├── user_detail/
│ │ └── userDetailScreen.dart
│ └── addUserScreen.dart
│
├── resources/
│ ├── themes.dart
│ └── shimmer.dart
│
└── app.dart

yaml
Copy code

---

## 🛠️ Getting Started

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/seekhelperpro.git

# 2. Navigate to project directory
cd seekhelperpro

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run
🔗 API Source
Using JSONPlaceholder for mock user data.

🧪 To-Do / Improvements
🌍 Add persistent storage

🎨 User avatars with network images

🔔 Push notifications

✏️ Edit/Delete user functionality

🌐 Multi-language support


