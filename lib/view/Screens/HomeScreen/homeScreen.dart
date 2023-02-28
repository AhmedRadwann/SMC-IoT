import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:smc_iot/view/componant/Core/buildUite.dart';
import 'package:smc_iot/viewModel/cubit/EspCubit/esp_cubit.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EspCubit, EspState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: EspCubit.get(context).Esp.isNotEmpty,
          builder: (context) => GridView.count(
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 2,
            children: List.generate(
                EspCubit.get(context).Esp.length,
                (index) => BuildUnit(
                    context: context,
                    index: index,
                    DataModel: EspCubit.get(context).Esp[index])),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
