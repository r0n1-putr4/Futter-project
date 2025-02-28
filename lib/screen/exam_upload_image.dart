import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:roni/berita/list_berita.dart';
import 'package:roni/utils/base_url.dart';
import 'package:logger/logger.dart';
import 'package:roni/model/register_model.dart';

class UploadImageFlutter extends StatefulWidget {
  const UploadImageFlutter({super.key});

  @override
  State<UploadImageFlutter> createState() => _UploadImageFlutterState();
}

class _UploadImageFlutterState extends State<UploadImageFlutter> {
  File? _image;
  final picker = ImagePicker();
  var logger = Logger();

  bool isLoading = false;

  void _alertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Silahkan dipilih?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                _getImage(ImageSource.camera);
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("Camera"),
            ),
            ElevatedButton(
              onPressed: () {
                _getImage(ImageSource.gallery);
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("Gallery"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
      logger.d("Error : Picking Image: $e");
    }
  }

  Future<void> _uploadImage(BuildContext context) async {
    try {
      isLoading = true;
      if (_image == null) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select an image and enter text.")),
        );
        return;
      }

      final url = Uri.parse('${ApiConfig.baseUrl}/add_berita.php');
      var request = http.MultipartRequest('POST', url);
      request.fields['judul'] = "Judul Flutter";
      request.fields['isiBerita'] = "Isi Flutter";
      request.files.add(
        await http.MultipartFile.fromPath('fileGambar', _image!.path),
      );
      http.StreamedResponse streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);
      final uploadResponse = registerModelFromJson(response.body);
      if (uploadResponse.success) {
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
        ).showSnackBar(SnackBar(content: Text(uploadResponse.message)));
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(uploadResponse.message)));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      logger.d("Pesan Error ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload file")),
      body: Center(
        child: Column(
          children: [
            _image != null
                ? Image.file(_image!, height: 200)
                : Text("No image selected"),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: 'Hello ', style: TextStyle(fontSize: 24)),
                  TextSpan(
                    text: 'Flutter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    text: '!',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(text: '\nThis is '),
                  TextSpan(
                    text: 'rich text',
                    style: TextStyle(
                      backgroundColor: Colors.yellow,
                      shadows: [
                        Shadow(
                          color: Colors.black38,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  TextSpan(text: ' with '),
                  TextSpan(
                    text: 'multiple styles',
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Roboto',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => _alertDialog(context),
              child: Text("Pick Image"),
            ),
            const SizedBox(height: 15),
            Center(
              child:
                  isLoading
                      ? CircularProgressIndicator()
                      : MaterialButton(
                        color: Colors.red,
                        height: 45,
                        onPressed: () {
                          setState(() {
                            _uploadImage(context);
                          });
                        },
                        child: Text(
                          "SAVE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
