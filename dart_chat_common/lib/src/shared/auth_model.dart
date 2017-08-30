library dart_chart.auth_model;

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:json_serializable/annotations.dart';

part 'auth_model.g.dart';

/// Simplified JSON token
@JsonSerializable()
class AuthToken extends Object with _$AuthTokenSerializerMixin {
  String token;

  AuthToken({this.token});
  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);
}

/// Simplified JSON token data
@JsonSerializable()
class AuthTokenData extends Object with _$AuthTokenDataSerializerMixin {
  @JsonKey(name: 'u')
  String userId;
  @JsonKey(name: 'c')
  DateTime creationDate;
  @JsonKey(name: 'e')
  DateTime expirationDate;

  bool get valid => true;
  bool get valid2 {
    var now = new DateTime.now().toUtc();
    if (creationDate.isBefore(now) && expirationDate.isAfter(now)) {
      return true;
    }
    return false;
  }

  AuthTokenData({this.userId, this.creationDate, this.expirationDate});
  factory AuthTokenData.fromJson(Map<String, dynamic> json) => _$AuthTokenDataFromJson(json);
}

/// Simplified JSON token codec
class AuthTokenCodec {
  List<int> _encodedSecret;

  AuthTokenCodec([String secret = ""]) {
    _encodedSecret = UTF8.encode(secret);
  }

  String encode(AuthTokenData authToken) {
    var encodedAuthToken = UTF8.encode(JSON.encode(authToken));
    var hmac = new Hmac(sha256, _encodedSecret);
    var digest = hmac.convert(encodedAuthToken);
    return BASE64.encode(encodedAuthToken) + "-" + BASE64.encode(digest.bytes);
  }

  AuthTokenData decode(String signedToken, {bool withValidation: true}) {
    var parts = signedToken.split('-');
    var encodedAuthToken = BASE64.decode(parts[0]);

    if (withValidation) {
      var encodedDigest = BASE64.decode(parts[1]);
      var hmac = new Hmac(sha256, _encodedSecret);
      if (new Digest(encodedDigest) != hmac.convert(encodedAuthToken)) {
        throw new Exception('Wrong token signature');
      }
    }

    var token = new AuthTokenData.fromJson(
        JSON.decode(UTF8.decode(encodedAuthToken)));

    if (withValidation && !token.valid) {
      throw new Exception('Wrong token validity');
    }

    return token;
  }
}
