// GENERATED CODE - DO NOT MODIFY BY HAND

part of dart_chart.websocket_message;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

WebsocketMessage _$WebsocketMessageFromJson(Map<String, dynamic> json) =>
    new WebsocketMessage(
        type: json['t'] as String, payload: json['p'] as String);

abstract class _$WebsocketMessageSerializerMixin {
  String get type;
  String get payload;
  Map<String, dynamic> toJson() => <String, dynamic>{'t': type, 'p': payload};
}
