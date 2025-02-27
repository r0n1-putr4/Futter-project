import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roni/berita/list_berita.dart';
import 'dart:async';
import 'package:roni/model/register_model.dart';

import 'package:roni/utils/base_url.dart';

class FormFlutter extends StatefulWidget {
  const FormFlutter({super.key});

  @override
  State<FormFlutter> createState() => _FormFlutterState();
}

class _FormFlutterState extends State<FormFlutter> {
  final _formKey = GlobalKey<FormState>();

  var EditUserName = TextEditingController();
  var EditPassword = TextEditingController();
  var EditFullName = TextEditingController();
  var EditEmail = TextEditingController();

  bool isLoading = false;

  Future<void> register() async {
    try {
      isLoading = true;
      http.Response hasil = await http.post(
        Uri.parse("${ApiConfig.baseUrl}/register.php"),
        body: {
          "fullname": EditUserName.text,
          "username": EditPassword.text,
          "password": EditFullName.text,
          "email": EditEmail.text,
        },
      );
      final registerModel = registerModelFromJson(hasil.body);
      if (registerModel.success) {
        setState(() {
          isLoading = false;
        });

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const ListBerita()),
          (route) => false,
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(registerModel.message)));
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(registerModel.message)));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Kesalahan : ${e}")));
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Form Flutter", style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CostumeInput(
                textEditingController: EditUserName,
                label: "Username",
                icon: Icons.person,
                hintText: "roni",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              CostumeInput(
                textEditingController: EditPassword,
                label: "Password",
                icon: Icons.vpn_key,
                hintText: "******",
                obscureText: true,
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              CostumeInput(
                textEditingController: EditFullName,
                label: "Full Name",
                icon: Icons.person_2,
                hintText: "Roni Putra",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              CostumeInput(
                textEditingController: EditEmail,
                label: "Email",
                icon: Icons.mail,
                hintText: "rn.putra@gmail.com",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              Center(
                child: isLoading ? CircularProgressIndicator() : MaterialButton(
                  color: Colors.red,
                  height: 45,
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        register();
                      }
                    });
                  },
                  child: Text("SAVE", style: TextStyle(color: Colors.white)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class CostumeInput extends StatelessWidget {
  final String label;
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;

  const CostumeInput({
    super.key,
    required this.textEditingController,
    required this.label,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: textEditingController,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.red),
            hintText: hintText,
            filled: true,
            fillColor: Colors.amber.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: textInputType,
          validator: (val) {
            return val!.isEmpty ? "Tidak boleh kosong" : null;
          },
        ),
      ],
    );
  }
}
