import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'componants/nav.dart';
import 'forsale.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({super.key});

  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  int _selectedDay = DateTime.now().day;
  bool isSelected = false;
  bool isSelected2 = false;

  dynamic data;
  String currentPage = 'For Sale'; // State is lifted up here

  @override
  void initState() {
    super.initState();
    // Defer context-sensitive logic until after initState completes
    Future.delayed(Duration.zero, () {
      // Retrieve the data passed from the previous screen
      data = ModalRoute.of(context)!.settings.arguments;
      // Trigger a rebuild to reflect the changes
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (data == null) {
      return const CircularProgressIndicator();
    }
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
              icon: SvgPicture.asset(
                'images/iconmenu.svg',
              ),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SvgPicture.asset('images/Redfin2.svg'),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: SizedBox(
              width: 70.0,
              height: 70.0,
              child: SvgPicture.asset('images/arrow_left.svg'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForSale()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Overview",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight, // set the alignment here
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.end, // align the text to the right
                      children: [
                        const Icon(Icons.favorite_border),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("Favourite"),
                        const SizedBox(
                            width: 30), // add some spacing between the icons
                        SvgPicture.asset(
                          'images/share_icon.svg',
                          width: 20.46,
                          height: 21.2,
                        ),
                        const SizedBox(
                            width:
                                8), // add some spacing between the icons and the text
                        const Text("Share",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: data != null
                  ? Image.network(
                      '${data['imageLink']}',
                      fit: BoxFit.cover,
                    )
                  : const CircularProgressIndicator(),
            ),
            Container(
              height: 20,
            ),
            Text.rich(
              TextSpan(
                text: '${data['address']}'.split(',')[0],
                style: const TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text:
                        ', ${'${data['address']}'.split(',').skip(1).join(', ')}',
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text("${data['price']}"),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("${data['bed']}"),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("${data['bath']}"),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("${data['size']}"),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "\$5,400/mo",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'images/bedroom.svg',
                      width: 20.46,
                      height: 21.2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'images/bathroom.svg',
                      width: 20.46,
                      height: 21.2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Sq Ft"),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Go tour this home",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    width: size.width,
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 4,
                      itemPadding: const EdgeInsets.symmetric(
                          horizontal: 2.0), // decrease the horizontal padding
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30, // Number of days in the month
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDay = index + 1;
                      });
                    },
                    child: Container(
                      width: 50,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: _selectedDay == index + 1
                            ? const Color(0xFFDD1616)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Day',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _selectedDay == index + 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isSelected = !isSelected;
                      isSelected2=false;

                    });
                  },
                  child: Container(
                      width: 70,
                      height: 44,
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFDD1616): Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             SvgPicture.asset(
                              'images/home_icon.svg',
                            ),
                            const Text(
                              'Tour in \n person',
                              style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold), // Adjust the font size as needed
                            ),
                          ],
                        ),
                  
                      ),
                  
                  ),
                ),
                const SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isSelected2 = !isSelected2;
                      isSelected=false;
                    });
                  },
                  child: Container(
                    width: 84,
                    height: 44,
                      decoration: BoxDecoration(
                        color: isSelected2 ? const Color(0xFFDD1616) : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone_android),
                          Text(
                            'Tour via\nvideo chat',
                            style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold), // Adjust the font size as needed
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]
            ),
            const SizedBox(height: 15,),
            Center(
              child: Container(
                width:230 ,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFDD1616),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text('Schedule tour',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)),
              ),
            ),
           Container(height: 15,),
           const Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Or",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
             ],
           ),
          ],
        ),
      ),
      drawer: NavigationDrawers(
          currentPage: currentPage,
          onPageSelected: (page) {
            setState(() {
              currentPage = page;
            });
          }),
    );
  }
}
