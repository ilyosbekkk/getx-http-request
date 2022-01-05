

import 'package:get/get.dart';
import 'package:rest_api_test/bindings/home_screen_binding.dart';
import 'package:rest_api_test/router/app_pages.dart';
import 'package:rest_api_test/views/details/screens/details_screen.dart';
import 'package:rest_api_test/views/home/screens/home_screen.dart';

class AppRouter{

  AppRouter._();


  static final routes = [
    GetPage(
      name: Routes.HOME_SCREEN,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_SCREEN,
      page: () => const DetailScreen(),
    ),

  ];
}