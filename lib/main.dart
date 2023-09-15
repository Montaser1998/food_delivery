import 'package:flutter/material.dart';
import 'package:food_delivery/pages/discount_page.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar
  String text = "Home";

  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  List<Widget> widgetBuilder = const [
    HomePage(),
    DiscountPage(),
    FavoritePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: widgetBuilder[selectedIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation
            .centerDocked, //specify the location of the FAB
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              clickedCentreFAB =
                  !clickedCentreFAB; //to update the animated container
            });
          },
          tooltip: "Centre FAB",
          elevation: 4.0,
          child: Container(
            margin: const EdgeInsets.all(12.0),
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 32.0,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          //color of the BottomAppBar
          color: Colors.white,
          child: Container(
            margin: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  //update the bottom app bar view each time an item is clicked
                  onPressed: () {
                    updateTabSelection(0, "Home");
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.home_outlined,
                    //darken the icon if it is selected or else give it a different color
                    color: selectedIndex == 0
                        ? Colors.orange.shade900
                        : Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(1, "Discount");
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.discount_outlined,
                    color: selectedIndex == 1
                        ? Colors.orange.shade900
                        : Colors.grey.shade400,
                  ),
                ),
                //to leave space in between the bottom app bar items and below the FAB
                const SizedBox(
                  width: 50.0,
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(2, "Favorite");
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.favorite_outline_outlined,
                    color: selectedIndex == 2
                        ? Colors.orange.shade900
                        : Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(3, "Profile");
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.person_2_outlined,
                    color: selectedIndex == 3
                        ? Colors.orange.shade900
                        : Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
