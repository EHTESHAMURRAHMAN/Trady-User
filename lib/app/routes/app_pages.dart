import 'package:get/get.dart';

import '../modules/Bookvendors/bindings/bookvendors_binding.dart';
import '../modules/Bookvendors/views/bookvendors_view.dart';
import '../modules/Credentials/bindings/credentials_binding.dart';
import '../modules/Credentials/views/credentials_view.dart';
import '../modules/Dashboard/bindings/dashboard_binding.dart';
import '../modules/Dashboard/views/dashboard_view.dart';
import '../modules/Home/bindings/home_binding.dart';
import '../modules/Home/views/home_view.dart';
import '../modules/MyBookings/bindings/my_bookings_binding.dart';
import '../modules/MyBookings/views/my_bookings_view.dart';
import '../modules/Onboard/bindings/onboard_binding.dart';
import '../modules/Onboard/views/onboard_view.dart';
import '../modules/Setting/bindings/setting_binding.dart';
import '../modules/Setting/views/setting_view.dart';
import '../modules/Splash/bindings/splash_binding.dart';
import '../modules/Splash/views/splash_view.dart';
import '../modules/VendorList/bindings/vendor_list_binding.dart';
import '../modules/VendorList/views/vendor_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.CREDENTIALS,
      page: () => CredentialsView(),
      binding: CredentialsBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: _Paths.VENDOR_LIST,
      page: () => const VendorListView(),
      binding: VendorListBinding(),
    ),
    GetPage(
      name: _Paths.BOOKVENDORS,
      page: () => const BookvendorsView(),
      binding: BookvendorsBinding(),
    ),
    GetPage(
      name: _Paths.MY_BOOKINGS,
      page: () => const MyBookingsView(),
      binding: MyBookingsBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
  ];
}
