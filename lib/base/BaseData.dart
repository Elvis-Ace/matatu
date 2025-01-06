import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SessionData.dart';
class BaseData{
  String baseurl = "https://logistics.afyanova.africa/";
  Color basecolor = const Color(0xFF5689C0);
  Color primary = const Color(0xFF5689C0);
  List<String> incomes = ['Fixed','Allowance','Extra'];
  final dio = Dio();
  Future<Map> getData(String url) async {
    Map<String, dynamic> requestHeaders = await custonheaders();

    debugPrint('${baseurl}api/$url');
    try {
      // Initialize the response
      Response response;

      // Make the GET request
      response = await dio.get(
        '${baseurl}api/$url',
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: requestHeaders,
        ),
      );

      // Print the response data for debugging
      debugPrint("server: ${response.data.toString()}");

      // Return the response data
      return response.data;
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.response != null) {
        // The server responded with a non-2xx status code
        debugPrint('Server error: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        // Other types of errors, like no internet connection
        debugPrint('Network or request error: ${e.message}');
      }
      return {
        'success':false,
      }; // Return null or handle the error as needed
    } catch (e) {
      // Handle any other types of errors
      debugPrint('Unexpected error: $e');
      return {
        'success':false,
      };
    }
  }

  Future<Map> postData(String url, map) async {
    debugPrint('${baseurl}api/$url');
    try {
      // Debug print the map to see the data being sent
      debugPrint(map.toString());

      // Fetch the custom headers
      Map<String, dynamic> requestHeaders = await custonheaders();

      // Make the POST request
      Response response = await dio.post(
        '${baseurl}api/$url',
        data: map, // Creates a Stream<List<int>>.
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: requestHeaders,
        ),
      );

      // Debug print the response data
      debugPrint(response.data.toString());

      // Return the response data if successful
      return response.data;
    } catch (e) {
      // Catch and log any errors that occur during the request
      debugPrint('Request failed with error: $e');
      return {
        'success':false,
      }; // Return null or handle the error accordingly
    }
  }

  custonheaders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    SessionData sessionData = SessionData();
    String? token = prefs.getString(sessionData.token);
    debugPrint(token);
    Map<String, String> requestHeaders = {};
    if (token != null) {
      requestHeaders = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    } else {
      requestHeaders = {'Accept': 'application/json'};
    }

    return requestHeaders;
  }

}