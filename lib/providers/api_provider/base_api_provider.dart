import 'package:get/get_connect/http/src/request/request.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'exception.dart';
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
    httpClient.addRequestModifier(requestInterceptor) ;

    super.onInit();
  }

  void initCredentials(){
    httpBaseUrl = dotenv.env["API_SERVER_HOST"].toString();
    apiKey = dotenv.env["API_KEY"].toString();
    headers = {"x-rapidapi-key": apiKey};
  }

  FutureOr<dynamic>  responseInterceptor(Request request, Response response)  {
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw BadRequestException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw InternalServerException(response.body.toString());
      default:
        throw FetchDataException('Unexpected error occurred : ${response.statusCode}');
    }
  }

  FutureOr<Request> requestInterceptor(Request  request) async {
    request.headers.addAll(headers);
    return request;
  }

}

//Future and FutureOr difference?