
import 'package:get/get.dart';
import 'package:rest_api_test/repositories/categories_repository.dart';

class HomeScreenController extends GetxController{

late final CategoriesRepository repository;
  @override
  void onInit() {
    repository = Get.find<CategoriesRepository>();
   getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    var res =  await repository.fetchAllCategories();

  }
}