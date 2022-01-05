import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'exception.dart';

class BaseApiProvider extends GetConnect {

  late String apiKey;
  late Map<String,  String> headerss;
  late String  httpBaseUrl;
  @override
  void onInit() {
    print("wdieuwfio");
    initCredentials();
    httpClient.baseUrl = httpBaseUrl;
    httpClient.defaultContentType = 'application/json';
    print("hello");
    httpClient.addAuthenticator(authenticator);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
    httpClient.timeout = const Duration(seconds: 5);
  }

  void initCredentials(){

    httpBaseUrl = dotenv.env["API_SERVER_HOST"].toString();
    apiKey = dotenv.env["API_KEY"].toString();
    // headerss = {'x-rapidapi-host': httpBaseUrl, "x-rapidapi-key": apiKey};
  }

  Future<Request> authenticator(request){
    print("hihihihihih");
    return request;
  }

  FutureOr<Request> requestInterceptor(request) {
    print("hello requestInterceptor");
    // request.headers.addAll(headerss);
    // request.headers['x-rapidapi-host'] =httpBaseUrl;
    request.headers['x-rapidapi-key'] =apiKey;
    print("hello requestInterceptor");
    return request;
  }


  FutureOr<dynamic> responseInterceptor( request,  response) async {


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
        throw FetchDataException(
            'Unexpected error occurred : ${response.statusCode}');
    }
  }



}








//Future and FutureOr difference?