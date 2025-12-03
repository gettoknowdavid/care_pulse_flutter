import 'dart:convert';

final class KeyUtils {
  const KeyUtils._();

  // The input 'passkey' is a standard Dart String.
  // The Dart base64Encode function requires a list of bytes (Uint8List).
  // The utf8.encode() function converts the String into Uint8List.
  String encryptKey(String passkey) => base64Encode(utf8.encode(passkey));

  // The input 'passkey' is the Base64 String.
  // The Dart base64Decode function returns a list of bytes (Uint8List).
  // The utf8.decode() function converts the list of bytes back into a String.
  String decryptKey(String passkey) => utf8.decode(base64Decode(passkey));
}
