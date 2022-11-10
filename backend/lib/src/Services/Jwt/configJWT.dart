import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class configJwt {
  final String key =
      "qMIV#zaWwX}on(v374hvmXXim2K/;o2lz5-_vuF_3fzV;I?D:s>{NM>zh%rh2yB";

  String generateToken(Map claims, String audiance) {
    final jwt = JWT(claims, audience: Audience.one(audiance));
    return jwt.sign(SecretKey(key));
  }

  verifyToken({required String token, required String audiance}) {
    JWT.verify(token, SecretKey(key), audience: Audience.one(audiance));
  }
}
