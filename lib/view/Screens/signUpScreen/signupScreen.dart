import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smc_iot/view/Screens/LoginScreen/LoginScreen.dart';
import 'package:smc_iot/view/componant/Core/CustomTextFormFiled.dart';
import 'package:smc_iot/viewModel/cubit/SignupCubit/signup_cubit.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
          backgroundColor: const Color(0x1E1E1E),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if(state is SignupSuccess){
                      Fluttertoast.showToast(
                        msg:'SignUp Success',
                        backgroundColor: Colors.green,
                        fontSize: 17,
                        gravity: ToastGravity.TOP,

                      );
                    }else if(state is SignupError){
                      Fluttertoast.showToast(
                        msg:'Error, in SignUp',
                        backgroundColor: Colors.red,
                        fontSize: 17,
                        gravity: ToastGravity.TOP,
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 30, left: 30, bottom: 100),
                          child: Image.network('https://firebasestorage.googleapis.com/v0/b/smc-iot.appspot.com/o/smc-iot.png?alt=media&token=42229a23-d5eb-4bd1-8857-b954ec24480b'),
                        ),
                        CustomTextFormFiled(
                          controller: SignupCubit.get(context).nameController,
                          label: 'UserName',
                          raduis: 10,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextFormFiled(
                          controller:
                              SignupCubit.get(context).emailController,
                          label: 'E-mail',
                          type: TextInputType.emailAddress,
                          raduis: 10,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextFormFiled(
                          controller:
                          SignupCubit.get(context).passwordController,
                          label: 'PassWord',
                          raduis: 10,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextFormFiled(
                          type: TextInputType.phone,
                          controller:
                          SignupCubit.get(context).phoneController,
                          label: 'phone',
                          raduis: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SizedBox(
                            height: 50,
                            width: 270,
                            child: ElevatedButton(
                              onPressed: () {
                                SignupCubit.get(context).UserRegister();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFD22424)),
                              ),
                              child: state is SignupLoading?const Center(child: CircularProgressIndicator(color:Colors.white,)):const Text('Register'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Container(
                                    height: 1,
                                    color: const Color(0xFF707070),
                                  )),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text(
                                  'or ',
                                  style: TextStyle(color: Color(0xFF707070)),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                    height: 1,
                                    color: const Color(0xFF707070),
                                  )),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Color(0xFFD22424),
                                    decoration: TextDecoration.underline,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ))),
    );
  }
}
