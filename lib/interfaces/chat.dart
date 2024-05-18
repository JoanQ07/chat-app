import 'package:chat_app/interfaces/user.dart';

class ResChat {
  List<ChatModel> data;
  bool success;
  String message;

  ResChat({
    required this.data,
    required this.success,
    required this.message,
  });

  factory ResChat.fromJson(Map<String, dynamic> json) => ResChat(
        data: List<ChatModel>.from(
            json["data"].map((x) => ChatModel.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}

class ChatModel {
  String id;
  UserModel idUser;
  String idChat;
  String text;
  String createdAt;
  String updatedAt;

  ChatModel({
    required this.id,
    required this.idUser,
    required this.idChat,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["_id"],
        idUser: UserModel.fromJson(json["idUser"]),
        idChat: json["idChat"],
        text: json["text"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "idUser": idUser.toJson(),
        "idChat": idChat,
        "text": text,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
