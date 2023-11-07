import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});
  @override
  State<UserImagePicker> createState() {
    return _UserImagePickerState();
  }
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;
  void _pickImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (image == null) {
      return;
    }
    setState(() {
      _pickedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
        TextButton.icon(
            onPressed: _pickImage,
            icon: const Icon(Icons.image),
            label: Text(
              'Add Image',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ))
      ],
    );
  }
}
