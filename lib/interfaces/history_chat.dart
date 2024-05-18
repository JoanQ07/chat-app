import 'package:chat_app/interfaces/message.dart';
import 'package:chat_app/interfaces/user.dart';

class ResHChat {
  List<HChatModel>? data;
  bool success;
  String message;

  ResHChat({
    required this.data,
    required this.success,
    required this.message,
  });

  factory ResHChat.fromJson(Map<String, dynamic> json) => ResHChat(
        data: List<HChatModel>.from(
            json["data"].map((x) => HChatModel.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}

class HChatModel {
  String? id;
  List<UserModel>? idsUsers;
  String? createdAt;
  String? updatedAt;
  MessageModel? lastMsg;

  HChatModel({
    this.id,
    this.idsUsers,
    this.createdAt,
    this.updatedAt,
    this.lastMsg,
  });

  factory HChatModel.fromJson(Map<String, dynamic> json) => HChatModel(
        id: json["_id"],
        idsUsers: json["idsUsers"] != null
            ? List<UserModel>.from(json["idsUsers"]
                .map((userJson) => UserModel.fromJson(userJson)))
            : null,
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        lastMsg: json["lastMsg"] != null
            ? MessageModel.fromJson(json["lastMsg"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "idsUsers": List<UserModel>.from(idsUsers!.map((x) => x.toJson())),
        "lastMsg": lastMsg?.toJson(),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
