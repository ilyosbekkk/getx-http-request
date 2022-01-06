import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_test/models/recipe.dart';


class SingleRecipeWidget extends StatelessWidget {
  const SingleRecipeWidget({Key? key, required this.recipe}) : super(key: key);
  static const double CARD_HEIGHT = 300;

   final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    final width  = Get.width;
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: CARD_HEIGHT,
        width: 0.9*width ,
        child: Card(
          child: _buildCardChild(),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _buildCardChild(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: [
        SizedBox(
          width: 0.9*Get.width,
         height: 0.7 *  CARD_HEIGHT,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
             child: Image.network(recipe.img, fit: BoxFit.cover,),
          ),
        ),
        const SizedBox(height: 10),
        Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text("name: ${recipe.title}", maxLines: 1, style: const TextStyle(fontSize: 18),)),
        Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text("source: ${recipe.source}", maxLines: 1, style: const TextStyle(fontSize: 18),)),
        Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text("category: ${recipe.category}", maxLines: 1, style: const TextStyle(fontSize: 18),))

      ],
    );
  }
}
