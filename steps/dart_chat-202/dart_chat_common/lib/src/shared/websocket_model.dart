library dart_chart.websocket_message;

import 'dart:convert';

import 'package:json_serializable/annotations.dart';

import 'auth_model.dart' show AuthToken;
import 'data_model.dart' show ChatMessage, ChatUser;

part 'websocket_model.g.dart';

/// Websocket messages
@JsonSerializable()
class WebsocketMessage extends Object with _$WebsocketMessageSerializerMixin {
  @JsonKey(name: 't')
  String type;
  @JsonKey(name: 'p')
  String payload;

  WebsocketMessage({this.type, this.payload});

  factory WebsocketMessage.fromJson(Map<String, dynamic> json) => _$WebsocketMessageFromJson(json);
  factory WebsocketMessage.fromObject(Object object) => new WebsocketMessage()
    ..type = object.runtimeType.toString()
    ..payload = JSON.encode(object);

  dynamic toObject() {
    switch (type) {
      case 'AuthToken':
        return new AuthToken.fromJson(JSON.decode(payload));
        break;
      case 'ChatUser':
        return new ChatUser.fromJson(JSON.decode(payload));
        break;
      case 'ChatMessage':
        return new ChatMessage.fromJson(JSON.decode(payload));
        break;
      default:
        throw new ArgumentError("'$type' unknown");
    }
  }
}
