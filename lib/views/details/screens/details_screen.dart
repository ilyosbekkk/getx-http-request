
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_test/controllers/detail_screen_controller.dart';
import 'package:rest_api_test/models/category.dart';
import 'package:rest_api_test/core/src/const.dart';
import 'package:rest_api_test/views/details/widgets/single_recipe.dart';
class DetailScreen extends StatelessWidget {

  final controller = Get.find<DetailScreenController>(
      tag: (Get.arguments[ConstVariables.DETAIL_SCREEN_KEY]
      as DetailScreenArgs).index
          .toString());

   DetailScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Obx(() {
        return  ListView.builder(
            itemCount: controller.recipes.length,
            itemBuilder: (context, index){
              return SingleRecipeWidget(recipe: controller.recipes[index]);
            });
      }),
    );
  }
}

class DetailScreenArgs {
  final Category category;
  final int index;
  DetailScreenArgs({required this.index, required this.category});

}