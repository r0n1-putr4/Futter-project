import 'package:flutter/material.dart';
import 'package:roni/exam_nav_bar/list_view_exam.dart';
import 'package:roni/exam_nav_bar/list_view_page.dart';
import 'package:roni/pindah/hal_dua.dart';
import 'package:roni/pindah/hal_satu.dart';
import 'package:roni/smart/heart_page.dart';

import 'exam_nav_bar/form_register.dart';

void main() {
  runApp(MaterialApp(
    title: "Belajar Flutter",
    home: const ListViewPage(),
    debugShowCheckedModeBanner: false,
    routes: {
      '/halSatu' : (context) => HalSatu(),
      '/halDua' : (context) => HalDua()
    },
  ));
}


