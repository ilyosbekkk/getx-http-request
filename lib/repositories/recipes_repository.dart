
import 'package:rest_api_test/providers/api_provider/api.dart';

abstract class IRecipesRepository{

  Future<dynamic> fetchRecipesByCategory(String categoryName);
}


class RecipesRepository implements IRecipesRepository{


  final RecipesApi recipesApi;

  RecipesRepository({required this.recipesApi});

  @override
  Future fetchRecipesByCategory(String  categoryName) {

    throw UnimplementedError();
  }



}