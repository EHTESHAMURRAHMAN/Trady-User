import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trady/app/Api/Api.dart';
import 'package:trady/app/Api/Api_Path.dart';
import 'package:trady/app/Api/Base_Api.dart';
import 'package:trady/app/Data/storage.dart';
import 'package:trady/app/Model/AuthResp.dart';
import 'package:trady/app/Model/Category_List.dart';
import 'package:trady/app/Model/MyBooking_Resp.dart';
import 'package:trady/app/Model/Profile_response.dart';
import 'package:trady/app/Model/Vendor_Resp.dart';
import 'package:trady/app/Model/common_model.dart';

class ApiImport extends API {
  @override
  Future<ApiResponse> signUpApi(Map body) async {
    ApiResponse apiResponse = await postRequestAPI(signup, body);
    if (apiResponse.status) {
      AuthResp response = authRespFromJson(apiResponse.data);
      return ApiResponse.success(response);
    }
    return ApiResponse.failed(apiResponse.message);
  }

  @override
  Future<ApiResponse> signInApi(Map body) async {
    ApiResponse apiResponse = await postRequestAPI(signin, body);
    if (apiResponse.status) {
      AuthResp response = authRespFromJson(apiResponse.data);
      return ApiResponse.success(response);
    }
    return ApiResponse.failed(apiResponse.message);
  }

  @override
  Future<ApiResponse> getProfileApi(int id) async {
    ApiResponse apiResponse = await getRequestAPI('$getprofile/$id');
    if (apiResponse.status) {
      ProfileResp response = profileRespFromJson(apiResponse.data);
      saveUserData(response.data!);
      return ApiResponse.success(response);
    }
    return ApiResponse.failed(apiResponse.message);
  }

  void saveUserData(ProfileData userResponse) {
    final prefs = Get.find<SharedPreferences>();
    var mData = prefs.getString(StorageConstants.userInfo);
    List<ProfileData> users = mData == null
        ? []
        : List<ProfileData>.from(
            jsonDecode(mData).map((x) => ProfileData.fromJson(x)));
    var mList =
        users.where((element) => element.id == userResponse.id).toList();

    if (mList.isEmpty) {
      users.add(userResponse);
    }

    String encodedData = jsonEncode(users.map((x) => x.toJson()).toList());
    prefs.setString(StorageConstants.userInfo, encodedData);
    userInfo = userResponse;
  }

  @override
  Future<ApiResponse> getCategoryApi() async {
    ApiResponse apiResponse = await getRequestAPI(category);
    if (apiResponse.status) {
      CategoryResponse response = categoryResponseFromJson(apiResponse.data);
      return ApiResponse.success(response);
    }
    return ApiResponse.failed(apiResponse.message);
  }

  @override
  Future<ApiResponse> getVendorListApi(int id) async {
    ApiResponse apiResponse = await getRequestAPI('$getvenders/$id');
    if (apiResponse.status) {
      VendorResponse response = vendorResponseFromJson(apiResponse.data);
      return ApiResponse.success(response);
    }
    return ApiResponse.failed(apiResponse.message);
  }

  @override
  Future<ApiResponse> bookVendorApi(Map body) async {
    ApiResponse apiResponse = await postRequestAPI(bookVendor, body);
    if (apiResponse.status) {
      CommonResponse response = commonResponseFromJson(apiResponse.data);
      return ApiResponse.success(response);
    }
    return ApiResponse.failed(apiResponse.message);
  }

  @override
  Future<ApiResponse> myBookingApi(int id) async {
    ApiResponse apiResponse = await getRequestAPI('$getUserbooking/$id');
    if (apiResponse.status) {
      MyBookingResponse response = myBookingResponseFromJson(apiResponse.data);
      return ApiResponse.success(response);
    }
    return ApiResponse.failed(apiResponse.message);
  }
  //   String encodedData = jsonEncode(users.map((x) => x.toJson()).toList());
  //   prefs.setString(StorageConstants.userInfo, encodedData);
  //   userInfo = userResponse;
  // }

  // @override
  // Future<ApiResponse> signinApi(Map body) async {
  //   ApiResponse apiResponse = await postRequestAPI(signin, body);
  //   if (apiResponse.status) {
  //     AuthResp response = authRespFromJson(apiResponse.data);
  //     return ApiResponse.success(response);
  //   }
  //   return ApiResponse.failed(apiResponse.message);
  // }

