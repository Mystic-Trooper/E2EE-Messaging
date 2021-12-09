import 'dart:convert';

ChatMessageModel chatMessageModelFromJson(String str) =>
    ChatMessageModel.fromJson(json.decode(str));

String chatMessageModelToJson(ChatMessageModel data) =>
    json.encode(data.toJson());

class ChatMessageModel {
  int chatId;
  int to;
  int from;
  String message;
  String chatType;
  String public_key;
  bool toUserOnlineStatus;

  ChatMessageModel({
    this.chatId,
    this.to,
    this.from,
    this.message,
    this.chatType,
    this.public_key,
    this.toUserOnlineStatus,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      ChatMessageModel(
        chatId: json["chat_id"],
        to: json["to"],
        from: json["from"],
        message: json["message"],
        chatType: json["chat_type"],
        public_key: json["public_key"],
        toUserOnlineStatus: json['to_user_online_status'],
      );

  Map<String, dynamic> toJson() => {
        "chat_id": chatId,
        "to": to,
        "from": from,
        "message": message,
        "chat_type": chatType,
        "public_key": public_key,
      };
}
