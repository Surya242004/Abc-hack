import 'dart:convert';
import 'package:crypto/crypto.dart';

class CryptoService {
  static String hashData(String data) {
    return sha256.convert(utf8.encode(data)).toString();
  }
}
