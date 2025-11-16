// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Secure Notes';

  @override
  String get myNotes => 'My Notes';

  @override
  String get addNote => 'Add Note';

  @override
  String get editNote => 'Edit Note';

  @override
  String get title => 'Title';

  @override
  String get description => 'Description';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get emptyFieldError => 'Please fill in all fields';

  @override
  String get authenticationRequired => 'Authentication Required';

  @override
  String get authenticateToAccess => 'Please authenticate to access your notes';

  @override
  String get authenticate => 'Authenticate';

  @override
  String get authenticationFailed => 'Authentication failed. Please try again.';

  @override
  String get noNotes => 'No notes yet. Tap + to add one!';

  @override
  String get confirmDelete => 'Are you sure you want to delete this note?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';
}
