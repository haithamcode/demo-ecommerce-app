import 'package:flutter/material.dart';
import '../Utils/app_styles.dart';
Widget GetDrawer(BuildContext context){
  return Drawer(
    width: 350,
    backgroundColor: Colors.blueGrey,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 55, left: 20,right: 20 ),
          width: 350,
          height: 280,
          color: Colors.blueGrey.shade900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 70 ,
                // backgroundColor: Colors.cyan,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      image: DecorationImage(
                          fit:BoxFit.fill,
                          image: AssetImage("assets/images/6.jpg")
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text("E-MAIL: Hythamaiz.z@gmail.com", style: Styles.headLineStyle3,),
              SizedBox(height: 10,),
              Text("NAME: Haitham Faiz ALzubaidi", style: Styles.headLineStyle3,),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only( top:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: (){},
                trailing: Icon(Icons.shopping_cart_rounded),
                title: Text("Cart",style: Styles.headLineStyle2.copyWith(color: Colors.black45),),
              ),
              ListTile(
                onTap: (){},
                trailing: Icon(Icons.logout_outlined),
                title: Text("Log out",style: Styles.headLineStyle2.copyWith(color: Colors.black45),),
              ),
              ListTile(
                onTap: (){},
                trailing: Icon(Icons.settings),
                title: Text("Setting",style: Styles.headLineStyle2.copyWith(color: Colors.black45),),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}