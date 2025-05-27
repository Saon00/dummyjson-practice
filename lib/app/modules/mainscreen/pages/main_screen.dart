import 'package:ecommerce_demo_job_task/app/core/app_color.dart';
import 'package:ecommerce_demo_job_task/app/core/appsize.dart';
import 'package:ecommerce_demo_job_task/app/models/categorylist_model.dart';
import 'package:ecommerce_demo_job_task/app/models/product_list_model.dart';
import 'package:ecommerce_demo_job_task/app/network/APINetwork.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<CategoryList> categoryList = [];
  List<Products> productList = [];

  void fetchCategories() async {
    try {
      final categories = await Apinetwork.fetchCategories();
      setState(() {
        categoryList = categories;
      });
    } catch (error) {
      debugPrint('Error fetching categories: $error');
    }
  }

  void fetchProducts() async {
      try {
        final products = await Apinetwork.getProductList();
        if (products != null && products.isNotEmpty) {
          setState(() {
            productList = products;
          });
        } else {
          debugPrint('No products found');
        }
      } catch (error) {
        debugPrint('Error fetching products: $error');
      }
    }

  @override
  void initState() {
    super.initState();
    // fetchCategories();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // text
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

            // category list (row)
            // SizedBox(
            //   height: getWidth(50),
            //   child: FutureBuilder<List<CategoryList>>(
            //     future: Apinetwork().fetchCategories(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(child: CircularProgressIndicator());
            //       } else if (snapshot.hasError) {
            //         return Center(child: Text('Error: ${snapshot.error}'));
            //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //         return Center(child: Text('No categories available'));
            //       } else {
            //         return ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: snapshot.data!.length,
            //           itemBuilder: (context, index) {
            //             final category = snapshot.data![index];
            //             return Padding(
            //               padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
            //               child: Text(category.slug ?? 'Unknown'), // Assuming CategoryList has a 'name' field
            //             );
            //           },
            //         );
            //       }
            //     },
            //   ),
            // ),
            SizedBox(
              height: getWidth(50),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  final category = categoryList[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
                    child: Text(category.slug ?? 'Unknown'),
                  );
                },
              ),
            ),

            Text("data"),

            SizedBox(
              height: getWidth(50),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final products = productList[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
                    child: Text(products.title ?? 'Unknown'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
