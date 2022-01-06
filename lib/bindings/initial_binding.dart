
import 'package:get/get.dart';
import 'package:rest_api_test/providers/api_provider/api_provider.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RecipesApi(), permanent:  true);
  }

}