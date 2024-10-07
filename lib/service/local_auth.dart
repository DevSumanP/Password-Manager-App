// auth_service.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> isDeviceSupported() async {
    try {
      return await auth.isDeviceSupported();
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> canCheckBiometrics() async {
    try {
      return await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
      return <BiometricType>[];
    }
  }

  Future<bool> authenticate() async {
    try {
      return await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(stickyAuth: true),
      );
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> authenticateWithBiometrics(BuildContext context) async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await auth.authenticate(
        localizedReason: 'Touch the biometric sensor',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
    }

    return isAuthenticated;
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
  }
}
