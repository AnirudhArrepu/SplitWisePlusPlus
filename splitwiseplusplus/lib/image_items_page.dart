import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:splitwiseplusplus/item.dart';

class ImageItemsPage extends StatefulWidget {
  const ImageItemsPage({super.key});

  @override
  State<ImageItemsPage> createState() => _ImageItemsPageState();
}

class _ImageItemsPageState extends State<ImageItemsPage> {
  XFile? imageSelected;
  final String APIkey = 'AIzaSyDh6IQUwbReGirKJctHKwyP8tLvn9-mRi4';
  final String geminiPrompt =
      'From the restaurant bill attached, i want you to return the name of the item and its price in the format of a csv like a_name,a_price,b_name,b_price and nothing else';
  String? generatedText;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageSelected = image;
      });
    }
  }

  Future sendImage() async {
    final file = await File(imageSelected!.path);
    final filebytes = await file.readAsBytes();
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:5000/upload'));

    request.files.add(http.MultipartFile.fromBytes(
      'file',
      filebytes,
      filename: imageSelected!.name,
    ));
    var response = await request.send();
    var responsebody = await response.stream.bytesToString();
    var jsonOutput = jsonDecode(responsebody);
    var Output = jsonOutput['output'];
    print(Output);
    processOutput(Output);
  }

  void processOutput(String output) {
    List<String> names = output.split(',');
    for (int i = 0; i < names.length; i += 2) {
      Item item = new Item(names[i], int.parse(names[i+1]));
      Item.items.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Upload Image',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageSelected != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.file(File(imageSelected!.path)),
                    ],
                  )
                : const SizedBox(height: 400),
            Center(
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: pickImage,
                      label: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Select Image",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.grey),
                        ),
                      ),
                      icon: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.add_a_photo_rounded,
                          size: 32,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/next');
                        sendImage();
                      },
                      label: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.grey),
                        ),
                      ),
                      icon: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.arrow_circle_right,
                          size: 32,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
