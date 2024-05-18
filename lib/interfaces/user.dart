class ResUser {
  UserModel data;
  bool success;
  String message;

  ResUser({
    required this.data,
    required this.success,
    required this.message,
  });

  factory ResUser.fromJson(Map<String, dynamic> json) => ResUser(
        data: UserModel.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "success": success,
        "message": message,
      };
}

class UserModel {
  String? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? password;

  UserModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        name: json["name"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "password": password,
      };
}
