
import 'package:festore/Pages/CategoriesHelp.dart';
import 'package:festore/Screens/Categories_Part.dart';
import 'package:festore/Utils/app_info.dart';
import 'package:festore/Utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:ListView(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 15,),
                Container(padding: EdgeInsets.only(left: 20, right: 20,top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcom To",style: Styles.headLineStyle3),
                          SizedBox(height: 2,),
                          Text("My Store",style: Styles.headLineStyle,),],
                      ),
                      Container(
                        width: 50,
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              spreadRadius: 1.5,
                              blurRadius: 10,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("assets/images/2.jpg")
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [BoxShadow(
                        color: Colors.black,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset.zero,
                    )]
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Search"),
                      filled: true,
                      contentPadding: EdgeInsets.only(bottom: 5,top: 5),
                      fillColor: Styles.bgColor,
                      labelStyle: TextStyle(color: Colors.blueGrey ),
                      prefixIcon: Icon(Icons.search_rounded,color: Colors.blueGrey),
                    ),
                  ),
                ),
                SizedBox(height: 2,),
                Container(padding: EdgeInsets.only(left: 20, right: 20,top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categorise",style: Styles.headLineStyle2,),
                      InkWell(
                        onTap: (){
                          Get.to(CategoriesH());
                        },
                          child: Text("View All",style: Styles.textStyle.copyWith(color: Styles.primaryColor),))
                    ],
                  ),
                ),
                SizedBox(height: 1,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20, right: 20,top: 20),
                    child: Row(
                  children: categoriesList.map((category) => Categories(category: category)).toList()
                    ),
                ),
                // SizedBox(height: 15,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
