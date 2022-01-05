
import 'package:rest_api_test/providers/api_provider/api.dart';

abstract class ICategoriesRepository{

  Future<dynamic> fetchAllCategories();
}


class CategoriesRepository implements ICategoriesRepository{

  final CategoriesApi categoriesApi;

  CategoriesRepository({required this.categoriesApi});


  @override
  Future fetchAllCategories()  async{
     await categoriesApi.fetchAllCategories();
  }

}