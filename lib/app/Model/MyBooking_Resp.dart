import 'dart:convert';

MyBookingResponse myBookingResponseFromJson(String str) =>
    MyBookingResponse.fromJson(json.decode(str));

String myBookingResponseToJson(MyBookingResponse data) =>
    json.encode(data.toJson());

class MyBookingResponse {
  MyBookingResponse({
    required this.bookingstatus,
    required this.message,
    required this.data,
  });

  final bool bookingstatus;
  final String message;
  final List<MyBooking> data;

  factory MyBookingResponse.fromJson(Map<String, dynamic> json) =>
      MyBookingResponse(
        bookingstatus:
            json["bookingstatus"] == "succeed" || json["bookingstatus"] == true,
        message: json["message"] ?? '',
        data: List<MyBooking>.from(
            (json["data"] ?? []).map((x) => MyBooking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bookingstatus": bookingstatus ? "succeed" : "failed",
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MyBooking {
  MyBooking({
    required this.bookingId,
    required this.venderId,
    required this.venderUniqueId,
    required this.userName,
    required this.userAddress,
    required this.userPhone,
    required this.bookingDate,
    required this.bookingstatus,
    required this.venderName,
    required this.todate,
    required this.categoryname,
  });

  final int bookingId;
  final int venderId;
  final String venderUniqueId;
  final String userName;
  final String userAddress;
  final String userPhone;
  final String bookingDate;
  final int bookingstatus;
  final String venderName;
  final String todate;
  final String categoryname;

  factory MyBooking.fromJson(Map<String, dynamic> json) => MyBooking(
        bookingId: json["booking_id"] ?? 0,
        venderId: json["vender_id"] ?? 0,
        venderUniqueId: json["vender_unique_id"] ?? '',
        userName: json["user_name"] ?? '',
        userAddress: json["user_address"] ?? '',
        userPhone: json["user_phone"] ?? '',
        bookingDate: json["booking_date"] ?? '',
        bookingstatus: json["bookingstatus"] ?? '',
        venderName: json["vender_name"] ?? '',
        todate: json["to_date"] ?? '',
        categoryname: json["category_name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "vender_id": venderId,
        "vender_unique_id": venderUniqueId,
        "user_name": userName,
        "user_address": userAddress,
        "user_phone": userPhone,
        "booking_date": bookingDate,
        "bookingstatus": bookingstatus,
        "vender_name": venderName,
        "to_date": todate,
        "category_name": categoryname,
      };
}
