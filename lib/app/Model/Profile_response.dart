import 'dart:convert';

ProfileResp profileRespFromJson(String str) =>
    ProfileResp.fromJson(json.decode(str));

String profileRespToJson(ProfileResp data) => json.encode(data.toJson());

class ProfileResp {
  ProfileResp({
    required this.status,
    required this.message,
    this.data,
  });

  final bool status;
  final String message;
  final ProfileData? data;

  factory ProfileResp.fromJson(Map<String, dynamic> json) => ProfileResp(
        status: json["status"] == "succeed",
        message: json["message"] ?? '',
        data: json["data"] != null ? ProfileData.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status ? "succeed" : "failed",
        "message": message,
        "data": data?.toJson(),
      };
}

class ProfileData {
  ProfileData({
    required this.id,
    required this.email,
    required this.pass,
  });

  final int id;
  final String email;
  final String pass;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["id"] ?? 0,
        email: json["email"] ?? '',
        pass: json["pass"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "pass": pass,
      };
}
