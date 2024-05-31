// detection_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:sign_language/controller/scan_controller.dart';

class DetectionPage extends StatelessWidget {
  const DetectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('Deteksi Bahasa Isyarat'),
      ),
      body: GetBuilder<ScanController>(
        init: ScanController(),
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: controller.isCameraInitialized.value
                      ? CameraPreview(controller.cameraController)
                      : Center(child: const Text("Loading Preview...")),
                ),
                Obx(
                  () => Column(
                    children: [
                      SizedBox(height: 20,),
                      Text(
                        controller.scanResult.value,
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}