import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return LottieBuilder.asset(
      'images/home.json',
      width: size.width,
      height: size.height*0.2,
    );
  }
}
