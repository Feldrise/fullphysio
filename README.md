# Fullphysio – Flutter Demo App

Fullphysio is a demo Flutter application for physical therapists (**kinésithérapeutes**) featuring modular navigation, Firebase integration, Riverpod for state management, and immutable models with Freezed.  
The app is structured for extensibility and is ideal for technical interviews, live coding, or learning Flutter best practices.

---

## ✨ Features

- **Modular navigation** with a Drawer
- Three main modules:
  - **Knowledge**: video courses, clinical content
  - **Care**: patient, exercises & programs management
  - **Academy**: user's own trainings
- **Firebase Auth** (email or anonymous)
- **Cloud Firestore** for all data (videos, patients, trainings, etc.)
- **Freezed** for data models (immutable, with JSON support)
- **Riverpod** for robust state management
- **Material 3** design, clean UI, and mobile-first responsiveness
- **Mock data fallback** if Firebase isn't configured

---

## 🗂️ Project Structure

```

lib/
├── main.dart
├── core/
│   ├── constants.dart
│   ├── firebase\_service.dart
│   ├── widgets/
│   └── theme.dart
├── features/
│   ├── knowledge/
│   │   ├── models/
│   │   ├── providers/
│   │   ├── pages/
│   │   └── widgets/
│   ├── care/
│   │   ├── models/
│   │   ├── providers/
│   │   ├── pages/
│   │   └── widgets/
│   ├── academy/
│   │   ├── models/
│   │   ├── providers/
│   │   ├── pages/
│   │   └── widgets/
│   └── navigation/
├── assets/
└── README.md

```

Each feature is **independent**:

- `models/` : Freezed data models
- `providers/` : Riverpod providers (handle Firebase & mock data)
- `pages/` : main screens
- `widgets/` : feature-specific UI components

---

## 🚀 Getting Started

### 1. Prerequisites

- Flutter SDK >= 3.0.0
- Dart >= 2.18.0
- [Firebase CLI](https://firebase.google.com/docs/cli)
- A Firebase project (see below)

### 2. Clone the Repository

```bash
git clone https://github.com/your-org/fullphysio
cd fullphysio
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Setup Firebase

1. **Create a Firebase project** in the [Firebase Console](https://console.firebase.google.com/).
2. **Add a Firebase app** for your platform (Android/iOS/Web).
3. Download your `google-services.json` (Android) or `GoogleService-Info.plist` (iOS), and place them in the appropriate directories as described in the [FlutterFire docs](https://firebase.flutter.dev/docs/overview/).
4. For web, add your config in `web/index.html` or use `flutterfire configure`.
5. (Optional) Enable **Authentication** and **Firestore** in the Firebase Console.

### 5. Generate Freezed Files

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

> ⚠️ You must re-run this command if you modify any Freezed models.

### 6. Run the App

```bash
flutter run
```

---

## 🔐 Environment Configuration

- If Firebase config is missing or disabled, the app will **fallback to local mock data**.
- You can switch between real and mock providers in each feature's `providers/`.

---

## 🛠️ Code Style & Conventions

- **Freezed**: all models are immutable and serializable (`*.freezed.dart`, `*.g.dart`)
- **Riverpod**: all state is handled by providers (`StateNotifierProvider`, etc.)
- **Providers** : one per resource/list, e.g. `patientsProvider`, `videosProvider`
- **Widgets**: favor small, composable widgets
- **Theme**: Material 3, custom themes in `core/theme.dart`
- **Navigation**: GoRouter (recommended), routes managed in `features/navigation/`

---

## 👨‍💻 Adding a New Feature

1. Create a new folder in `lib/features/your_feature/`
2. Add `models/`, `providers/`, `pages/`, and `widgets/` as needed
3. Use Freezed for your models:

   ```dart
   @freezed
   class MyModel with _$MyModel { ... }
   ```

4. Create Riverpod providers for state/data
5. Add navigation entry in the Drawer & GoRouter config
6. Add your UI in `pages/` and reusable components in `widgets/`

---

## 🧪 Running Tests

```bash
flutter test
```

Add your test files in the `test/` directory.

---

## 📦 Build for Production

- **Android**:

  ```bash
  flutter build apk --release
  ```

- **iOS**:

  ```bash
  flutter build ios --release
  ```

- **Web**:

  ```bash
  flutter build web
  ```

---

## 🙏 Credits

- Inspired by modern Flutter best practices
- Uses [Freezed](https://pub.dev/packages/freezed), [Riverpod](https://pub.dev/packages/riverpod), [FlutterFire](https://firebase.flutter.dev/)

---

## 📝 License

This project is for demo, interview, and educational use only.

---

**Enjoy building with Fullphysio!**
