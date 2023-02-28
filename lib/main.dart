import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smc_iot/constant.dart';
import 'package:smc_iot/viewModel/DataBase/local/cash_helper.dart';
import 'package:smc_iot/viewModel/DataBase/remote/DioHelper.dart';
import 'package:smc_iot/viewModel/DataBase/remote/FireBase/firebase_options.dart';
import 'view/Screens/RootScreen/RootScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CashHelper.init();
 // Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Token = CashHelper.getData(key: 'Token')??'';
  runApp(rootScreen(Token!));
}
//flutter build apk --split-per-abi


/*
web       1:224899509093:web:6ac1d09e46e35b2cbccf8c
android   1:224899509093:android:912dae58cc0b67ecbccf8c
ios       1:224899509093:ios:e386c7b05a529464bccf8c

 */