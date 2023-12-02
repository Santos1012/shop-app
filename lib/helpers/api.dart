import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({
    required String url,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    log("url: $url, token: $token, ");

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("get data success");
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "There is problem with states code : ${response.statusCode}",
      );
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    log("url: $url, body: $body ,token: $token, ");

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      log(data.toString());
      log("add data success");
      return data;
    } else {
      throw Exception(
        "There is problem with states code : ${response.statusCode} ,with body ${jsonDecode(response.body)}",
      );
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      "Content-Type": "application/x-www-form-urlencoded",
    });
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    log("url: $url, body: $body ,token: $token, ");
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      log(data.toString());
      log("updated data success");
      return data;
    } else {
      throw Exception(
        "There is problem with states code : ${response.statusCode} ,with body ${jsonDecode(response.body)}",
      );
    }
  }
}
