import 'package:festore/Pages/JeansPage.dart';
import 'package:festore/Pages/ShoesPage.dart';
import 'package:festore/Pages/TshirtsPage.dart';
import 'package:get/get.dart';
import 'package:festore/Utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../Utils/AppLayout.dart';

class Categories extends StatelessWidget {
  final Map<String, dynamic> category;
  const Categories({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      width: size.width*0.6,
      height: 450,
      child: Column(
        children: [
          Container(
            height: 300,
            child: GestureDetector(
              onTap: (){
                if (category['image'] == "1.jpg"){
                 Get.to(ShoesPage());
                }
                else if (category['image'] == "2.jpg"){
                  Get.to(JeansPage());
                }
                else if (category['image'] == "3.jpg") {
                  Get.to(TshirtPage());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      spreadRadius: 1,
                      blurRadius: 10,
                    )
                  ],
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/${category['image']}")
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text("${category['name']}",style: Styles.headLineStyle2.copyWith(color: Colors.blueGrey)),
        ],
      ),
    );
  }
}