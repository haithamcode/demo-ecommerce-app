import 'package:flutter/material.dart';

import '../DBHelper/DatabaseHelper.dart';
import '../Utils/app_styles.dart';
import '../models/ProductsModel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: DatabaseHelper().getProducts(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else if(snapshot.connectionState == ConnectionState.done){
              var dt = snapshot.data;
              List<ProductsModel> products=[];
              if(dt != null){
                var mydt = dt;
                if(mydt is List){
                  mydt.forEach((element) {products.add(ProductsModel.fromJson(element));});
                }
              }

              return ListView.builder (
                  itemCount: products.length ,
                  itemBuilder: (context ,index){
                    return GestureDetector(
                      onTap: () async{
                        // showDialog(context: context, builder: (context){
                        //   return AlertDialog(
                        //     title: Container(
                        //       margin: EdgeInsets.symmetric(horizontal:10),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Icon(Icons.dangerous_rounded,color: Colors.red,),
                        //           Text("Delete From Cart"),
                        //         ],
                        //       ),
                        //     ),
                        //     content: Container(
                        //       child: Text("Do you want to\ndelete this item form your Cart?"),
                        //     ),
                        //     actions: [
                        //       TextButton(onPressed: (){
                        //         Navigator.of(context).pop();
                        //       }, child: Text("No")),
                        //       TextButton(onPressed: (){}, child: Text("Yes")),
                        //     ],
                        //   );
                        // });
                        // setState(() {
                        // });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20, right: 5,left: 5 ),
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
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      width: 100,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black45,
                                              spreadRadius: 1.5,
                                              blurRadius: 10,
                                            )
                                          ],
                                          image: DecorationImage(
                                              image: AssetImage("${products[index].image}"),
                                              fit: BoxFit.fill)),
                                    ),//image
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(right: 20 ,top: 2),
                                                child: Text("${products[index].name} :",style: Styles.headLineStyle2,),),
                                              Text("${products[index].description}",style: Styles.headLineStyle4,),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(right: 20 ,top: 2),
                                                child: Text("Price :",style: Styles.headLineStyle3.copyWith(color: Colors.black),),),
                                              Container(
                                                  child: Text("${products[index].price}\$",style: Styles.textStyle.copyWith(color: Colors.grey.shade500),)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 180),
                                          child: InkWell(
                                            onTap: (){
                                              showDialog(context: context, builder: (context){
                                                return AlertDialog(
                                                  title: Container(
                                                    margin: EdgeInsets.symmetric(horizontal:10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Icon(Icons.dangerous_rounded,color: Colors.red,),
                                                        Text("Delete From Cart"),
                                                      ],
                                                    ),
                                                  ),
                                                  content: Container(
                                                    child: Text("Do you want to\ndelete this item form your Cart?"),
                                                  ),
                                                  actions: [
                                                    TextButton(onPressed: (){
                                                      Navigator.of(context).pop();
                                                    }, child: Text("No")),
                                                    TextButton(onPressed: (){}, child: Text("Yes")),
                                                  ],
                                                );
                                              });
                                            },
                                              child: Icon(Icons.delete, color: Colors.red.shade300,)),)
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
            }
            else {
              return Text("snapchot.error.toString()");
            }
          }),
    );
  }
}
