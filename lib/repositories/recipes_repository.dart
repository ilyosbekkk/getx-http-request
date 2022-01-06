
import 'dart:convert';

import 'package:rest_api_test/models/category.dart';
import 'package:rest_api_test/models/recipe.dart';
import 'package:rest_api_test/providers/api_provider/api_providers.dart';

abstract class IRecipesRepository{

  Future<List<Recipe>> fetchRecipesByCategory(String categoryName);
  Future<List<Category>> fetchAllCategories();

}


class RecipesRepository implements IRecipesRepository{


  final IRecipesApi recipesApi;
  RecipesRepository({required this.recipesApi});

  @override
  Future<List<Recipe>> fetchRecipesByCategory(String  categoryName)  async{
     var  response = await recipesApi.fetchRecipesByCategory(categoryName);
     return  List.from(json.decode(response.bodyString!) as List).map((e) => Recipe.fromJson(e)).toList();
  }

  @override
   Future<List<Category>> fetchAllCategories()  async{
    var  response =   await recipesApi.fetchAllCategories();
    if (response.bodyString != null) {
      return  List.from(json.decode(response.bodyString!) as List).map((e) => Category.fromJson(e)).toList();
    }
    return [];
  }

}