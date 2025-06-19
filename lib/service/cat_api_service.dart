import 'dart:convert';
import 'package:flutter_application_1/model/cat_model.dart';
import 'package:http/http.dart' as http;

class CatApiService {
  static const String baseUrl = 'https://api.api-ninjas.com/v1/cats';
  static const String apiKey = 'ap2lVxBA63pNndu73iD1xQ==bVenuH3Lc7WRIyC0';

  static Future<List<Cat>> fetchCatInfo(String catName) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?name=$catName'),
        headers: {
          'X-Api-Key': apiKey,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Cat.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load cat data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching cat data: $e');
    }
  }
}