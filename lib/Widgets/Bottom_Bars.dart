
import 'package:festore/Screens/HomeScreen.dart';
import 'package:festore/Widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../Pages/CartPage.dart';

class BottomBars extends StatefulWidget {
  const BottomBars({Key? key}) : super(key: key);

  @override
  State<BottomBars> createState() => _BottomBarsState();
}

class _BottomBarsState extends State<BottomBars> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    // Text("Bookmarks"),
    CartPage(),
    Text("Profile"),
  ];
  void onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GetDrawer(context),
      appBar: AppBar(title:
        Container(
          padding: EdgeInsets.symmetric(horizontal: 90),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.shopping_cart),
              Text("Store")],),
        ),
      ),
      body:Center(child: _widgetOptions[_selectedIndex],),
      bottomNavigationBar: NavigationBar(
        elevation: 10,
        animationDuration:  Duration(seconds: 1),
        selectedIndex: _selectedIndex,
        onDestinationSelected: onTapped,
        destinations: _navBarItems,
      ),
    );
  }
}
const _navBarItems = [
  NavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),

  // NavigationDestination(
  //   icon: Icon(Icons.bookmark_border_outlined),
  //   selectedIcon: Icon(Icons.bookmark_rounded),
  //   label: 'Bookmarks',
  // ),
  NavigationDestination(
    icon: Icon(Icons.shopping_bag_outlined),
    selectedIcon: Icon(Icons.shopping_bag),
    label: 'Cart',
  ),
  NavigationDestination(
    icon: Icon(Icons.person_outline_rounded),
    selectedIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
];