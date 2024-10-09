import 'package:encrypt/encrypt.dart';
import 'package:password_manager/service/generate_key.dart';

class EncryptionHandler {
  static final _key = Key.fromUtf8(generateKey());

  // Encrypting password using AES algorithm
  static String encryptPassword(String password) {
    final iv = IV.fromLength(16); // Generate random IV
    final encrypter = Encrypter(AES(_key));
    final encrypted = encrypter.encrypt(password, iv: iv);

    // Combine IV and encrypted password for storage
    final combined = "${iv.base64}:${encrypted.base64}";
    return combined;
  }

  // Decrypting password using AES algorithm
  static String decryptPassword(String combined) {
    if (combined.isEmpty || !combined.contains(':')) {
      throw const FormatException('Invalid encrypted password format');
    }

    final parts = combined.split(':');

    if (parts.length != 2) {
      throw const FormatException('Invalid encrypted password format');
    }

    final iv = IV.fromBase64(parts[0]);
    final encryptedPassword = parts[1];

    final encrypter = Encrypter(AES(_key));
    final decrypted = encrypter.decrypt64(encryptedPassword, iv: iv);
    return decrypted;
  }
}
