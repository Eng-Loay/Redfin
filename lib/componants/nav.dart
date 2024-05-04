import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_fin/auth/signup.dart';
import 'package:red_fin/contact.dart';
import 'package:red_fin/forsale.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:red_fin/about.dart';
import 'package:red_fin/auth/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:red_fin/offers.dart';
import 'package:red_fin/landing.dart';

class NavigationDrawerss extends StatelessWidget {
  const NavigationDrawerss({super.key});

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
                  fontWeight: FontWeight.bold),
              strokeColor: Colors.white,
              strokeWidth: 5,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text(
              'About',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const About()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title: const Text('For Sale',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto')),
            tileColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForSale()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.price_check),
            title: const Text(
              'Offers',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Offers()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text(
              'Contact us',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Contact()),
              );
            },
          ),
        ],
      ),
    );
  }
}
