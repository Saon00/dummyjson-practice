// import 'package:ecommerce_demo_job_task/app/core/app_color.dart';
// import 'package:ecommerce_demo_job_task/app/core/appsize.dart';
// import 'package:ecommerce_demo_job_task/app/models/categorylist_model.dart';
// import 'package:ecommerce_demo_job_task/app/models/product_list_model.dart';
// import 'package:ecommerce_demo_job_task/app/models/qoutes_model.dart';
// import 'package:ecommerce_demo_job_task/app/network/APINetwork.dart';
// import 'package:ecommerce_demo_job_task/app/network/DioNetwork.dart';
// import 'package:flutter/material.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   // List<CategoryList> categoryList = [];
//   List<Products> productList = [];
//
//   // List<QouteModel> qouteList = [];
//   bool isLoading = true;
//   String? errorMessage;
//
//   void fetchProductList() async {
//     try {
//       setState(() {
//         isLoading = true;
//         errorMessage = null;
//       });
//
//       final products = await DioNetworks().getProductList();
//
//       setState(() {
//         productList = products;
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         errorMessage = "failed to load products: $e";
//         isLoading = false;
//       });
//       debugPrint("Error message: $e");
//     }
//   }
//
//   // void fetchCategories() async {
//   //   try {
//   //     final categories = await ApiNetwork.fetchCategories();
//   //     setState(() {
//   //       categoryList = categories;
//   //     });
//   //   } catch (error) {
//   //     debugPrint('Error fetching categories: $error');
//   //   }
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchProductList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.primaryColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // text
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: getWidth(20),
//                 vertical: getWidth(10),
//               ),
//               child: Row(
//                 children: [
//                   Text(
//                     '50%',
//                     style: TextStyle(
//                       fontSize: getWidth(60),
//                       color: AppColor.textColor,
//                     ),
//                   ),
//                   SizedBox(width: getWidth(10)),
//                   Text(
//                     'Off\non Selected Products',
//                     style: TextStyle(
//                       fontSize: getWidth(20),
//                       fontWeight: FontWeight.bold,
//                       color: AppColor.textColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Search Bar
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: getWidth(20),
//                 vertical: getWidth(10),
//               ),
//               child: TextField(
//                 cursorColor: AppColor.cursonColor,
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(getHeight(20)),
//                     borderSide: BorderSide.none,
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//             ),
//
//             Text("data"),
//
//             SizedBox(
//               height: getWidth(50),
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: productList.length,
//                 itemBuilder: (context, index) {
//                   final products = productList[index];
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
//                     child: Text(products.title ?? 'Unknown'),
//                   );
//                 },
//               ),
//             ),
//
//             Text("Products: ${productList.length}"),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:ecommerce_demo_job_task/app/core/app_color.dart';
import 'package:ecommerce_demo_job_task/app/core/appsize.dart';
import 'package:ecommerce_demo_job_task/app/models/categorylist_model.dart';
import 'package:ecommerce_demo_job_task/app/models/product_list_model.dart';
import 'package:ecommerce_demo_job_task/app/models/qoutes_model.dart';
import 'package:ecommerce_demo_job_task/app/network/APINetwork.dart';
import 'package:ecommerce_demo_job_task/app/network/DioNetwork.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<CategoryList> categoryList = [];
  List<Products> productList = [];
  List<QouteModel> qouteList = [];
  bool isLoading = true;
  String? errorMessage;

  void fetchProductList() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      final productLists = await DioNetworks().getProductList();

      setState(() {
        productList = productLists;
        isLoading = false;
      });

      print("Fetched ${productList.length} products");

    } catch (error) {
      setState(() {
        errorMessage = "Failed to load products: $error";
        isLoading = false;
      });
      debugPrint('Error fetching products: $error');
    }
  }

  void fetchCategories() async {
    try {
      final categories = await ApiNetwork.fetchCategories();
      setState(() {
        categoryList = categories;
      });
    } catch (error) {
      debugPrint('Error fetching categories: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProductList();
    // Uncomment if you want to fetch categories too
    // fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header text
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(20),
                vertical: getWidth(10),
              ),
              child: Row(
                children: [
                  Text(
                    '50%',
                    style: TextStyle(
                      fontSize: getWidth(60),
                      color: AppColor.textColor,
                    ),
                  ),
                  SizedBox(width: getWidth(10)),
                  Text(
                    'Off\non Selected Products',
                    style: TextStyle(
                      fontSize: getWidth(20),
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(20),
                vertical: getWidth(10),
              ),
              child: TextField(
                cursorColor: AppColor.cursonColor,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(getHeight(20)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            // Categories Section
            if (categoryList.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: getWidth(18),
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getWidth(10)),
              SizedBox(
                height: getWidth(50),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    final category = categoryList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
                      child: Chip(
                        label: Text(category.slug ?? 'Unknown'),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: getWidth(20)),
            ],

            // Products Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products",
                    style: TextStyle(
                      fontSize: getWidth(18),
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColor,
                    ),
                  ),
                  Text(
                    "${productList.length} items",
                    style: TextStyle(
                      fontSize: getWidth(14),
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getWidth(10)),

            // Products List or Loading/Error States
            Expanded(
              child: _buildProductsContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsContent() {
    if (isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: AppColor.textColor),
            SizedBox(height: getWidth(16)),
            Text(
              "Loading products...",
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: getWidth(16),
              ),
            ),
          ],
        ),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: getWidth(48),
              color: Colors.red,
            ),
            SizedBox(height: getWidth(16)),
            Text(
              errorMessage!,
              style: TextStyle(
                color: Colors.red,
                fontSize: getWidth(16),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getWidth(16)),
            ElevatedButton(
              onPressed: fetchProductList,
              child: Text("Retry"),
            ),
          ],
        ),
      );
    }

    if (productList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: getWidth(48),
              color: AppColor.textColor,
            ),
            SizedBox(height: getWidth(16)),
            Text(
              "No products found",
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: getWidth(16),
              ),
            ),
          ],
        ),
      );
    }

    // Products Grid
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: getWidth(16),
          mainAxisSpacing: getWidth(16),
          childAspectRatio: 0.75,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return _buildProductCard(product);
        },
      ),
    );
  }

  Widget _buildProductCard(Products product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(getWidth(12)),
      ),
      child: Padding(
        padding: EdgeInsets.all(getWidth(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getWidth(8)),
                  color: Colors.grey[200],
                ),
                child: product.thumbnail != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(getWidth(8)),
                  child: Image.network(
                    product.thumbnail!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.image_not_supported,
                        size: getWidth(32),
                        color: Colors.grey,
                      );
                    },
                  ),
                )
                    : Icon(
                  Icons.image,
                  size: getWidth(32),
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: getWidth(8)),

            // Product Title
            Expanded(
              flex: 1,
              child: Text(
                product.title ?? 'Unknown Product',
                style: TextStyle(
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Price and Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                  style: TextStyle(
                    fontSize: getWidth(16),
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                if (product.rating != null)
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: getWidth(16),
                        color: Colors.amber,
                      ),
                      Text(
                        product.rating!.toStringAsFixed(1),
                        style: TextStyle(fontSize: getWidth(12)),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}