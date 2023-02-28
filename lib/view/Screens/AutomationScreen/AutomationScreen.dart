import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:smc_iot/viewModel/cubit/EspCubit/esp_cubit.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../constant.dart';

class AutomationScreen extends StatelessWidget {
  const AutomationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<EspCubit, EspState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: EspCubit.get(context).Esp.isNotEmpty,
            builder: (context) => ListView.builder(
              itemBuilder: (BuildContext context, int index) => FlipCard(
                  front: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/nodemcu-3.png?alt=media&token=92929e88-25ea-4d9e-a0d0-dac47fbc502c'),                      Text('${EspCubit.get(context).Esp[index].Name}',
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                  back: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            EspCubit.get(context).Esp[index].auto == false
                                ? ToggleSwitch(
                              minWidth: 100.0,
                              minHeight: 80.0,
                              initialLabelIndex: EspCubit.get(context)
                                  .Esp[index]
                                  .auto ==
                                  true
                                  ? 1
                                  : 0,
                              cornerRadius: 20.0,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              totalSwitches: 2,
                              icons: const [
                                Icons.manage_accounts,
                                Icons.manage_history_outlined,
                              ],
                              iconSize: 30.0,
                              activeBgColors: const [
                                [Colors.redAccent, Colors.red],
                                [Colors.blue, Colors.blueAccent]
                              ],
                              animate: true,
                              // with just animate set to true, default curve = Curves.easeIn
                              curve: Curves.bounceInOut,
                              // animate must be set to true when using custom curve
                              onToggle: (index2) {
                                FirebaseFirestore.instance
                                    .collection('$Token')
                                    .doc(
                                    '$Token${EspCubit.get(context).Esp[index].Name}')
                                    .update({
                                  'auto': index2 == 1 ? true : false
                                });
                              },
                            )
                                : EspCubit.get(context).Esp[index].moisturelevel >= 70
                                ?Column(
                              children: [
                                Lottie.network('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/watering-plants.json?alt=media&token=5e2ed241-a2a4-4e6a-b719-b93360c3b16e',height: 200,width: 250),
                                Text('time to water',style: Theme.of(context).textTheme.bodyText1,)
                              ],
                            )
                                :Column(
                              children: [
                                Lottie.network('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/plant.json?alt=media&token=d6fcf2e2-450e-4d68-b8a3-e78e36843d5c',height: 200,width: 250),
                                Text('No Irrigation Needed',style: Theme.of(context).textTheme.bodyText1,)

                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            EspCubit.get(context).Esp[index].auto == true
                                ? ToggleSwitch(
                              minWidth: 100.0,
                              minHeight: 80.0,
                              initialLabelIndex: EspCubit.get(context)
                                  .Esp[index]
                                  .auto ==
                                  true
                                  ? 1
                                  : 0,
                              cornerRadius: 20.0,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              totalSwitches: 2,
                              icons: const [
                                Icons.manage_accounts,
                                Icons.manage_history_outlined,
                              ],
                              iconSize: 30.0,
                              activeBgColors: const [
                                [Colors.redAccent, Colors.red],
                                [Colors.blue, Colors.blueAccent]
                              ],
                              animate: true,
                              // with just animate set to true, default curve = Curves.easeIn
                              curve: Curves.bounceInOut,
                              // animate must be set to true when using custom curve
                              onToggle: (index2) {
                                FirebaseFirestore.instance
                                    .collection('$Token')
                                    .doc(
                                    '$Token${EspCubit.get(context).Esp[index].Name}')
                                    .update({
                                  'auto': index2 == 1 ? true : false
                                });
                              },
                            )
                                : Text(
                              'Do you want Auto Pump',
                              style:
                              Theme.of(context).textTheme.bodyText1,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              itemCount: EspCubit.get(context).Esp.length,
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}