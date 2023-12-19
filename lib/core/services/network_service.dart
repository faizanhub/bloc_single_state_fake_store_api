import 'dart:convert';
import 'dart:io';
import 'package:bloc_fake_store_api/core/constants/app_exceptions.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

abstract class BaseNetworkService {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, Map<String, dynamic> data);
}

class NetworkService extends BaseNetworkService {
  var headers = {'Content-Type': 'application/json'};

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headers,
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.reasonPhrase);
      case 401:
        throw BadRequestException(response.reasonPhrase);
      case 404:
        throw UnauthorizedException(response.reasonPhrase);
      case 500:
        throw BadRequestException(response.reasonPhrase);

      default:
        throw FetchDataException('Error occurred while communicating with server ${response.statusCode}');
    }
  }
}
