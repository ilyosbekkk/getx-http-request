import 'package:get/get.dart';
import 'base_api_provider.dart';


class CategoriesApi extends BaseApiProvider{

  Future<Response> fetchAllCategories() async {
     var  response = await get("/category");
      print(response.body);
     return response;

  }

}