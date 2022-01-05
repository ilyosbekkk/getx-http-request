
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_test/models/category.dart';
import 'package:rest_api_test/providers/api_provider/api.dart';

abstract class ICategoriesRepository{

  Future<List<Category>> fetchAllCategories();
}

class CategoriesRepository implements ICategoriesRepository{

  final CategoriesApi categoriesApi;
  CategoriesRepository({required this.categoriesApi});


  @override
  Future<List<Category>> fetchAllCategories()  async{
    var  response =   await categoriesApi.fetchAllCategories();

    return  List.from(json.decode(response.bodyString!) as List).map((e) => Category.fromJson(e)).toList();


  }

}