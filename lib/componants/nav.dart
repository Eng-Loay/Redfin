import 'package:flutter/material.dart';
import 'package:red_fin/about.dart';
import 'package:red_fin/contact.dart';
import 'package:red_fin/forsale.dart';
import 'package:red_fin/landing.dart';
import 'package:red_fin/offers.dart';
import 'package:stroke_text/stroke_text.dart';

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
          DrawerHeader(
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
            leading: Icon(Icons.home),
            title: Text(
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
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
            selected: currentPage == 'Home',
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
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
                MaterialPageRoute(builder: (context) => About()),
              );
            },
            selected: currentPage == 'About',
          ),
          ListTile(
            leading: Icon(Icons.local_offer),
            title: Text(
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
                MaterialPageRoute(builder: (context) => ForSale()),
              );
            },
            selected: currentPage == 'For Sale',

          ),
          ListTile(
            leading: Icon(Icons.price_check),
            title: Text(
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
                MaterialPageRoute(builder: (context) => Offers()),
              );
            },
            selected: currentPage == 'Offers',
          ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text(
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
                MaterialPageRoute(builder: (context) => Contact()),
              );
            },
            selected: currentPage == 'Contact us',
          ),
        ],
      ),
    );
  }
}
