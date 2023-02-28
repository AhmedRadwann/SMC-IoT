import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smc_iot/constant.dart';
import 'package:smc_iot/viewModel/DataBase/local/cash_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isTap = true;


  void tapChange() {
    isTap = !isTap;
    emit(TapIconChange());
  }

  void userLogin() {
    emit(LoginLoading());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
          Token = value.user!.uid;
          CashHelper.SaveData(key: 'Token', value:value.user!.uid).then((value2){
          });
          emit(LoginSuccess());
    }).catchError((error) {
      emit(LoginError());
    });
  }

  static LoginCubit get(context) => BlocProvider.of(context);
}
