import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tharwat_shop_app/pages/home_page.dart';
import 'package:tharwat_shop_app/pages/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      routes: {
        HomePage.homePageRoute: (context) => const HomePage(),
        UpdateProductPage.updatePageRoute: (context) => const UpdateProductPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.homePageRoute,
    );
  }
}