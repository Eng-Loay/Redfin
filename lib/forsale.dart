import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'about.dart';
import 'contact.dart';
import 'landing.dart';
import 'offers.dart';
import 'componants/nav.dart';

class ForSale extends StatefulWidget {
  const ForSale({super.key});

  @override
  State<ForSale> createState() => _ForSaleState();
}

class _ForSaleState extends State<ForSale> {
  String currentPage = 'For Sale'; // State is lifted up here
  var size, height, width;
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;
  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("HomeDetails").get();
    data.addAll(querySnapshot.docs);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.of(context).pushNamed("addHome");
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => SizedBox(
            width: 45,
            height: 31,
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset(
                'images/iconmenu.svg',
              ),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
            },
            icon: SvgPicture.asset('images/Redfin2.svg'),
          ),

        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: SizedBox(
              width: 70.0,
              height: 70.0,
              child: SvgPicture.asset('images/arrow_right.svg'),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13),
              itemBuilder: (context, i) {
                return Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Image.network(
                          '${data[i]['imageLink']}',
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed("moredetails", arguments: data[i]);
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            '${data[i]['price']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Add tap functionality here
                            },
                            child: SvgPicture.asset(
                              'images/share_icon.svg',
                              width: 20.46,
                              height: 21.2,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(Icons.favorite_border)
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${data[i]['bed']} Bed ${data[i]['bath']} Bath',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${data[i]['address']}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              }),
      drawer: NavigationDrawers(
          currentPage: currentPage,
          onPageSelected: (page) {
            setState(() {
              currentPage =
                  page;
            });
          }),
    );
  }
}
