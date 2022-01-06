
import 'package:get/get_connect/http/src/response/response.dart';

abstract class IRecipesApi{

  Future<Response> fetchAllCategories();
  Future<Response> fetchRecipesByCategory(String categoryName);

}