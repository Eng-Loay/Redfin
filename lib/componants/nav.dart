import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_fin/about.dart';
import 'package:red_fin/contact.dart';
import 'package:red_fin/forsale.dart';
import 'package:red_fin/landing.dart';
import 'package:red_fin/offers.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../profile.dart';

class NavigationDrawers extends StatefulWidget {
  final String currentPage;
  final Function(String) onPageSelected;
  NavigationDrawers({required this.currentPage, required this.onPageSelected});

  @override
  State<NavigationDrawers> createState() => _NavigationDrawersState();
}

class _NavigationDrawersState extends State<NavigationDrawers> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          _isLoggedIn = false;
        });
      } else {
        setState(() {
          _isLoggedIn = true;
        });
      }
    });
  }

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
          if (_isLoggedIn) // Conditionally show the Profile option
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
                widget.onPageSelected('ProfilePage'); // Update current page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              selected: widget.currentPage == 'ProfilePage',
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
              widget.onPageSelected('Home'); // Update current page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
            },
            selected: widget.currentPage == 'Home',
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
              widget.onPageSelected('About'); // Update current page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const About()),
              );
            },
            selected: widget.currentPage == 'About',
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
              widget.onPageSelected('For Sale'); // Update current page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForSale()),
              );
            },
            selected: widget.currentPage == 'For Sale',

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
              widget.onPageSelected('Offers'); // Update current page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Offers()),
              );
            },
            selected: widget.currentPage == 'Offers',
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
              widget.onPageSelected('Contact us'); // Update current page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Contact()),
              );
            },
            selected: widget.currentPage == 'Contact us',
          ),
        ],
      ),
    );
  }
}
