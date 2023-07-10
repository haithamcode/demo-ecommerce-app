import 'package:flutter/material.dart';
import '../DBHelper/DatabaseHelper.dart';
import '../Utils/app_styles.dart';
import '../Widgets/drawer.dart';
import '../models/TshirtsModel.dart';

class TshirtPage extends StatefulWidget {
  const TshirtPage({Key? key}) : super(key: key);

  @override
  State<TshirtPage> createState() => _TshirtPageState();
}

class _TshirtPageState extends State<TshirtPage> {
  List<int> text = [1, 2, 3, 4, 5, 6, 7, 8, 9];

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
            future: DatabaseHelper().getTshirts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                var tdt = snapshot.data;
                List<TshirtsModel> tshirts = [];
                if (tdt != null) {
                  var mytdt = tdt;
                  if (mytdt is List) {
                    mytdt.forEach((element) {
                      tshirts.add(TshirtsModel.fromJson(element));
                    });
                  }
                }

                return ListView.builder(
                    itemCount: tshirts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          var tid = tshirts[index].tid;
                          if (tid != null) {
                            DatabaseHelper().deleteItem(tid, "tshirts");
                          }
                          setState(() {
                            print(tshirts[index].tid);
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
                                                    "${tshirts[index].timage}"),
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
                                                    "${tshirts[index].tname} :",
                                                    style:
                                                        Styles.headLineStyle2,
                                                  ),
                                                ),
                                                Text(
                                                  "${tshirts[index].tdescription}",
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
                                                  "${tshirts[index].tprice}\$",
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
