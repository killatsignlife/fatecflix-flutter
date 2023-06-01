import 'package:get/get.dart';

// ignore: file_names
class AppController extends GetxController {
  var message = 1000.obs;
  void hello() => '${message.value}: Hello Worlds!';
}