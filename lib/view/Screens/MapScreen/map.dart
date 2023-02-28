import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:smc_iot/view/componant/Core/buildUite.dart';
import 'package:smc_iot/viewModel/cubit/EspCubit/esp_cubit.dart';

class map extends StatelessWidget {
  const map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EspCubit, EspState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: EspCubit.get(context).Esp.isNotEmpty,
          builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                EspCubit.get(context).Esp.length,
                    (index) => const CircleAvatar(
                      backgroundColor: Colors.black12,
                      backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/nodemcu-3.png?alt=media&token=92929e88-25ea-4d9e-a0d0-dac47fbc502c'),
                        ),
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
