import 'package:flutter/material.dart';
import 'package:rest_api_test/controllers/detail_screen_controller.dart';
import 'package:rest_api_test/models/category.dart';
import 'package:get/get.dart';
import 'package:rest_api_test/router/app_pages.dart';
import 'package:rest_api_test/core/src/const.dart';
import 'package:rest_api_test/views/details/screens/details_screen.dart';



class SingleCategoryWidget extends StatelessWidget {
   const  SingleCategoryWidget({Key? key, required this.category, required this.index}) : super(key: key);
   static const double CARD_HEIGHT = 70;
  final Category category;
  final  int index;
  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return SizedBox(
    height: CARD_HEIGHT, width: 0.8  * width ,
        child:GestureDetector(
        onTap: ()  {
          onTap(index);
        }  ,
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(child: Text(category.category, style: const TextStyle(fontSize: 17),)),
        ),
      )
    );
  }
  void onTap(int index) {
    final screenArgs = {ConstVariables.DETAIL_SCREEN_KEY: DetailScreenArgs(category: category, index: index)};
    Get.lazyPut(() => DetailScreenController(), tag: index.toString());
    Get.toNamed(Routes.DETAIL_SCREEN,  arguments: screenArgs);
  }
}
