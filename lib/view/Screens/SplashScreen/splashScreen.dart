import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smc_iot/Style/ColorMange/ColorManger.dart';
import 'package:smc_iot/view/Screens/LoginScreen/LoginScreen.dart';


class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/Splash.png?alt=media&token=6a7b24a4-72aa-4ee4-928e-13da9f8fccee",
                width: double.infinity,
                height: 130,
              ),
            ),
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 7.0,
              animationDuration: 2000,
              percent: 1,
              barRadius: const Radius.circular(10),
              progressColor: ColorManger.redColor,
              onAnimationEnd: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>LoginScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}