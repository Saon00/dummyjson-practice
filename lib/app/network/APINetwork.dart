import 'dart:convert';

import 'package:ecommerce_demo_job_task/app/core/apis.dart';
import 'package:ecommerce_demo_job_task/app/models/categorylist_model.dart';
import 'package:ecommerce_demo_job_task/app/models/product_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Apinetwork {
  static Future<List<Products>> getProductList() async {
    var productlistUrl = Uri.parse(Apis.productList);
    try {
      var response = await http.get(productlistUrl);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body)['products'];
        return jsonData.map((json) => Products.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }

  static Future<List<CategoryList>> fetchCategories() async {
    var url = Uri.parse(Apis.categoryList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => CategoryList.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }
}
