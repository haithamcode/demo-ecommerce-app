import 'package:festore/Utils/app_styles.dart';
import 'package:festore/models/ShoseModel.dart';
import 'package:flutter/material.dart';
import '../DBHelper/DatabaseHelper.dart';
import '../Widgets/drawer.dart';

class ShoesPage extends StatefulWidget {
  const ShoesPage({Key? key}) : super(key: key);

  @override
  State<ShoesPage> createState() => _ShoesPageState();
}

class _ShoesPageState extends State<ShoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GetDrawer(context),
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 90),
          child: Row(
            children: [Icon(Icons.shopping_cart), Text("Store")],
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder(
            future: DatabaseHelper().getShoes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                var shdt = snapshot.data;
                List<ShoesModel> shoes = [];
                if (shdt != null) {
                  var myshdt = shdt;
                  if (myshdt is List) {
                    myshdt.forEach((element) {
                      shoes.add(ShoesModel.fromJson(element));
                    });
                  }
                }

                return ListView.builder(
                    itemCount: shoes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          setState(() {
                            var shid = shoes[index].shid;
                            if (shid != null) {
                              DatabaseHelper().deleteItem(shid, "shoes");
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20, right: 5, left: 5),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                width: 400,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      )
                                    ]),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        width: 100,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black45,
                                                spreadRadius: 1.5,
                                                blurRadius: 10,
                                              )
                                            ],
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "${shoes[index].shimage}"),
                                                fit: BoxFit.fill)),
                                      ), //image
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: 20, top: 2),
                                                  child: Text(
                                                    "${shoes[index].shname} :",
                                                    style:
                                                        Styles.headLineStyle2,
                                                  ),
                                                ),
                                                Text(
                                                  "${shoes[index].shdescription}",
                                                  style: Styles.headLineStyle4,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: 20, top: 2),
                                                  child: Text(
                                                    "Price :",
                                                    style: Styles.headLineStyle3
                                                        .copyWith(
                                                            color:
                                                                Colors.black),
                                                  ),
                                                ),
                                                Text(
                                                  "${shoes[index].shprice}\$",
                                                  style: Styles.textStyle
                                                      .copyWith(
                                                          color: Colors
                                                              .grey.shade500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Text("snapchot.error.toString()");
              }
            }),
      ),
    );
  }
}
