import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_test/controllers/home_screen_controller.dart';
import 'package:rest_api_test/views/home/widgets/single_cateogry_widget.dart';



class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  var  controller = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Obx(() {
         return  ListView.builder(
             itemCount: controller.categories.length,
             itemBuilder: (context, index){
            return SingleCategoryWidget(category: controller.categories[index], index: index,);
         });
      }),
    );
  }
}
