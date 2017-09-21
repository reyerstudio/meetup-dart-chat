// GENERATED CODE - DO NOT MODIFY BY HAND

part of dart_chart.data_model;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ChatUser _$ChatUserFromJson(Map<String, dynamic> json) => new ChatUser(
    id: json['_id'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
    salt: json['salt'] as String,
    avatar: json['avatar'] as String);

abstract class _$ChatUserSerializerMixin {
  String get id;
  String get username;
  String get password;
  String get salt;
  String get avatar;
  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'username': username,
        'password': password,
        'salt': salt,
        'avatar': avatar
      };
}

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => new ChatMessage(
    id: json['_id'] as String,
    userId: json['userId'] as String,
    text: json['text'] as String);

abstract class _$ChatMessageSerializerMixin {
  String get id;
  String get userId;
  String get text;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'_id': id, 'userId': userId, 'text': text};
}
