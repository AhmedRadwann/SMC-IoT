import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smc_iot/model/EspDataModel/EspModel.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../constant.dart';
import '../../../model/EspDataModel/CardModel.dart';

Widget customCard(context,CardCategory data) => Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: NetworkImage( data.image),width: 70,),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.text,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' ${data.num>100?"???":data.num}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              interval:10,
                              showFirstLabel: true,
                              showLastLabel: true,
                              showTicks: false,
                              useRangeColorForAxis:true,
                              axisLabelStyle:GaugeTextStyle(
                                color: Theme.of(context).textTheme.bodyText1!.color,
                              ),
                              axisLineStyle: AxisLineStyle(
                                  thickness:10,
                                color: Colors.blueGrey.withOpacity(0.5),
                              ),
                              ranges: [
                                GaugeRange(startValue: 0, endValue: data.num.toDouble()>100?0:data.num.toDouble(), color:data.color),
                              ],
                              pointers: <WidgetPointer>[
                                WidgetPointer(
                                  enableAnimation: true,
                                    animationType: AnimationType.bounceOut,

                                    animationDuration: 2*1000,
                                    value: data.num.toDouble()>100?0:data.num.toDouble(),
                                    child:Container(
                                      height: 15, width: 15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: data.color,
                                            border: Border.all(color: data.color)),
                                ))],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(widget:data.num.toDouble()>100?Lottie.network('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/error.json?alt=media&token=fe80e1f5-ac4f-4640-ba21-ccbf61cf7c9d',height: 85,width: 85):Lottie.network(data.imageUrl,height: 80,width: 100),
                                )
                              ]
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget customToggleCard(context,DataModel data) =>Card(
  child: SizedBox(
    width: MediaQuery
        .of(context)
        .size
        .width * 0.8,
    height: 200,
    child: Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleSwitch(
                minWidth: 90.0,
                minHeight: 70.0,
                initialLabelIndex: data.control == true ? 1 : 0,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                icons: const [
                  Icons.invert_colors_off,
                  Icons.invert_colors,
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
                  FirebaseFirestore.instance.collection(
                      '$Token')
                      .doc('$Token${data.Name}')
                      .update(
                      {'control': index2 == 1 ? true : false});
                },
              ),
              const SizedBox(height: 30,),
              Text(
                'Water Pump',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              const SizedBox(height: 10,),


            ],
          ),
        ),
      ],
    ),
  ),
);