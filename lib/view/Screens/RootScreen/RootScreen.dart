import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smc_iot/view/Screens/HomeLayoutScreen/HomeLayoutScreen.dart';
import 'package:smc_iot/view/Screens/SplashScreen/splashScreen.dart';
import 'package:smc_iot/viewModel/cubit/EspCubit/esp_cubit.dart';

import '../../../Style/Theme Mange/DarkTheme.dart';
import '../../../Style/Theme Mange/LightTheme.dart';

class rootScreen extends StatelessWidget {
  String token;

  rootScreen(this.token, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EspCubit()..getEspData(),
      child: MaterialApp(
        home: token==''?splash():const HomeLayoutScreen(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    );
  }
}