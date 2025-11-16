# Secure Notes App

A Flutter application for creating, editing, and managing notes with biometric authentication security.

## Features

- **Biometric Authentication**: Secure access to notes using fingerprint or Face ID
- **CRUD Operations**: Create, Read, Update, and Delete notes
- **Reorderable Notes**: Drag and drop to reorder your notes
- **Swipe to Delete**: Swipe left on any note to delete it
- **SQLite Database**: Persistent local storage
- **Localization**: Support for English and Swahili languages
- **Material Design 3**: Modern UI with light and dark theme support

## Setup Instructions

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Generate Localization Files

```bash
flutter gen-l10n
```

### 3. Android Configuration

The `AndroidManifest.xml` is already configured with biometric permissions:
- `USE_BIOMETRIC`
- `USE_FINGERPRINT`

### 4. iOS Configuration

Add the following to your `ios/Runner/Info.plist`:

```xml
<key>NSFaceIDUsageDescription</key>
<string>We need to use Face ID to authenticate and secure your notes</string>

<key>CFBundleLocalizations</key>
<array>
    <string>en</string>
    <string>sw</string>
</array>
```

### 5. Run the App

```bash
flutter run
```

## Project Structure

```
lib/
├── l10n/                      # Localization files
│   ├── app_en.arb            # English translations
│   └── app_sw.arb            # Swahili translations
├── models/
│   └── note.dart             # Note model
├── screens/
│   ├── auth_screen.dart      # Biometric authentication screen
│   ├── home_screen.dart      # Main notes list screen
│   ├── add_note_screen.dart  # Add new note screen
│   └── edit_note_screen.dart # Edit existing note screen
├── services/
│   ├── database.dart         # SQLite database service
│   └── auth_service.dart     # Biometric authentication service
└── main.dart                  # App entry point
```

## Database Schema

The app uses SQLite with the following schema:

```sql
CREATE TABLE notes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  position INTEGER NOT NULL,
  createdAt TEXT NOT NULL,
  updatedAt TEXT NOT NULL
)
```

## Database Methods

The `DatabaseService` class provides the following CRUD operations:

- `addNote(Note note)` - Add a new note
- `getAllNotes()` - Get all notes ordered by position
- `getNote(int id)` - Get a specific note
- `updateNote(Note note)` - Update an existing note
- `deleteNote(int id)` - Delete a note
- `deleteAllNotes()` - Delete all notes
- `updateNotePositions(List<Note> notes)` - Update positions after reordering

## Features Details

### Authentication
- Uses `local_auth` package for biometric authentication
- Supports fingerprint and Face ID
- Fallback to device PIN/password if biometric is unavailable
- Authentication required on app launch

### Notes Management
- **Add Notes**: Tap the floating action button (+) to create a new note
- **Edit Notes**: Tap on any note to edit its title and description
- **Delete Notes**: Swipe left on a note and tap delete
- **Reorder Notes**: Long press and drag notes to reorder them

### Localization
The app supports multiple languages:
- English (en)
- Swahili (sw)

Language is automatically selected based on device settings.

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.0          # SQLite database
  path_provider: ^2.1.1    # Access file system
  path: ^1.8.3             # Path manipulation
  local_auth: ^2.1.7       # Biometric authentication
  flutter_slidable: ^3.0.0 # Swipe to delete
  intl: ^0.18.0            # Internationalization
```

## Testing on Physical Device

Biometric authentication requires a physical device or emulator with:
- Fingerprint sensor (Android)
- Face ID or Touch ID (iOS)
- Enrolled biometric data

For testing without biometric hardware, the authentication will fall back to device PIN/password.

## Notes

- All data is stored locally on the device
- Notes persist even after closing the app
- Authentication is required every time the app is launched
- The app follows Material Design 3 guidelines
- Supports both light and dark themes

## License

This project is created for educational purposes as part of the Zone01 Kisumu curriculum.