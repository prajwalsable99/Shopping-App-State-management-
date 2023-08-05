import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
// import 'package:shopping_app/homepage.dart';
import 'package:shopping_app/main_page.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return  ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        
          title: "Shop it",
          debugShowCheckedModeBanner: false,
          home:const MainPage(),
    
    
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 198, 236, 197)),
            // primaryColor: Colors.amber,
            useMaterial3: true,
          ),
      ),
    );
  }
}
