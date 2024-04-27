import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroke_text/stroke_text.dart';

import 'about.dart';
import 'contact.dart';
import 'landing.dart';
import 'offers.dart';

class ForSale extends StatelessWidget {
  const ForSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          leading: Builder(
            builder: (context) => SizedBox(
              width: 45,
              height: 31,
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: SvgPicture.asset('images/iconmenu.svg',)
                ,
              ),
            ),
          ),
          title: Padding(
            padding:EdgeInsets.only(top: 15) ,
            child: SvgPicture.asset('images/Redfin2.svg'),
          ),


          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: SizedBox(
                width: 70.0,
                height: 70.0,
                child: SvgPicture.asset('images/arrow_right.svg'),
              ),
              onPressed: () {
              },
            )
            ,
          ],
        ),
      body: Container(
        child: Column(
          children: [
            Container(height: 20,),
            Row(

              children: [
                Container(
                  width: 176,
                  height: 227,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('images/Home1.png',fit: BoxFit.cover,),
                      Row(
                        children: [
                          Text(
                            '\$1\,800\,000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 40,),
                          GestureDetector(
                            onTap: () {
                              // Add tap functionality here
                            },
                            child: SvgPicture.asset(
                              'images/share_icon.svg',
                              width:
                              20.46,
                              height:
                              21.2,
                            ),
                          ),
                          SizedBox(width: 2,),
                          Icon(Icons.favorite_border)
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '4 Bed 5 Bath',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '207 W Clarendon Ave Unit 3D',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 55,),
                Container(
                  width: 176,
                  height: 227,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('images/Home2.png',fit: BoxFit.cover,),
                      Row(
                        children: [
                          Text(
                            '\$1\,800\,000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 40,),
                          GestureDetector(
                            onTap: () {
                              // Add tap functionality here
                            },
                            child: SvgPicture.asset(
                              'images/share_icon.svg',
                              width:
                              20.46,
                              height:
                              21.2,
                            ),
                          ),
                          SizedBox(width: 2,),
                          Icon(Icons.favorite_border)
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '4 Bed 5 Bath',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '207 W Clarendon Ave Unit 3D',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25,),
            Row(
              children: [
                Container(
                  width: 176,
                  height: 227,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('images/Home3.png',fit: BoxFit.cover,),
                      Row(
                        children: [
                          Text(
                            '\$1\,800\,000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 40,),
                          GestureDetector(
                            onTap: () {
                              // Add tap functionality here
                            },
                            child: SvgPicture.asset(
                              'images/share_icon.svg',
                              width:
                              20.46,
                              height:
                              21.2,
                            ),
                          ),
                          SizedBox(width: 2,),
                          Icon(Icons.favorite_border)
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '4 Bed 5 Bath',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '207 W Clarendon Ave Unit 3D',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 55,),
                Container(
                  width: 176,
                  height: 227,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('images/Home4.png',fit: BoxFit.cover,),
                      Row(
                        children: [
                          Text(
                            '\$1\,800\,000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 40,),
                          GestureDetector(
                            onTap: () {
                              // Add tap functionality here
                            },
                            child: SvgPicture.asset(
                              'images/share_icon.svg',
                              width:
                              20.46,
                              height:
                              21.2,
                            ),
                          ),
                          SizedBox(width: 2,),
                          Icon(Icons.favorite_border)
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '4 Bed 5 Bath',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '207 W Clarendon Ave Unit 3D',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25,),
            Row(
              children: [
                Container(
                  width: 176,
                  height: 227,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('images/Home5.png',fit: BoxFit.cover,),
                      Row(
                        children: [
                          Text(
                            '\$1\,800\,000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 40,),
                          GestureDetector(
                            onTap: () {
                              // Add tap functionality here
                            },
                            child: SvgPicture.asset(
                              'images/share_icon.svg',
                              width:
                              20.46,
                              height:
                              21.2,
                            ),
                          ),
                          SizedBox(width: 2,),
                          Icon(Icons.favorite_border)
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '4 Bed 5 Bath',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '207 W Clarendon Ave Unit 3D',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 55,),
                Container(
                  width: 176,
                  height: 227,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('images/Home6.png',fit: BoxFit.cover,),
                      Row(
                        children: [
                          Text(
                            '\$1\,800\,000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 40,),
                          GestureDetector(
                            onTap: () {
                              // Add tap functionality here
                            },
                            child: SvgPicture.asset(
                              'images/share_icon.svg',
                              width:
                              20.46,
                              height:
                              21.2,
                            ),
                          ),
                          SizedBox(width: 2,),
                          Icon(Icons.favorite_border)
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '4 Bed 5 Bath',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '207 W Clarendon Ave Unit 3D',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      drawer:NavigationDrawer() ,
    );
  }
}
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: StrokeText(
              text: 'Redfin',
              textStyle: TextStyle(color: Color(0xFFB12929), fontSize: 44,fontWeight: FontWeight.bold),
              strokeColor: Colors.white,
              strokeWidth: 5,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
              );            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const About()),
              );            },
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title: const Text('For Sale',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto')),
            tileColor: Colors.red,

            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.price_check),
            title: const Text('Offers',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Offers()),
              );            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('Contact us',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Contact()),
              );            },
          ),
        ],
      ),
    );
  }
}