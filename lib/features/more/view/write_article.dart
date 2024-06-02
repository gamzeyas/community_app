import 'dart:io';

import 'package:community_app/common/colors.dart';
import 'package:community_app/common/paths.dart';
import 'package:community_app/common/sizes.dart';
import 'package:community_app/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class WriteArticle extends StatefulWidget {
  const WriteArticle({super.key});

  @override
  State<WriteArticle> createState() => _WriteArticleState();
}

class _WriteArticleState extends State<WriteArticle> {
  XFile? image;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void pickImage() async {
    image = await pickImageFromGallery();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: greyColor,
          ),
          title: const Text(
            "Your Article",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: containerColor),
          ),
        ),
        body: Padding(
          padding: scaffoldPadding,
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: vertical10,
                  child: GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: activeColor,
                          borderRadius: BorderRadius.circular(20),
                          image: image != null
                              ? DecorationImage(
                                  image: FileImage(File(image!.path)),
                                  fit: BoxFit.cover)
                              : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(imagePickerIcon),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: vertical5,
                  child: TextFormField(
                    style: const TextStyle(fontSize: 17, color: containerColor),
                    controller: _titleController,
                    decoration: const InputDecoration(
                        hintText: "Your Title Here !",
                        hintStyle: TextStyle(fontSize: 17, color: greyColor),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    maxLines: 100,
                    style: const TextStyle(fontSize: 17, color: containerColor),
                    controller: _contentController,
                    decoration: const InputDecoration(
                        hintText: "Your article here!",
                        hintStyle: TextStyle(fontSize: 17, color: greyColor),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
