import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:gtex_tutorial/views/cart_page.dart';
import 'package:gtex_tutorial/views/detailpage.dart';
import 'package:gtex_tutorial/views/product_tile.dart';
import '../controllers/product_controller.dart';
import '../models/product.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const CartPage())));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Shop',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.view_list_rounded),
                    onPressed: () {}),
                IconButton(icon: const Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    itemCount: productController.productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // the number of columns in the grid
                      mainAxisSpacing: 8.0, // the space between each row
                      crossAxisSpacing: 8.0, // the space between each column
                    ),
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: (() {
                          Product p = productController.productList[index];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => DetailPage(
                                        p: p,
                                        index: index,
                                      ))));
                        }),
                        child: Hero(
                            tag: productController.productList[index],
                            child: ProductTile(
                                productController.productList[index])),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
