String generateKey() {
  String baseKey = "abcdefghijklmnop";
  return baseKey.padRight(32, '0');
}
