import 'package:flutter/material.dart';

Widget CustomTextFormFiled({
  required String? label,
  double? raduis=0,
  required TextEditingController controller,
  TextInputType? type,
  bool isPassword=false,
  Function()? func,
  bool tap=false,

})=>TextFormField(
  keyboardType: type,
  controller: controller,
  autocorrect: false,
  obscureText: tap!,
  style: const TextStyle(fontSize: 18, color: Color(0xFF707070),),
  cursorColor: const Color(0xFF707070),
  decoration: InputDecoration(
    suffixIcon: isPassword?tap?IconButton(onPressed: func, icon: const Icon(Icons.visibility),color:const Color(0xFF707070) ,):IconButton(onPressed: func, icon: const Icon(Icons.visibility_off_outlined),color:const Color(0xFF707070)):null,


    hintText: label,



  ),

);
