import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'landing.dart'; // Import the LandingPage if not already imported
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Contact());
}

class Contact extends StatelessWidget {
  const Contact({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar:true ,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (context) => Container(
              width: 45,
              height: 31,
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: SvgPicture.asset('images/asidelight.svg'),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/contact.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/iconred.png'),
                  ),
                  Text(
                    "Contact Us",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'We’re here to help!',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      color: Colors.teal.shade100,
                      fontSize: 20.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 150.0,
                    child: Divider(
                      color: Colors.teal.shade100,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'essamloay2@gmail.com',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.report_problem,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'Send a Report',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: NavigationDrawer(),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: StrokeText(
              text: 'Redfin',
              textStyle: TextStyle(color: Color(0xFFB12929), fontSize: 44,fontWeight: FontWeight.bold),
              strokeColor: Colors.white,
              strokeWidth: 5,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_offer),
            title: Text('For Sale',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto')),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('News',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text('Contact us',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
            tileColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contact()),
              );
            },
          ),
        ],
      ),
    );
  }
}
