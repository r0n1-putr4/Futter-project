import 'package:flutter/material.dart';
import 'package:roni/berita/list_berita.dart';
import 'package:roni/screen/exam_form.dart';
import 'package:roni/screen/exam_nav_route.dart';
import 'package:roni/screen/exam_upload_image.dart';
import 'package:roni/screen/list_builder_json.dart';
import 'package:roni/screen/list_view.dart';
import 'package:roni/screen/show_images.dart';
import 'package:roni/tabs/exam_tab_bar.dart';

void main() {
  runApp(const MaterialApp(
    title: "Belajar Flutter",
    home: UploadImageFlutter(),
    debugShowCheckedModeBanner: false,
  ));
}


