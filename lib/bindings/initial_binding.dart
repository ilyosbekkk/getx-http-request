

import 'package:get/get.dart';
import 'package:rest_api_test/providers/api_provider/api.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BaseApiProvider());
  }

}