import 'package:get/get.dart';
import 'package:rest_api_test/models/recipe.dart';
import 'package:rest_api_test/repositories/recipes_repository.dart';
import 'package:rest_api_test/core/src/const.dart';
import 'package:rest_api_test/views/details/screens/details_screen.dart';

class DetailScreenController extends GetxController{

  late RecipesRepository recipesRepository;
  final Rx<DetailScreenArgs?> _args = Rx<DetailScreenArgs?>(null);
  final  RxList<Recipe> _recipes = <Recipe>[].obs;

  List<Recipe> get  recipes  => _recipes;

  @override
  void onInit() {

    recipesRepository = Get.find<RecipesRepository>();
    _args.value = Get.arguments[ConstVariables.DETAIL_SCREEN_KEY] as DetailScreenArgs;
    fetchRecipesByCategory(_args.value?.category.category??"");

    super.onInit();
  }
  
  Future<void> fetchRecipesByCategory(String  categoryName) async{
    List<Recipe> recipes = await recipesRepository.fetchRecipesByCategory(categoryName);
    _recipes.value =  recipes;

  }




}

