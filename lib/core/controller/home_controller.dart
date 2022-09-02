import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:removebackground/api_constant.dart';

import '../api_client/dio_helper.dart';

class HomeController extends GetxController {
  bool get isLoading => _isLoading;
  bool _isLoading = false;

  File? imageBefore;

  Uint8List? imageAfter;

  var picker = ImagePicker();

  Future getImage() async {
    final pickFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickFile != null) {
      imageBefore = File(pickFile.path);
      update();
    }
  }

  void uploadImage(File file) async {
    _isLoading = true;

    String fileName = file.path.split("/").last;
    FormData data = FormData.fromMap({
      "source_image_file": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
    update();
    try {
      var response = await DioHelper.postData(
        url: ApiConstant.removeImage,
        data: data,
      );
      imageAfter = response.data;
      _isLoading = false;
      update();
    } catch (e) {
      debugPrint(e.toString());
      _isLoading = false;
      update();
    }
  }
}
