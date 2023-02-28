import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:smc_iot/Style/ColorMange/ColorManger.dart';
import 'package:smc_iot/constant.dart';
import 'package:smc_iot/view/Screens/RootScreen/RootScreen.dart';
import 'package:smc_iot/view/componant/Core/Appbar.dart';
import 'package:smc_iot/viewModel/DataBase/local/cash_helper.dart';
import 'package:smc_iot/viewModel/cubit/HomeLayout/home_layout_cubit.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return snapshot.data == ConnectivityResult.none
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.network('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/no-internet.json?alt=media&token=90940f56-c24c-4555-9428-dd1497b0866c'),
                      Text(
                        'Please, Check Connection.....',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                )
              : BlocProvider(
                  create: (context) => HomeLayoutCubit(),
                  child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Scaffold(
                        appBar: CustomAppBar(context),
                        body: HomeLayoutCubit.get(context).widgetOptions[
                            HomeLayoutCubit.get(context).selectedIndex],
                        bottomNavigationBar: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: GNav(
                            gap: 8,
                            activeColor: ColorManger.redColor,
                            iconSize: 24,
                            color: const Color(0xFF607D8B),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            duration: const Duration(milliseconds: 500),
                            tabBackgroundColor: Colors.grey[300]!,

                            tabs: [
                              const GButton(
                                icon: LineIcons.home,
                                text: 'Home',
                              ),
                              const GButton(
                                icon: Icons.auto_mode,
                                text: 'Auto',
                              ),
                              const GButton(
                                icon: LineIcons.mapMarked,
                                text: 'Map',
                              ),
                              GButton(
                                icon: Icons.logout_outlined,
                                text: 'Logout',
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text("LogOut"),
                                            content: const Text("Are you Sure"),
                                            actionsAlignment:
                                                MainAxisAlignment.center,
                                            actions: [
                                              SizedBox(
                                                width: 120,
                                                height: 40,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(ColorManger.redColor)),
                                                  child: const Text("Cancel"),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 120,
                                                height: 40,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    CashHelper.removerData(
                                                            key: "Token")
                                                        .then((value) {
                                                      Token = '';
                                                      Navigator.pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  rootScreen(Token!)),
                                                          (route) => false);
                                                    });
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(ColorManger.redColor)),
                                                  child: const Text("Sure"),
                                                ),
                                              )
                                            ],
                                          ));
                                },
                              ),
                              if (Token == admin)
                                const GButton(
                                  icon: LineIcons.sign,
                                  text: 'SignUp',
                                ),
                            ],
                            onTabChange: (index) =>
                                HomeLayoutCubit.get(context).onTap(index),
                          ),
                        ),
                      );
                    },
                  ),
                );
        });
  }
}
