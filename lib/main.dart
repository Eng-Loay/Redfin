import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:red_fin/auth/signup.dart';
import 'auth/login.dart';
import 'categories/add.dart';
import 'landing.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:red_fin/forsale.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "signup" : (context) => const SignUp(),
        "login" : (context) => const Login(),
        "homepage" : (context) => const LandingPage(),
        "addHome"  : (context) => const AddCategory(),
        "forsale" : (context) => const ForSale()

      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('========User is currently signed out!');
      } else {
        print('========User is signed in!');
      }
    });
    super.initState();
  }
  double _top = 800; // Initial top position of the icon
  double _left = 180.0; // Initial left position of the icon
  double _minTop = 50.0; // Minimum allowed top position
  double _maxTop = 100.0; // Maximum allowed top position
  bool _reachedMaxHeight = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 85.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText('Redfin'),
                          ],
                          isRepeatingAnimation: true,
                          onTap: () {},
                        ),
                        const Text('Discover Your Dream Home', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 600.0, end: _top),
            duration: const Duration(seconds: 1),
            builder: (BuildContext context, double top, Widget? child) {
              return Positioned(
                top: top,
                left: _left,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      _top = (_top + details.delta.dy).clamp(_minTop, _maxTop);

                      // Check if max height is reached
                      if (_top == _minTop) {
                        _reachedMaxHeight = true;
                      } else {
                        _reachedMaxHeight = false;
                      }
                    });
                  },
                  onPanEnd: (details) {
                    if (_reachedMaxHeight) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LandingPage()),
                      );
                    } else {
                      // Reset position to initial if max height is not reached
                      setState(() {
                        _top = 800.0; // Reset to initial top position
                      });
                    }
                  },
                  child: const Icon(
                    Icons.arrow_upward,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

