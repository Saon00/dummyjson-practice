import 'package:dio/dio.dart';
import 'package:ecommerce_demo_job_task/app/core/apis.dart';
import 'package:ecommerce_demo_job_task/app/models/product_list_model.dart';

class DioNetworks {
  final Dio dio = Dio();

  Future<List<Products>> getProductList() async {
    try {
      final response = await dio.get(Apis.productList);
      print("Output: ${response.data}");

      final productListModel = ProductListModel.fromJson(response.data);

      return productListModel.products ?? [];

      return response.data;
    } on DioException catch (e) {
      print("DioException Error: ${e}");
      return [];
    } catch (e) {
      print("Error: ${e}");
      return [];
    }
  }
}
