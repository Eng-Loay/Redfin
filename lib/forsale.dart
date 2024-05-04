import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  var size,height,width;
  List<QueryDocumentSnapshot> data= [];
  getData() async
  {
  QuerySnapshot querySnapshot =  await  FirebaseFirestore.instance.collection("HomeDetails").get();
  data.addAll(querySnapshot.docs);
  setState(() {

  });
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
        onPressed: (){
        Navigator.of(context).pushNamed("addHome");
      },
      child: Icon(Icons.add),),
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
        body: GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
              mainAxisSpacing: 13,
              crossAxisSpacing: 13
            ),
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
                    Image.network('${data[i]['imageLink']}', fit: BoxFit.cover,),
                    Row(
                      children: [
                        Text(
                          '${data[i]['price']}',
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
                            width: 20.46,
                            height: 21.2,
                          ),
                        ),
                        SizedBox(width: 2,),
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
            }
        ),
      drawer:NavigationDrawerss() ,
    );
  }
}
