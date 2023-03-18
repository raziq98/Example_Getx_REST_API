// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Container(
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
            top: 20,
            left: 10,
            child: Material(
              color: Colors.white,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: Material(
              color: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings_rounded,
                  size: 15,
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 20,
            child: Text(
              p.name,
              maxLines: 3,
              style: GoogleFonts.roboto(fontSize: 25, color: Colors.black),
            ),
          ),
          Positioned(
            top: 230,
            left: 20,
            child: Text(
              'RM ${p.price}',
              style: GoogleFonts.roboto(fontSize: 35, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
