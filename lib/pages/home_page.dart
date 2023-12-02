import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tharwat_shop_app/widgets/future_grid_view_builder_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String homePageRoute = "HomePage";
  static List<int> favList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            statusBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        title: const Text(
          "New Trend",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FutureGridViewBuilder(
        context: context,
      ),
    );
  }
}
