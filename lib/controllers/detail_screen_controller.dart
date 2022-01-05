import 'package:get/get.dart';
import 'package:rest_api_test/repositories/recipes_repository.dart';

class DetailScreenController extends GetxController{

  late RecipesRepository recipesRepository;

  @override
  void onInit() {
    recipesRepository = Get.find<RecipesRepository>();
    super.onInit();
  }
// Future<void> getRecipesByCategory(){
//
// }

}