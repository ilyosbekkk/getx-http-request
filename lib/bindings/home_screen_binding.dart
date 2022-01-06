import 'package:get/get.dart';
import 'package:rest_api_test/controllers/home_screen_controller.dart';
import 'package:rest_api_test/providers/api_provider/api_providers.dart';
import 'package:rest_api_test/providers/api_provider/apis.dart';
import 'package:rest_api_test/repositories/repositories.dart';
class HomeScreenBinding extends Bindings{

  @override
  void dependencies() async  {

    Get.lazyPut(() => RecipesRepository(recipesApi:Get.find<RecipesApi>()), fenix: true );
    Get.put(HomeScreenController());

  }

}