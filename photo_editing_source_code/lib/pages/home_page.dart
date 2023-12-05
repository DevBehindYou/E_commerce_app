// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:io';
import 'package:celebrare/pages/pop_up.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? selectedImage;
  String? framePath = "assets/frame0.png";
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Image / Icon",
          style: TextStyle(color: Colors.grey.shade600, fontFamily: 'italic'),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              exit(0);
            },
            child: SizedBox(
              child: Center(
                child: Image.asset("assets/angle-left.png"),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // choose image containers section
            Container(
              margin: const EdgeInsets.all(8.0),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1.0, color: Colors.grey.shade300),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Upload Image",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: 'italic',
                          fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        _pickImage();
                      },
                      child: Container(
                        height: 38,
                        width: 180,
                        decoration: BoxDecoration(
                          color: const Color(0xff088079),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            "Choose from Device",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // show image section
            const SizedBox(height: 20),
            selectedImage != null ? _buildImageWithFrame() : const Text(""),
          ],
        ),
      ),
    );
  }

  Future _pickImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Colors.grey.shade800,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
      );

      if (croppedFile == null) {
        setState(() {
          selectedImage = File(image.path);
          framePath = "assets/frame0.png";
        });
      } else {
        setState(() {
          selectedImage = File(croppedFile.path);
          framePath = "assets/frame0.png";
        });
      }

      final returnFramePath = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyPopUp(
                    selectedImage: selectedImage!,
                    framePath: framePath!,
                  )));
      if (returnFramePath != null) {
        setState(() {
          framePath = returnFramePath;
        });
      } else {
        setState(() {
          selectedImage = null;
        });
      }
    }
  }

  Widget _buildImageWithFrame() {
    if (selectedImage == null) {
      return const SizedBox();
    } else {
      return Stack(
        alignment: Alignment.center,
        children: [
          Image.file(
            selectedImage!,
            width: 400,
            height: 400,
            fit: BoxFit.cover,
          ),
          ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors
                    .white, // Set the color you want to use as a filter (transparent for no color)
                BlendMode.srcOut,
              ),
              child: Image.asset(
                framePath!,
                width: 400,
                height: 400,
                fit: BoxFit.fill,
              )),
        ],
      );
    }
  }
}
