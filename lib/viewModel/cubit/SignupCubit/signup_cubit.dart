import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isTap=false;

  void UserRegister() {
    emit(SignupLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
          print(value.user!.email);
          print(value.user!.uid);

        emit(SignupSuccess());
    }).catchError((error) {
      emit(SignupError());
    });
  }

  void getData() {
    print(emailController.text);
    print(passwordController.text);
    emit(SignupData());
  }

  void TapChange(){
    isTap=!isTap;
    emit(TapIconChange());
  }
  static SignupCubit get(context) => BlocProvider.of(context);
}
