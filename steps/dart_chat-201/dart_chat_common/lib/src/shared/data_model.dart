library dart_chart.data_model;

import 'package:json_serializable/annotations.dart';

part 'data_model.g.dart';

/// User profile.
@JsonSerializable()
class ChatUser extends Object with _$ChatUserSerializerMixin {
  @JsonKey(name: '_id')
  String id;
  String username;
  String password;
  String salt;
  String avatar;

  ChatUser({this.id, this.username, this.password, this.salt, this.avatar});
  factory ChatUser.fromJson(Map<String, dynamic> json) => _$ChatUserFromJson(json);
}

/// Chat message.
@JsonSerializable()
class ChatMessage extends Object with _$ChatMessageSerializerMixin {
  @JsonKey(name: '_id')
  String id;
  String userId;
  String text;

  ChatMessage({this.id, this.userId, this.text});
  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
}
