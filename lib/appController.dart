import 'package:get/get.dart';

class AppController extends GetxController {
  var message = 1000.obs;
  void hello() => '${message.value}: Hello Worlds!';
}