# GitHub Copilot Instructions for Fullphysio Flutter Demo App

## Project Overview

Fullphysio is a Flutter application for physical therapists. The app contains three main modules:

- **Knowledge**: video courses and clinical content
- **Care**: patients and exercise management
- **Academy**: user’s own trainings

The app is a technical demo to showcase navigation, modularity, Riverpod, Freezed, and integration with Firebase (auth & Firestore).

---

## Architecture & Folder Structure

Follow a **feature-first and simple structure** for maintainability:

```

lib/
├── main.dart
├── core/
│   ├── constants.dart
│   ├── firebase\_service.dart    # Firebase setup & helpers
│   ├── widgets/                # Shared widgets (AppButton, etc.)
│   └── theme.dart
├── features/
│   ├── knowledge/
│   │   ├── models/
│   │   │   └── video\_content.dart  # Freezed model
│   │   ├── providers/
│   │   │   └── video\_provider.dart # Riverpod providers (use Firebase or mock)
│   │   ├── pages/
│   │   │   └── knowledge\_home\_page.dart
│   │   └── widgets/
│   ├── care/
│   │   ├── models/   # patient.dart, exercise.dart, program.dart, etc.
│   │   ├── providers/
│   │   ├── pages/
│   │   └── widgets/
│   ├── academy/
│   │   ├── models/
│   │   ├── providers/
│   │   ├── pages/
│   │   └── widgets/
│   └── navigation/   # Drawer, routes, navigation helpers
├── assets/
└── README.md

```

- **Each feature** only has `models/`, `providers/`, `pages/`, `widgets/` (no complex domain/data split).
- Models use **Freezed** and JSON serialization if data comes from Firestore.

---

## Functional Requirements

### Styling

- Use **Material3** design.
- Follow **mobile-first** responsive design principles.
- The primary color is **#00189b** (dark blue).

### Navigation

- Use a **Drawer** for main navigation, accessible everywhere.
- Drawer sections :
  - **Knowledge** (submenus: Modules, Masterclass, Webinars, Clinical Practices, Clinical Tests)
  - **Care** (submenus: My Patients, Exercises, Program Templates, Clinical Tools, Protocols)
  - **Academy** (submenu: My Trainings)
- Selecting a menu or submenu navigates to the right page (GoRouter or Navigator 2.0 recommended).

---

### Module Features

#### Knowledge

- Each submenu displays a list of videos (from Firebase Firestore or mock).
- List item: title, description, duration, "View" button.

#### Care

- My Patients: list from Firestore (or mock), each with name, age, pathology, "View" button.
- Patient details: details, assigned programs, "Add Program" button (opens dialog).
- Exercises: list of exercises (name, icon/image, tags).
- Program Templates, Clinical Tools, Protocols: each displays a relevant list.

#### Academy

- My Trainings: list from Firestore (or mock), with name, status (in progress/completed), progress bar, percentage.

---

### Firebase Integration

- Use **Firebase Auth** (email/password login or anonymous, as you prefer).
- Use **Firestore** for all main data collections (`videos`, `patients`, `trainings`, etc.).
- Provide a mock data fallback if Firebase is not available.
- Create helpers in `core/firebase_service.dart`.

---

### Technical Requirements

- State management: **Riverpod** (`providers/` in each feature)
- Data models: **Freezed** (`models/` in each feature)
- Modular structure, clean navigation
- Material3 design, responsive mobile-first
- Mock or real Firebase data
- Shared widgets in `core/widgets/`

---

### Bonus

- Theme toggle (light/dark)
- Custom reusable widgets (AppButton, ProgressBar, PatientCard, etc.)
- Providers can simulate loading/error for realism
- README with setup, build_runner for Freezed, Firebase config, etc.

---

## Example Entity: Patient Model (Freezed, for Firestore)

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  const factory Patient({
    required String id,
    required String name,
    required int age,
    required String pathology,
    List<String>? assignedPrograms,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);
}
```

---

## How to Run & Build

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
# Add your Firebase config (see README)
flutter run
```

---

## README Checklist

- How to set up Firebase config
- How to run code generation (Freezed)
- How to launch the app
- Folder structure
- How to add a new feature/page/model
- Coding conventions (Freezed, Riverpod, etc.)
