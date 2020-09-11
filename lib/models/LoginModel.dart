import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.result,
  });

  Status status;
  Result result;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: Status.fromJson(json["status"]),
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "result": result.toJson(),
      };
}

class Result {
  Result({
    this.token,
    this.user,
  });

  String token;
  User user;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.roleId,
    this.name,
    this.email,
    this.image,
    this.phone,
    this.settings,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.points,
    this.leaderId,
    this.gender,
    this.notes,
    this.empNumber,
    this.fbId,
    this.departmentId,
    this.startingDate,
    this.status,
    this.addedBy,
  });

  int id;
  String roleId;
  String name;
  String email;
  dynamic image;
  String phone;
  List<dynamic> settings;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  dynamic points;
  dynamic leaderId;
  String gender;
  dynamic notes;
  dynamic empNumber;
  dynamic fbId;
  dynamic departmentId;
  dynamic startingDate;
  String status;
  dynamic addedBy;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        phone: json["phone"],
        settings: List<dynamic>.from(json["settings"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        points: json["points"],
        leaderId: json["leader_id"],
        gender: json["gender"],
        notes: json["notes"],
        empNumber: json["emp_number"],
        fbId: json["fb_id"],
        departmentId: json["department_id"],
        startingDate: json["starting_date"],
        status: json["status"],
        addedBy: json["added_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "email": email,
        "image": image,
        "phone": phone,
        "settings": List<dynamic>.from(settings.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "points": points,
        "leader_id": leaderId,
        "gender": gender,
        "notes": notes,
        "emp_number": empNumber,
        "fb_id": fbId,
        "department_id": departmentId,
        "starting_date": startingDate,
        "status": status,
        "added_by": addedBy,
      };
}

class Status {
  Status({
    this.code,
    this.message,
  });

  int code;
  String message;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
