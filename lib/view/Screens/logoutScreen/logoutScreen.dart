import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:Lottie.network('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/logout.json?alt=media&token=ce8967a0-f6f3-4e60-9a55-a7b7fb6250e0',),
    );
  }
}
