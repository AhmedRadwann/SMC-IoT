import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smc_iot/view/componant/Core/Appbar.dart';
import 'package:smc_iot/view/componant/EspComponant/CustomCard.dart';
import 'package:smc_iot/viewModel/cubit/EspCubit/esp_cubit.dart';

import '../../../model/EspDataModel/CardModel.dart';



class EspScreen extends StatelessWidget {
  int index;
  EspScreen({super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EspCubit, EspState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {

      return Scaffold(
        appBar: CustomAppBar(context),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConditionalBuilder(
            condition: EspCubit.get(context).Esp.isNotEmpty,
            builder: (BuildContext context){
              List<CardCategory> cards=[
                CardCategory('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/temp.png?alt=media&token=17c9d137-39cd-477e-8dce-e5b71e600cc1', "Temperature", EspCubit.get(context).Esp[index].Temp,Colors.redAccent,"temp",'https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/temp.json?alt=media&token=ddd52e39-a0ea-4489-bdfd-97e70a2b9db9'),
                CardCategory('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/hum.png?alt=media&token=a17bf5d7-c30a-42fa-bd96-89ccec732e2d', "Humidity", EspCubit.get(context).Esp[index].Hum,Colors.blueAccent,"hum",'https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/hum.json?alt=media&token=6eeea787-e8db-4878-b4c0-9891c6aa0004'),
                CardCategory('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/soil.png?alt=media&token=f20564fc-a35a-4ff6-b06f-75ba2f125665', "moisturelevel", EspCubit.get(context).Esp[index].moisturelevel,Colors.blueAccent,"soil",'https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/soil.json?alt=media&token=c2aa5e84-82fc-47db-ae57-e5e04773e0dc'),

              ];
              return Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text(
                    '${EspCubit.get(context).Esp[index].Name}',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 35,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Center(
                    child: customCard(context,cards[0]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Center(
                    child: customCard(context,cards[1]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Center(
                    child:  customCard(context,cards[2]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Center(
                    child: EspCubit.get(context).Esp[index].auto==true?const SizedBox():customToggleCard(context,EspCubit.get(context).Esp[index]),
                  ),
                ),
              ],
            );},
            fallback: (BuildContext context)=>const Center(child: CircularProgressIndicator()),

          )
        ),
      );
    },
);
  }
}


