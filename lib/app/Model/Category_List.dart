import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) =>
    CategoryResponse.fromJson(json.decode(str));
String categoryResponseToJson(CategoryResponse data) =>
    json.encode(data.toJson());

class CategoryResponse {
  CategoryResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<CategoryItem> data;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        status: json["status"] == "succeed",
        message: json["message"] ?? '',
        data: List<CategoryItem>.from(
            json["data"].map((x) => CategoryItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status ? "succeed" : "failed",
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryItem {
  CategoryItem({
    required this.id,
    required this.title,
    required this.img,
  });

  final int id;
  final String title;
  final String img;

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        id: json["id"] ?? '',
        title: json["title"] ?? '',
        img: json["img"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "img": img,
      };
}
