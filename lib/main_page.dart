import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';
import 'package:shopping_app/homepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currPage=0;
  List<Widget> pages=const [HomePage(),CartPage()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  IndexedStack(
        index: currPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
            setState(() {
              currPage=value;
            });
        },
        currentIndex: currPage,
        items: const [
        BottomNavigationBarItem(icon:  Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon:  Icon(Icons.shopping_cart),label: "Cart"),
      ]),
    );
  }
}
