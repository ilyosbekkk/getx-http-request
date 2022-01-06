import 'package:get/get.dart';
import 'package:rest_api_test/providers/api_provider/api_providers.dart';
import 'base_provider.dart';

class RecipesApi extends BaseApiProvider implements IRecipesApi{

  @override
  Future<Response> fetchAllCategories() async {
    var  response = await get("/category");
     return response;
  }

  @override
  Future<Response> fetchRecipesByCategory(String categoryName) async {
    var  response = await get("/getbycat/$categoryName");
    return response;
  }
}