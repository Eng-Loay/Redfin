import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_fin/auth/signup.dart';
import 'package:red_fin/contact.dart';
import 'package:red_fin/forsale.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about.dart';
import 'auth//login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'componants/nav.dart';

import 'offers.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _isLoggedIn = false;
  @override
  void initState() {
    _login(); // Call the login method to start listening to authentication state changes
    super.initState();
  }

  void _login() {
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

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn googleSignIn =GoogleSignIn();
    googleSignIn.disconnect();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: <Widget>[





          Container(
            height: _isLoggedIn ? null : MediaQuery.of(context).size.height * 0.89,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('images/landing.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.5),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),

          AppBar(
            backgroundColor: Colors.transparent,
            leading: Builder(
              builder: (context) => SizedBox(
                width: 45,
                height: 31,
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: SvgPicture.asset('images/iconmenu.svg'),
                ),
              ),
            ),
            actions: [
              if (_isLoggedIn)
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: TextButton(
                    onPressed: _logout,
                    child: Text(
                      'Sign out',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: SvgPicture.asset(
                          'images/Redfin.svg',
                          semanticsLabel: 'Acme Logo',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                        padding: const EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'City, Address, School, Agent, ZIP',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                color: Colors.red,
                                child: IconButton(
                                  icon: const Icon(Icons.search),
                                  onPressed: () {
                                    // Handle search button press
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 200,
                          height: 39,
                          decoration: const BoxDecoration(
                            color: Color(0xFF5F5B5B),
                          ),
                          child: const Center(
                            child: Text(
                              'search',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(

                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      GestureDetector(
                        onTap: () async {
                          final url = Uri.parse('https://www.facebook.com/redfin');
                          Future<void> _launchUrl() async {
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          }
                          await _launchUrl();
                        }
                        ,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Image.asset(
                            'images/facebook.png',
                            width: 50,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final url = Uri.parse('https://www.instagram.com/redfinrealestate');
                          Future<void> _launchUrl() async {
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          }
                          await _launchUrl();
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Image.asset(
                            'images/instagram.png',
                            width: 50,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final url = Uri.parse('https://twitter.com/Redfin');
                          Future<void> _launchUrl() async {
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          }
                          await _launchUrl();
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Image.asset(
                            'images/twitter.png',
                            width: 50,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final url = Uri.parse('https://www.youtube.com/@redfin');
                          Future<void> _launchUrl() async {
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          }
                          await _launchUrl();
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Image.asset(
                            'images/youtube.png',
                            width: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.022),
                  child: Visibility(
                    visible: !_isLoggedIn,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 175,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Login()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 3.0,
                                ),                            ),
                              child: const Center(
                                child: Text('Login',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 175,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          child: GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignUp()),
                              );
                              }
                            ,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Center(
                                child: Text('Register',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )              ],
            ),
          ),
        ],
      ),
      drawer: const NavigationDrawerss(),
    );
  }
}

// class NavigationDrawer extends StatelessWidget {
//   const NavigationDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           const DrawerHeader(
//             child: StrokeText(
//               text: 'Redfin',
//               textStyle: TextStyle(color: Color(0xFFB12929), fontSize: 44,fontWeight: FontWeight.bold),
//               strokeColor: Colors.white,
//               strokeWidth: 5,
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.home),
//             title: const Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
//             tileColor: Colors.red,
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.info),
//             title: const Text('About',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const About()),
//               );            },
//           ),
//           ListTile(
//             leading: const Icon(Icons.local_offer),
//             title: const Text('For Sale',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto')),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ForSale()),
//               );             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.price_check),
//             title: const Text('Offers',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const Offers()),
//               );
//               },
//           ),
//           ListTile(
//             leading: const Icon(Icons.contact_page),
//             title: const Text('Contact us',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const Contact()),
//               );            },
//           ),
//         ],
//       ),
//     );
//   }
// }