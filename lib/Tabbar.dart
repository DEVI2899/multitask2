
import 'package:ecommerce_app/animationController/cubeanimation.dart';
import 'package:ecommerce_app/bottomNavBar/adddetails.dart';
import 'package:ecommerce_app/bottomNavBar/calender.dart';
import 'package:ecommerce_app/bottomNavBar/grocery.dart';
import 'package:ecommerce_app/xml%20parsing/xmlparse.dart';
import 'package:flutter/material.dart';
import 'ActionListener/ActionListenerpage.dart';

import 'animationController/animation.dart';
import 'bottomNavBar/searchlocation.dart';

class TabBars extends StatefulWidget {
  const TabBars({super.key});

  @override
  State<TabBars> createState() => _TabBarsState();
}

class _TabBarsState extends State<TabBars> {



  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
      child: Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.redAccent,
         title: const Text('Tab bar testing'),
         bottom: const TabBar(
           tabs: [
             Tab(icon: Icon(Icons.person)),
             Tab(icon: Icon(Icons.connect_without_contact)),
             Tab(icon: Icon(Icons.accessibility_new_rounded)),
             Tab(icon: Icon(Icons.bakery_dining_sharp)),

           ],
         ),
       ),
        body:  TabBarView(
          children: [
            const Actionlistenerpage(),
            const xmlParse(),
            const Animations(),
            MyHomeScreen()

          ],

        ),

      ),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: NestedTabBar()
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar({super.key});

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar> {
  int _selectedIndex =0;
  void ontapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
          body: Container(
                color: Colors.white,
                child: _selectedIndex ==0 ?const add_details()
                    :_selectedIndex == 1 ? const CubeAnimation()
                    : _selectedIndex == 2 ? const calender()
                    :_selectedIndex == 3 ? grocery()
                    : const search()

            ),

          bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_box_outlined,),
                    label: 'add',
                    tooltip: 'add box',
                    backgroundColor: Colors.green
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.badge,),
                    label:'badge' ,
                    tooltip: 'badge',
                    backgroundColor: Colors.pink
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month,),
                    label: 'calender',
                    tooltip: 'calender',
                    backgroundColor: Colors.yellow
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.dataset_sharp,),
                    label: 'dataset',
                    tooltip: 'dataset',
                    backgroundColor: Colors.red
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.edit_location,),
                    label: 'edit_location',
                    tooltip: 'edit-location',
                    backgroundColor: Colors.green
                )
              ],
              type: BottomNavigationBarType.shifting,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black54,
              onTap: ontapped,
              elevation: 5
          ),

      );
  }
}
