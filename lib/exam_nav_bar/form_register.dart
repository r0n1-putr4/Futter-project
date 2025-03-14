import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tglLahir = TextEditingController();
  TextEditingController password = TextEditingController();
  String? valAgama, valJk, inputForm;
  final _formKey = GlobalKey<FormState>();

  Future selectDate() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (pickDate != null) {
      tglLahir.text = DateFormat("dd-MM-yyyy").format(pickDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Register", style: TextStyle(fontSize: 18))),
                SizedBox(height: 10),
                CostumeTextFormField(
                  labelInput: "Full Name",
                  controller: fullname,
                  hintText: "Roni Putra",
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10),
                CostumeTextFormField(
                  labelInput: "User Name",
                  controller: username,
                  hintText: "r0n1",
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10),
                CostumeTextFormField(
                  labelInput: "Email",
                  controller: email,
                  hintText: "rn.putra@gmail.com",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                CostumeTextFormField(
                  labelInput: "Tanggal Lahir",
                  controller: tglLahir,
                  hintText: "dd-MM-yyyy",
                  textInputType: TextInputType.datetime,
                  onTap: () {
                    selectDate();
                  },
                ),
                SizedBox(height: 10),
                CostumeTextFormField(
                  labelInput: "Password",
                  controller: password,
                  hintText: "*****",
                  textInputType: TextInputType.datetime,
                  obscureText: true,
                ),
                SizedBox(height: 10),
                Text("Pilih Agama", style: TextStyle(fontSize: 18)),
                Container(
                  alignment: Alignment.center,
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: valAgama,
                    underline: Container(),
                    isExpanded: true,
                    items:
                        [
                          "Islam",
                          "Kristen Protestan",
                          "Kristen Katolik",
                          "Hindu",
                          "Budha",
                          "Konghucu",
                        ].map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(e),
                            ),
                          );
                        }).toList(),
                    onChanged: (val) {
                      setState(() {
                        valAgama = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text("Pilih Jenis Kelamin", style: TextStyle(fontSize: 18)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CostumeRadio(
                      value: "Pria",
                      groupValue: valJk.toString(),
                      onChange: (val) {
                        setState(() {
                          valJk = val;
                        });
                      },
                    ),
                    CostumeRadio(
                      value: "Wanita",
                      groupValue: valJk.toString(),
                      onChange: (val) {
                        setState(() {
                          valJk = val;
                        });
                      },
                    ),
                  ],
                ),
                CostumeButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        if (valJk != null && valAgama != null) {
                          inputForm =
                              "Full Name: ${fullname.text}\n"
                              "Username: ${username.text}\n"
                              "Email: ${email.text}\n"
                              "Tanggal Lahir: ${tglLahir.text}\n"
                              "Agama: ${valAgama.toString()}\n"
                              "Jenis Kelamin: ${valJk.toString()}";
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(inputForm.toString())),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Silahkan Pilih Agama serta Jenis Kelamin",
                              ),
                            ),
                          );
                        }
                      }
                    });
                  },
                  labelButton: "SAVE",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CostumeTextFormField extends StatelessWidget {
  final String labelInput;
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final VoidCallback? onTap;
  final bool obscureText;

  const CostumeTextFormField({
    super.key,
    required this.labelInput,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.onTap,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelInput, style: TextStyle(fontSize: 18)),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: (val) {
            return val!.isEmpty ? "Tidak boleh kosong" : null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          keyboardType: textInputType,
          onTap: () {
            onTap?.call();
          },
          obscureText: obscureText,
        ),
      ],
    );
  }
}
class CostumeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String labelButton;
  final Color color;

  const CostumeButton({
    super.key,
    required this.onPressed,
    required this.labelButton, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // Full width, height: 50
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.red,
        // Change button color
        foregroundColor: color, // Change text color
      ),
      onPressed: () {
        onPressed.call();
      },
      child: Text(labelButton, style: TextStyle(color: color)),
    );
  }
}
class CostumeRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String> onChange;

  const CostumeRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: (val) {
          if (val != null) {
            onChange(val); // Pass the selected value
          }
        },
        title: Text(value),
      ),
    );
  }
}

