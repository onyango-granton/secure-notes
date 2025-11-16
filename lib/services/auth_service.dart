import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class AuthService {
  static final AuthService instance = AuthService._init();
  final LocalAuthentication _auth = LocalAuthentication();

  AuthService._init();

  // Check if device supports biometric authentication
  Future<bool> canAuthenticate() async {
    try {
      return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
    } on PlatformException {
      return false;
    }
  }

  // Get available biometric types
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException {
      return [];
    }
  }

  // Authenticate user
  Future<bool> authenticate() async {
    try {
      bool canAuth = await canAuthenticate();
      if (!canAuth) {
        return false;
      }

      return await _auth.authenticate(
        localizedReason: 'Please authenticate to access your notes',
        biometricOnly: true
      );
    } on PlatformException catch (e) {
      print('Authentication error: $e');
      return false;
    }
  }
}