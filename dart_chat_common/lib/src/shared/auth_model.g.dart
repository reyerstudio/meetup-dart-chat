// GENERATED CODE - DO NOT MODIFY BY HAND

part of dart_chart.auth_model;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) =>
    new AuthToken(token: json['token'] as String);

abstract class _$AuthTokenSerializerMixin {
  String get token;
  Map<String, dynamic> toJson() => <String, dynamic>{'token': token};
}

AuthTokenData _$AuthTokenDataFromJson(Map<String, dynamic> json) =>
    new AuthTokenData(
        userId: json['u'] as String,
        creationDate:
            json['c'] == null ? null : DateTime.parse(json['c'] as String),
        expirationDate:
            json['e'] == null ? null : DateTime.parse(json['e'] as String));

abstract class _$AuthTokenDataSerializerMixin {
  String get userId;
  DateTime get creationDate;
  DateTime get expirationDate;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'u': userId,
        'c': creationDate?.toIso8601String(),
        'e': expirationDate?.toIso8601String()
      };
}
