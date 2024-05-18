class MessageModel {
  String? id;
  String? idUser;
  String? idChat;
  String? text;
  String? createdAt;
  String? updatedAt;

  MessageModel({
    this.id,
    this.idUser,
    this.idChat,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["_id"],
        idUser: json["idUser"],
        idChat: json["idChat"],
        text: json["text"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "idUser": id,
        "idChat": idChat,
        "text": text,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
