import 'package:get/get.dart';
import 'package:rest_api_test/controllers/home_screen_controller.dart';
import 'package:rest_api_test/providers/api_provider/api.dart';
import 'package:rest_api_test/repositories/repositories.dart';
class HomeScreenBinding extends Bindings{

  @override
  void dependencies() {
      Get.put(CategoriesApi());
      Get.put(CategoriesRepository(categoriesApi: Get.find<CategoriesApi>()));
      Get.put(HomeScreenController());
      Get.lazyPut(() => RecipesApi());
      Get.lazyPut(() => RecipesRepository(recipesApi: Get.find<RecipesApi>()) );

  }

}