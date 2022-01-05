import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:rest_api_test/bindings/initial_binding.dart';
import 'package:rest_api_test/router/app_pages.dart';
import 'package:rest_api_test/router/app_routes.dart';
import 'package:rest_api_test/views/home/screens/home_screen.dart';

void main() async  {

  await dotenv.load(fileName: "assets/.env.dev");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recipe App',
      initialBinding: InitBinding(),
      getPages: AppRouter.routes,
      initialRoute:Routes.HOME_SCREEN,

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

