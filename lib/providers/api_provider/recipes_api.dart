import 'package:get/get.dart';

import 'base_api_provider.dart';

class RecipesApi extends BaseApiProvider{

  Future<Response> getRecipeByCategory(String categoryName) async {
    var  response = await get("/getbycat/$categoryName");
    return response;
  }
}