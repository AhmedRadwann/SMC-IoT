import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smc_iot/view/Screens/HomeScreen/homeScreen.dart';
import 'package:smc_iot/view/Screens/logoutScreen/logoutScreen.dart';
import '../../../view/Screens/AutomationScreen/AutomationScreen.dart';
import '../../../view/Screens/MapScreen/map.dart';
part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  List<Widget> widgetOptions = <Widget>[
     const homeScreen(),
     const AutomationScreen(),
    const map(),
     const LogoutScreen(),

  ];

  void onTap(index){
    selectedIndex = index;
    emit(NewScreenState());
  }
  static HomeLayoutCubit get(context) =>BlocProvider.of(context);
  HomeLayoutCubit() : super(HomeLayoutInitial());
}
