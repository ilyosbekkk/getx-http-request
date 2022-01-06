import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:rest_api_test/core/utils/toast.dart';
import 'exceptions.dart';
import 'dart:async';

class BaseApiProvider extends GetConnect {
  late String apiKey;
  late Map<String, String> headers;
  late String httpBaseUrl;
  @override
  void onInit() {
    initCredentials();
    httpClient.baseUrl = httpBaseUrl;
    httpClient.defaultContentType = "application/json; charset=utf-8";
    httpClient.timeout = const Duration(seconds: 10);
    httpClient.addResponseModifier(responseInterceptor);
    httpClient.addRequestModifier(requestInterceptor);

    super.onInit();
  }

  void initCredentials() {
    httpBaseUrl = dotenv.env["API_SERVER_HOST"].toString();
    apiKey = dotenv.env["API_KEY"].toString();
    headers = {"x-rapidapi-key": apiKey};
  }

  FutureOr<dynamic> responseInterceptor(Request request, Response response) {
    EasyLoading.dismiss();
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 400:
        Toaster.showToast(message: response.body.toString());
        throw BadRequestException(response.body.toString());
      case 401:
        Toaster.showToast(message: response.body.toString());
        throw BadRequestException(response.body.toString());
      case 403:
        Toaster.showToast(message: response.body.toString());
        throw UnauthorizedException(response.body.toString());
      case 500:
        Toaster.showToast(message: response.body.toString());
       throw InternalServerException(response.body.toString());
      default:
        Toaster.showToast(message:"Unexpected error occurred, try again...");
        throw FetchDataException('Unexpected error occurred : ${response.statusCode}');
    }
  }

  FutureOr<Request> requestInterceptor(Request request) async {
    request.headers.addAll(headers);
    EasyLoading.show(status: "로드중...");
    return request;
  }
}
