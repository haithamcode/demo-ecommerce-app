import 'package:festore/Utils/app_styles.dart';
import 'package:festore/models/UsersModel.dart';
import 'package:flutter/material.dart';
import '../DBHelper/DatabaseHelper.dart';
import '../Widgets/Bottom_Bars.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}
var namectrl = TextEditingController();
var emailctrl = TextEditingController();
var passwordctrl = TextEditingController();
var phonumctrl = TextEditingController();
class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey.shade300,
      body: Center(
        child: Container(
          width: 400,
          height: 800,
          color: Colors.grey,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 800,
                  width: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:  AssetImage("assets/images/3.jpg"),
                          fit: BoxFit.fill,
                          opacity: 0.7)),
                ),
              ),
              Center(
                child: Container(
                  width: 330,
                  height: 770,
                  decoration: BoxDecoration(
                      color: const Color(0x79999a9c),
                      borderRadius: BorderRadius.circular(15)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20,),
                            child: Text(" Welcom to EShop", style: Styles.headLineStyle.copyWith(color: const Color(0xA8050A23)))),// Sign in Txt
                        Container(
                            margin: const EdgeInsets.only(top: 20,bottom: 40),
                            child: Text("Sign In", style: Styles.headLineStyle2.copyWith(color: const Color(0xA8050A23)))),// Sign in Txt
                        Container(
                            margin: const EdgeInsets.only(right: 125, bottom: 5),
                            child: Text("Enter Your Name:", style: Styles.headLineStyle2.copyWith(color: const Color(0xA8050A23)),)),// Name Txt
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: namectrl,
                            decoration: const InputDecoration(
                                label:  Text("Name:", style: TextStyle(color: Color(0xA8050A23))),
                                icon:  Icon(Icons.person, color: Color(0xA8050A23)),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),// Name Form
                        const SizedBox(height: 50,),
                        Container(
                            margin: const EdgeInsets.only(right: 180, bottom: 5),
                            child: Text("Enter Email:", style: Styles.headLineStyle2.copyWith(color: const Color(0xA8050A23)),)),// Email Txt
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: emailctrl,
                            decoration: const InputDecoration(
                                label: Text("Email:", style: TextStyle(color: Color(0xA8050A23))),
                                icon: Icon(Icons.alternate_email_sharp, color: Color(0xA8050A23)),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),// Email form
                        const SizedBox(height: 50,),
                        Container(
                            margin: const EdgeInsets.only(right: 150, bottom: 5),
                            child: Text("Enter Password:", style: Styles.headLineStyle2.copyWith(color: const Color(0xA8050A23)),)),// Password Txt
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: passwordctrl,
                            obscureText: true,
                            decoration: const InputDecoration(
                                label: Text("Password:", style: TextStyle(color: Color(0xA8050A23))),
                                icon: Icon(Icons.password, color: Color(0xA8050A23)),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),// Password From
                        const SizedBox(height: 50,),
                        Container(
                            margin: const EdgeInsets.only(right: 100, bottom: 5),
                            child: Text("Enter Phone Number:", style: Styles.headLineStyle2.copyWith(color: const Color(0xA8050A23)),)), // Phone Txt
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: phonumctrl,
                            keyboardType:TextInputType.number ,
                            decoration: const InputDecoration(
                                label: Text("Phone Number:", style: TextStyle(color: Color(0xA8050A23))),
                                icon:  Icon(Icons.numbers, color: Color(0xA8050A23)),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),// Phone Form
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color:Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 1,
                                    blurRadius: 15)
                              ]),
                          child: TextButton(
                            onPressed: () async{
                              var u1 = UsersModel(name: namectrl.text,email: emailctrl.text,password: passwordctrl.text,phonenumber: phonumctrl.text);
                              var res = await DatabaseHelper().insertUser(u1.toJson());
                              if(res > 0 ){
                                Navigator.pushReplacement(
                                    context,MaterialPageRoute(builder: (context) => BottomBars()));
                              }
                              else{
                                showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(Icons.crisis_alert),
                                        Text("Warning"),
                                      ],
                                    ),
                                    content: Text("User Not Inserted"),
                                  );
                                });
                              }
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomBars()));
                            },
                            child: Text("Sign In",style: Styles.headLineStyle3.copyWith(color: Colors.white),),

                          )
                        ),// Sing in button
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
