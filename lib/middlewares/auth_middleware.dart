import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sem_papel/controller/login.controller.dart';
import 'package:sem_papel/routes/pages.dart';

class AuthMiddleware extends GetMiddleware {
  LoginController loginControllers = Get.put(LoginController());
  // LoginController loginControllers = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (route == Routes.login || route == Routes.qrScan) {
      print(loginControllers.isUsuarioAutenticado.value);
      return null;
    } else if (loginControllers.isUsuarioAutenticado.value == false) {
      print(loginControllers.isUsuarioAutenticado.value);
      return const RouteSettings(name: Routes.login);
    } else {
      print(loginControllers.isUsuarioAutenticado.value == true);
      return null;
    }
  }
}
