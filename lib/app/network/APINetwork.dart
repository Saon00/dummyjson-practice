import 'dart:convert';

import 'package:ecommerce_demo_job_task/app/core/apis.dart';
import 'package:ecommerce_demo_job_task/app/models/categorylist_model.dart';
import 'package:ecommerce_demo_job_task/app/models/product_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiNetwork {

  static Future<List<Products>> getProductList() async {
    var productListUrl = Uri.parse(Apis.productList);
    try {
      var response = await http.get(productListUrl);
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

  // static Future<List<QouteModel>> fetchQuotes() async {
  //   var url = Uri.parse(Apis.quoteList);
  //   try {
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List<dynamic> jsonData = jsonDecode(response.body);
  //       return jsonData.map((json) => QouteModel.fromJson(json)).toList();
  //     } else {
  //       throw Exception('Failed to load quotes');
  //     }
  //   } catch (e) {
  //     debugPrint('Error: $e');
  //     return [];
  //   }
  // }

  // static Future<List<QouteModel>> fetchQoutes() async{
  //   var url = Uri.parse(Apis.qouteList);
  //   try{
  //     var response =  await http.get(url);
  //   }

  // }
}
