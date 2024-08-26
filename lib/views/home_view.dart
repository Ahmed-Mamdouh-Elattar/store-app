// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/cubits/products_category/products_category_cubit.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/cubits/user_data_cubit/user_data_cubit.dart';

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
    fetchUserData();
    getAllProducts();
    getInitialProductsCategory();
  }

  Future<void> fetchUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(kUserId)) {
      await BlocProvider.of<UserDataCubit>(context).getUserData();
    }
  }

  Future<void> getAllProducts() async {
    await BlocProvider.of<ProductsCubit>(context).getAllProducts();
  }

  Future<void> getInitialProductsCategory() async {
    await BlocProvider.of<ProductsCategoryCubit>(context)
        .getProductsCategory("beauty");
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
          border: Border.all(color: Colors.black.withOpacity(0.3)),
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
