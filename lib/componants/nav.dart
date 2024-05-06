import 'package:flutter/material.dart';
import 'package:red_fin/about.dart';
import 'package:red_fin/contact.dart';
import 'package:red_fin/forsale.dart';
import 'package:red_fin/landing.dart';
import 'package:red_fin/offers.dart';
import 'package:stroke_text/stroke_text.dart';

import '../profile.dart';

class NavigationDrawers extends StatelessWidget {
  final String currentPage;
  final Function(String) onPageSelected;

  NavigationDrawers({required this.currentPage, required this.onPageSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: StrokeText(
              text: 'Redfin',
              textStyle: TextStyle(
                color: Color(0xFFB12929),
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
              strokeColor: Colors.white,
              strokeWidth: 5,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              'ProfilePage',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            onTap: () {
              onPageSelected('ProfilePage'); // Update current page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            selected: currentPage == 'ProfilePage',
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            onTap: () {
              onPageSelected('Home'); // Update current page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
            },
            selected: currentPage == 'Home',
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text(
              'About',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            onTap: () {
              onPageSelected('About'); // Update current page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const About()),
              );
            },
            selected: currentPage == 'About',
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title: const Text(
              'For Sale',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            onTap: () {
              onPageSelected('For Sale'); // Update current page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForSale()),
              );
            },
            selected: currentPage == 'For Sale',

          ),
          ListTile(
            leading: const Icon(Icons.price_check),
            title: const Text(
              'Offers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            onTap: () {
              onPageSelected('Offers'); // Update current page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Offers()),
              );
            },
            selected: currentPage == 'Offers',
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text(
              'Contact us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            onTap: () {
              onPageSelected('Contact us'); // Update current page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Contact()),
              );
            },
            selected: currentPage == 'Contact us',
          ),
        ],
      ),
    );
  }
}
