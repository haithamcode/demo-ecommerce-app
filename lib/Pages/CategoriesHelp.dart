import 'package:festore/Widgets/Bottom_Bars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../DBHelper/DatabaseHelper.dart';
import '../Utils/AppLayout.dart';
import '../Utils/app_styles.dart';
import '../Widgets/drawer.dart';
import '../models/CategoriesModel.dart';

class CategoriesH extends StatefulWidget {
  const CategoriesH({Key? key}) : super(key: key);

  @override
  State<CategoriesH> createState() => _CategoriesHState();
}

class _CategoriesHState extends State<CategoriesH> {
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      drawer: GetDrawer(context),
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Row(
            children: [Icon(Icons.category_rounded), Text("Categories")],
          ),
        ),
      ),
      body: FutureBuilder(
          future: DatabaseHelper().getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              var cdt = snapshot.data;
              List<CategoriesModel> category = [];
              if (cdt != null) {
                var mycdt = cdt;
                if (mycdt is List) {
                  mycdt.forEach((element) {
                    category.add(CategoriesModel.fromJson(element));
                  });
                }
              }

              return ListView.builder(
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () async {
                          setState(() {
                            var cid = category[index].cid;
                            if (cid != null) {
                              DatabaseHelper().deleteItem(cid, "categories");
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 25, right: 25, top: 20),
                              // padding: EdgeInsets.symmetric(vertical: 10),
                              width: size.width * 0.6,
                              height: 350,
                              child: Column(
                                children: [
                                  Container(
                                    width: 250,
                                    height: 250,
                                    child: GestureDetector(
                                      onTap: () {
                                        print(category[index].cid);
                                        // if(category[index].cid == 1){
                                        //   Get.to(TshirtPage());
                                        // }else if(category[index].cid == 2){
                                        //   Get.to(JeansPage());
                                        // }
                                        // else if (category[index].cid == 3){
                                        //   Get.to(ShoesPage());
                                        // }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black45,
                                              spreadRadius: 1,
                                              blurRadius: 10,
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  "${category[index].cimage}")),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("${category[index].cname}",
                                      style: Styles.headLineStyle2
                                          .copyWith(color: Colors.blueGrey)),
                                ],
                              ),
                            ),
                          ],
                        ));
                  });
            } else {
              return Text("snapchot.error.toString()");
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(BottomBars());
        },
        child: Icon(Icons.arrow_back,size: 25),
      ),
    );
  }
}
