import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:store_app/widgets/products_body.dart';
import 'package:store_app/widgets/products_category_body.dart';
import 'package:store_app/widgets/profile_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  int viewIndex = 1;
  List<Widget> homeViews = const [
    ProfileBody(),
    ProductsBody(),
    ProductsCategoryBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Store App'),
      ),
      body: homeViews[viewIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1)),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              viewIndex = value;
            });
          },
          elevation: 20,
          backgroundColor: Colors.white,
          fixedColor: Colors.deepPurpleAccent,
          currentIndex: viewIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.idCard),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              label: "Products",
              icon: Icon(FontAwesomeIcons.idCard),
            ),
            BottomNavigationBarItem(
              label: "Categories",
              icon: Icon(FontAwesomeIcons.layerGroup),
            ),
          ],
        ),
      ),
    );
  }
}
