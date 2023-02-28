import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smc_iot/Style/ColorMange/ColorManger.dart';
import 'package:smc_iot/view/Screens/HomeLayoutScreen/HomeLayoutScreen.dart';
import 'package:smc_iot/view/componant/Core/CustomTextFormFiled.dart';
import 'package:smc_iot/viewModel/cubit/LoginCubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is LoginSuccess) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeLayoutScreen()));
                  Fluttertoast.showToast(
                    msg: 'Login Success',
                    backgroundColor: Colors.green,
                    fontSize: 17,
                    gravity: ToastGravity.TOP,
                  );
                } else if (state is LoginError) {
                  Fluttertoast.showToast(
                    msg: 'Error, Check E-mail or password',
                    backgroundColor: Colors.red,
                    fontSize: 17,
                    gravity: ToastGravity.TOP,
                  );
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 30, left: 30, bottom: 100),
                            child: Image.network('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/Splash.png?alt=media&token=6a7b24a4-72aa-4ee4-928e-13da9f8fccee'),
                          ),
                          CustomTextFormFiled(
                            controller: LoginCubit.get(context).emailController,
                            label: 'E-Mail',
                            raduis: 10,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          CustomTextFormFiled(
                            controller:
                                LoginCubit.get(context).passwordController,
                            label: 'PassWord',
                            raduis: 10,
                            tap: LoginCubit.get(context).isTap,
                            func: () => LoginCubit.get(context).tapChange(),
                            isPassword: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'ForgetPassword?',
                                    style: TextStyle(
                                      color: ColorManger.redColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            width: 270,
                            child: ElevatedButton(
                              onPressed: () {
                                LoginCubit.get(context).userLogin();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    ColorManger.redColor),
                              ),
                              child: state is LoginLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ))
                                  : const Text('Login'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/*
Platform  Firebase App Id
android   1:224899509093:android:912dae58cc0b67ecbccf8c
ios       1:224899509093:ios:e386c7b05a529464bccf8c

 */
