# Learner App 📚

A Flutter mobile application developed to provide a simple and user-friendly learning experience. The application demonstrates user authentication, REST API integration, local data persistence, navigation, settings, favorites, profile management, and local notifications.

## 🚀 Features

- User Signup
- User Login
- Form Validation
- Home Screen
- Learning Content from REST API
- Detail Screen
- Favorites
- Profile
- Local Data Persistence
- Settings Menu
- Theme Settings
- Notification Settings
- Local Notifications
- Logout Functionality

## 🛠️ Technologies Used

- Flutter
- Dart
- REST API
- JSON
- HTTP
- SharedPreferences
- flutter_local_notifications

## 🔗 API Integration

The application uses **JSONPlaceholder** as a demonstration REST API to fetch learning-related content.

The fetched data is processed and displayed in the application interface.

## 💾 Local Storage

The application uses **SharedPreferences** for local persistence.

It is used to store simple user information and application preferences so that the required data can remain available after the application is reopened.

## 🔔 Notifications

The application demonstrates local notification functionality.

Users can configure notification preferences and test notifications within the application.

## 📱 Application Screens

The application includes the following screens:

1. Login Screen
2. Signup Screen
3. Home Screen
4. Detail Screen
5. Favorites Screen
6. Profile Screen
7. Settings Menu
8. Settings Screen
9. Notifications Screen

## 🔐 Authentication

The application provides:

- User registration
- Login validation
- User data storage
- Logout functionality
- Navigation between authentication screens

## ⚙️ Settings

The settings section provides options for managing application preferences, including:

- Profile
- Theme settings
- Notification settings
- Other application options
- Logout

## 🧭 Navigation

The application uses Flutter navigation to move between different screens.

Users can navigate from the home screen to details, favorites, profile, settings, and other available sections.

## 🎯 Learning Outcomes

Through this project, I practiced:

- Flutter UI development
- Dart programming
- Screen navigation
- Form validation
- REST API integration
- JSON data handling
- Local storage
- State management
- Settings implementation
- Local notifications
- Authentication flow
- Git and GitHub

## 📂 Project Structure

```text
learner_app/
│
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
│
├── lib/
│   ├── screens/
│   │   ├── signup_screen.dart
│   │   ├── login_screen.dart
│   │   ├── home_screen.dart
│   │   ├── detail_screen.dart
│   │   ├── favorites_screen.dart
│   │   ├── profile_screen.dart
│   │   ├── settings_menu_screen.dart
│   │   ├── settings_screen.dart
│   │   └── notifications_screen.dart
│   │
│   ├── services/
│   │   ├── storage_service.dart
│   │   ├── api_service.dart
│   │   └── notification_service.dart
│   │
│   └── main.dart
│
├── evidence/
├── test/
├── USER_STORIES.md
├── README.md
├── pubspec.yaml
└── analysis_options.yaml
```

## ▶️ How to Run

### Prerequisites

Make sure Flutter is installed on your computer.

Check your Flutter installation:

```bash
flutter --version
1. Clone the Repository
git clone https://github.com/niharikapatel26106-alt/learner_app.git
2. Open the Project
cd learner_app
3. Install Dependencies
flutter pub get
4. Run the Application
flutter run
```

📸 Screenshots

Screenshots of the application can be added here to demonstrate the main features and user interface.

📋 User Stories

The project includes nine user stories describing the expected functionality and user experience of the application.

See the USER_STORIES.md file for the complete user stories.

📌 Project Status

Completed

This project was developed as part of Flutter mobile application development coursework and demonstrates the implementation of common mobile application features.

👩‍💻 Author

Niharika Patel

BSc IT Student | Full-Stack Developer

🔗 GitHub Repository

https://github.com/niharikapatel26106-alt/learner_app
