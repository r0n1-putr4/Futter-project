import 'package:flutter/material.dart';
import 'package:roni/pindah/hal_dua.dart';
import 'package:roni/pindah/hal_satu.dart';
import 'package:roni/smart/heart_page.dart';

import 'exam_nav_bar/form_register.dart';

void main() {
  runApp(MaterialApp(
    title: "Belajar Flutter",
    home: const FormRegister(),
    debugShowCheckedModeBanner: false,
    routes: {
      '/halSatu' : (context) => HalSatu(),
      '/halDua' : (context) => HalDua()
    },
  ));
}


