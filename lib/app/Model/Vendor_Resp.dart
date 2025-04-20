import 'dart:convert';

VendorResponse vendorResponseFromJson(String str) =>
    VendorResponse.fromJson(json.decode(str));

String vendorResponseToJson(VendorResponse data) => json.encode(data.toJson());

class VendorResponse {
  VendorResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<Vendor> data;

  factory VendorResponse.fromJson(Map<String, dynamic> json) => VendorResponse(
        status: json["status"] == "succeed",
        message: json["message"] ?? '',
        data: List<Vendor>.from(json["data"].map((x) => Vendor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status ? "succeed" : "failed",
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Vendor {
  Vendor({
    required this.id,
    required this.vendorName,
    required this.venderId,
    required this.address,
    required this.img,
  });

  final int id;
  final String vendorName;
  final String venderId;
  final String address;
  final String img;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"] ?? 0,
        vendorName: json["name"] ?? '',
        venderId: json["venderid"] ?? '',
        address: json["addres"] ?? '',
        img: json["img"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": vendorName,
        "venderid": venderId,
        "addres": address,
        "img": img,
      };
}
