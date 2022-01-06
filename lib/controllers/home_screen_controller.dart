import 'package:get/get.dart';
import 'package:rest_api_test/models/category.dart';
import 'package:rest_api_test/repositories/recipes_repository.dart';

class HomeScreenController extends GetxController{

late final RecipesRepository repository;
final  RxList<Category> _categories = <Category>[].obs;


List<Category> get  categories => _categories;

  @override
  void onInit() {
    repository = Get.find<RecipesRepository>();
   getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    var res =  await repository.fetchAllCategories();
    _categories.value = res;
  }
}