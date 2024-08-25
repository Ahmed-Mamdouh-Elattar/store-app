import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/widgets/profile_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Store App'),
      ),
      body: const ProfileBody(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1)),
        ),
        child: BottomNavigationBar(
          elevation: 20,
          backgroundColor: Colors.white,
          fixedColor: Colors.deepPurpleAccent,
          currentIndex: 0,
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
