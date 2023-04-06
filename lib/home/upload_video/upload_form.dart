import 'dart:io';

import 'package:flutter/material.dart';

class UploadForm extends StatefulWidget {

  final File videoFile;
  final String videoPath;

  UploadForm({required this.videoFile, required this.videoPath});

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