  // @override
  // Future<ApiResponse> getCategoryApi() async {
  //   ApiResponse apiResponse = await getRequestAPI(category);
  //   if (apiResponse.status) {
  //     CategoryResp response = categoryRespFromJson(apiResponse.data);
  //     return ApiResponse.success(response);
  //   }
  //   return ApiResponse.failed(apiResponse.message);
  // }

  // @override
  // Future<ApiResponse> getSubCategoryApi(int id) async {
  //   ApiResponse apiResponse = await getRequestAPI('$subcategory/$id');
  //   if (apiResponse.status) {
  //     SubcategoryResp response = subcategoryRespFromJson(apiResponse.data);
  //     return ApiResponse.success(response);
  //   }
  //   return ApiResponse.failed(apiResponse.message);
  // }

  // @override
  // Future<ApiResponse> getVendorListApi(int vid) async {
  //   ApiResponse apiResponse = await getRequestAPI('$getVendorList/$vid');
  //   if (apiResponse.status) {
  //     VendorListResp response = vendorListRespFromJson(apiResponse.data);
  //     return ApiResponse.success(response);
  //   }
  //   return ApiResponse.failed(apiResponse.message);
  // }

  // @override
  // Future<ApiResponse> getVendersApi(int id) async {
  //   ApiResponse apiResponse = await getRequestAPI('$venders/$id');
  //   if (apiResponse.status) {
  //     VendersResp response = vendersRespFromJson(apiResponse.data);
  //     return ApiResponse.success(response);
  //   }
  //   return ApiResponse.failed(apiResponse.message);
  // }

  // @override
  // Future<ApiResponse> getUserBookingApi(int id) async {
  //   ApiResponse apiResponse = await getRequestAPI('$getUserbooking/$id');
  //   if (apiResponse.status) {
  //     UserBookingsResp response = userBookingsRespFromJson(apiResponse.data);
  //     return ApiResponse.success(response);
  //   }
  //   return ApiResponse.failed(apiResponse.message);
  // }

  // @override
  // Future<ApiResponse> getvenderBookingApi(int id) async {
  //   ApiResponse apiResponse = await getRequestAPI('$getVenderbooking/$id');
  //   if (apiResponse.status) {
  //     VendorBookingsResp response =
  //         vendorBookingsRespFromJson(apiResponse.data);
  //     return ApiResponse.success(response);
  //   }
  //   return ApiResponse.failed(apiResponse.message);
  // }

  // @override
  // Future<ApiResponse> bookingApi(Map body) async {
  //   ApiResponse apiResponse = await postRequestAPI(booking, body);
  //   if (apiResponse.status) {
  //     BookResp response = bookRespFromJson(apiResponse.data);
  //     return ApiResponse.success(response);
  //   }
  //   return ApiResponse.failed(apiResponse.message);
  // }

  // @override
  // Future<ApiResponse> cancelBookingApi(
  //     int bookingId, String cancelledBy) async {
  //   try {
  //     String url =
  //         '$apiHost/$cancelbooking?bookingId=$bookingId&cancelledBy=$cancelledBy';

  //     final response = await post(Uri.parse(url));
  //     ApiResponse apiResponse = responseFilter(response);

  //     if (apiResponse.status) {
  //       BookResp responseData = bookRespFromJson(apiResponse.data as String);
  //       if (kDebugMode) {
  //         print('Success Response: ${jsonEncode(responseData.toJson())}');
  //       }
  //       return ApiResponse.success(responseData);
  //     } else {
  //       if (kDebugMode) {
  //         print('Error Response: ${apiResponse.data}');
  //       }
  //       return ApiResponse.failed(
  //           apiResponse.message ?? 'Failed to cancel booking');
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Exception: $e');
  //     }
  //     return ApiResponse.failed(e.toString());
  //   }
  // }

  // @override
  // Future<ApiResponse> addVendorServiceApi(Map body) async {
  //   ApiResponse apiResponse = await postRequestAPI(addVendorService, body);
  //   if (apiResponse.status) {
  //     VendorServiceResp response =
  //         vendorServiceRespFromJson(apiResponse.data as String);
  //     return ApiResponse.success(response);
  //   }
  //   return ApiResponse.failed(apiResponse.message);
  // }
}
