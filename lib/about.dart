import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroke_text/stroke_text.dart';

import 'contact.dart';
import 'forsale.dart';
import 'landing.dart';
import 'offers.dart';
import 'componants/nav.dart';

class About extends StatelessWidget {
  const About({super.key});

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
          title: SvgPicture.asset('images/Redfin2.svg'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            width: 412,
            height: 273,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/about.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Company information',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 50,),
          Container(
            width:400 ,
            height: 90,
            padding: EdgeInsets.all(20),
            child: Text("Providing customers with\n comprehensive real estate solutions",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ,),textAlign: TextAlign.center,),


            ),
          Container(
            width:420 ,
            height: 110,
            padding: EdgeInsets.all(20),
            child: Text("Redfin is a leading real estate company leveraging technology to assist customers in finding homes, offering brokerage, rental, lending, title insurance, and renovation services.",style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
          ),
          Container(
            // padding: EdgeInsets.only(left: 100),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(width: 150,height: 170,child: Text("access to top agents and on-demand home tours for buyers. Their lending and title services facilitate quick closings, while their renovations crew helps sellers",style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),),
                Container(width: 20,),
                Container(padding: EdgeInsets.only(bottom: 70),child: Image.asset("images/family.png",width: 137,height: 92,))
              ],
            ),
          ),

        ],
      ),
      drawer:const NavigationDrawerss() ,
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
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LandingPage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.info),
//             title: const Text('About',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
//             tileColor: Colors.red,
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
//               );            },
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