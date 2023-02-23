import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Base {
  Future<dynamic> get(String url) async {
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};

    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: header);
      responseJson = json.decode(response.body.toString());
    } on SocketException {
      throw Exception("No Internet Connection");
    } on TimeoutException {
      throw Exception("Request Time out!!");
    } on HttpException {
      throw Exception("$url not found");
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
    return responseJson;
  }

  Future<dynamic> createOrUpdate(String url, dynamic body,
      {isCreate = true}) async {
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    var responseJson;
    try {
      final response = isCreate
          ? await http.post(Uri.parse(url), headers: header, body: body)
          : await http.put(Uri.parse(url), headers: header, body: body);
      responseJson = json.decode(response.body.toString());
    } on SocketException {
      throw Exception("No Internet Connection");
    } on TimeoutException {
      throw Exception("Request Time out!!");
    } on HttpException {
      throw Exception("$url not found");
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    var responseJson;
    try {
      var response = await http.delete(Uri.parse(url), headers: header);
      responseJson = json.decode(response.body.toString());
    } on SocketException {
      throw Exception("No Internet Connection");
    } on TimeoutException {
      throw Exception("Request Time out!!");
    } on HttpException {
      throw Exception("$url not found");
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
    return responseJson;
  }
}
