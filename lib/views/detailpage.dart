// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtex_tutorial/models/cart_model.dart';
import 'package:provider/provider.dart';

import '../controllers/product_controller.dart';
import '../models/product.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    Key? key,
    required this.p,
    required this.index,
  }) : super(key: key);

  final Product p;
  final int index;
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    double widtH = MediaQuery.of(context).size.width;
    double heighT = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: widtH,
        height: heighT,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Hero(
                tag: productController.productList[index],
                child: Container(
                  width: widtH,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    image: DecorationImage(image: NetworkImage(p.imageLink)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 10,
              child: Material(
                color: Colors.white,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 10,
              child: Material(
                color: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings_rounded,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 200,
                left: 20,
                child: SizedBox(
                  width: 360,
                  child: textw(
                    p: p,
                    data: '${p.name}',
                    size: 25,
                    maxlines: 2,
                  ),
                )),
            Positioned(
              top: 270,
              left: 20,
              child: textw(
                p: p,
                data: '\$ ${p.price}',
                size: 35,
              ),
            ),
            Positioned(
              top: 330,
              child: SizedBox(
                width: 360,
                child: textw(
                  p: p,
                  data: '${p.description}',
                  size: 15,
                  maxlines: 12,
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              child: InkWell(
                onTap: () {
                  CartModel().addItemToCart(p);
                  Provider.of<CartModel>(context, listen: false)
                      .addItemToCart(p);
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text('Add to Cart',
                          style: GoogleFonts.notoSerif(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class textw extends StatelessWidget {
  const textw({
    Key? key,
    required this.p,
    required this.size,
    this.maxlines,
    required this.data,
  }) : super(key: key);

  final Product p;
  final double size;
  final int? maxlines;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxlines,
      style: GoogleFonts.notoSerif(fontSize: size, color: Colors.black),
    );
  }
}
