import 'package:trady/app/Api/Base_Api.dart';

abstract class API {
  Future<ApiResponse> signUpApi(Map body);
  Future<ApiResponse> signInApi(Map body);
  Future<ApiResponse> getProfileApi(int id);
  Future<ApiResponse> getCategoryApi();
  Future<ApiResponse> getVendorListApi(int id);
  Future<ApiResponse> bookVendorApi(Map body);
  Future<ApiResponse> myBookingApi(int id);

  // Future<ApiResponse> getSubCategoryApi(int id);
  // Future<ApiResponse> getVendersApi(int id);
  // Future<ApiResponse> getUserBookingApi(int id);
  // Future<ApiResponse> getvenderBookingApi(int id);
  // Future<ApiResponse> bookingApi(Map body);
  // Future<ApiResponse> cancelBookingApi(int bookingId, String cancelledBy);
  // Future<ApiResponse> addVendorServiceApi(Map body);
  // Future<ApiResponse> getVendorListApi(int vid);
}
