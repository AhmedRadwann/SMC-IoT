import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smc_iot/Style/ColorMange/ColorManger.dart';

PreferredSizeWidget CustomAppBar(context)=>AppBar(
  elevation: 0,
  centerTitle: false,
  automaticallyImplyLeading: false,
  title:  Text('SMC IOT',style: Theme.of(context).textTheme.bodyText1,),
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Image.network('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/Splash.png?alt=media&token=6a7b24a4-72aa-4ee4-928e-13da9f8fccee',width: 75,height: 40,),
    ),
  ],
);