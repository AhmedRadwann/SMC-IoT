import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smc_iot/view/Screens/EspScreen/EspScreen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../constant.dart';
import '../../../viewModel/cubit/EspCubit/esp_cubit.dart';

Widget BuildUnit({required context, required index, required DataModel}) {

  return FlipCard(
    front: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/nodemcu-3.png?alt=media&token=92929e88-25ea-4d9e-a0d0-dac47fbc502c'),
        Text('${DataModel.Name}',
            style: Theme
                .of(context)
                .textTheme
                .bodyText1),
      ],
    ),
    back: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Temp : ${DataModel.Temp>100?"???":DataModel.Temp}',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
            ),
            Text(
              'Hum : ${DataModel.Temp>100?"???":DataModel.Hum}',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
            ),
            Text(
              'Moisture : ${DataModel.moisturelevel>100?"???":DataModel.moisturelevel}',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            width: double.infinity,
            color: Colors.redAccent.withOpacity(0.4),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EspScreen(
                              index: index,
                            )));
              },
              child: Text(
                'More detail ...',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget autoControlUnit(
      {required context, required index, required DataModel}) {
    bool isFinish=false;
    int time=3;
    return FlipCard(
        front: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/nodemcu-3.png?alt=media&token=92929e88-25ea-4d9e-a0d0-dac47fbc502c'),
            Text('${DataModel.Name}',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1),
          ],
        ),
        back: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DataModel.auto == false
                      ? ToggleSwitch(
                    minWidth: 100.0,
                    minHeight: 80.0,
                    initialLabelIndex:
                    EspCubit
                        .get(context)
                        .Esp[index].auto == true
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
                          '${Token}${EspCubit
                              .get(context)
                              .Esp[index].Name}')
                          .update({'auto': index2 == 1 ? true : false});
                    },
                  ):
                  Container(),
                  const SizedBox(
                    height: 25,
                  ),
                  DataModel.auto == true
                      ? ToggleSwitch(
                    minWidth: 100.0,
                    minHeight: 80.0,
                    initialLabelIndex:
                    EspCubit
                        .get(context)
                        .Esp[index].auto == true
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
                          '${Token}${EspCubit
                              .get(context)
                              .Esp[index].Name}')
                          .update({'auto': index2 == 1 ? true : false});
                    },
                  )
                      : Text(
                    'Do you want Auto Pump',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  /*
  CircularCountDownTimer(
                    duration: time,
                    initialDuration: 0,
                    controller: CountDownController(),
                    height: 100,
                    ringColor: Colors.grey[300]!,
                    ringGradient: null,
                    fillColor: Colors.purpleAccent[100]!,
                    fillGradient: null,
                    backgroundColor: Colors.purple[500],
                    backgroundGradient: null,
                    strokeWidth: 20.0,
                    strokeCap: StrokeCap.round,
                    textStyle: const TextStyle(
                        fontSize: 33.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textFormat: CountdownTextFormat.S,
                    isReverse: isFinish,
                    isReverseAnimation: false,
                    isTimerTextShown: true,
                    autoStart: true,
                    onComplete: () {
                    }, width: 100,
                  )
   */