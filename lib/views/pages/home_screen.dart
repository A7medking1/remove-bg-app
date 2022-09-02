import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:removebackground/core/controller/home_controller.dart';
import 'package:removebackground/views/widget/cutom_button.dart';
import 'package:screenshot/screenshot.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Remove Background",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<HomeController>(
          builder: (controller) => Column(
            children: [
              controller.imageBefore == null
                  ? const Image(
                      image: AssetImage("assets/image/aaa.png"),
                      fit: BoxFit.cover,
                      height: 200,
                    )
                  : Image.file(
                      controller.imageBefore!,
                      height: 250,
                    ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    text: "get image",
                    bkColor: Colors.amberAccent,
                    tap: () => controller.getImage(),
                  ),
                  controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : controller.imageBefore != null
                          ? CustomButton(
                              text: "remove bkground",
                              bkColor: Colors.green,
                              tap: () => controller.uploadImage(
                                controller.imageBefore!,
                              ),
                            )
                          : Container(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              controller.imageAfter == null
                  ? Container()
                  : Image.memory(
                      controller.imageAfter!,
                      height: 250,
                    ),
              const SizedBox(
                height: 20,
              ),
              controller.imageAfter != null
                  ? CustomButton(
                      text: "save image",
                      bkColor: Colors.amberAccent,
                      tap: () => controller.saveImage(
                        controller.imageAfter!,
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
