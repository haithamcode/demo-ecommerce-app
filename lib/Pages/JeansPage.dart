import 'package:festore/DBHelper/DatabaseHelper.dart';
import 'package:festore/models/ProductsModel.dart';
import 'package:flutter/material.dart';
import '../Utils/app_styles.dart';
import '../Widgets/drawer.dart';

class JeansPage extends StatefulWidget {
  const JeansPage({Key? key}) : super(key: key);

  @override
  State<JeansPage> createState() => _JeansPageState();
}

class _JeansPageState extends State<JeansPage> {
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
            future: DatabaseHelper().getProducts(),
            builder: (
              context,
              snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                var dt = snapshot.data;
                List<ProductsModel> products = [];
                if (dt != null) {
                  var mydt = dt;
                  if (mydt is List) {
                    mydt.forEach((element) {
                      products.add(ProductsModel.fromJson(element));
                    });
                  }
                }

                return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Add into cart"),
                                  content:
                                      Text("Do You Want to add to Your cart"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("Yes"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("No"),
                                    ),
                                  ],
                                );
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
                                                    "${products[index].image}"),
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
                                                    "${products[index].name} :",
                                                    style:
                                                        Styles.headLineStyle2,
                                                  ),
                                                ),
                                                Text(
                                                  "${products[index].description}",
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
                                                  "${products[index].price}\$",
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
