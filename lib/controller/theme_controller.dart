import '../constant/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024
// Description:This is the theme controller of the application
class ThemeController extends GetxController {
  final storage = GetStorage();
  Rx<ThemeData> currentTheme = MyThemeData.darkTheme.obs;

  @override
  void onInit() {
    super.onInit();
    loadThemeFromStorage();
  }

  // This method is used to toggle the theme
  void toggleTheme() {
    if (currentTheme.value == MyThemeData.lightTheme) {
      currentTheme.value = MyThemeData.darkTheme;
      storage.write('theme', 'darkMode');
      Get.changeTheme(MyThemeData.darkTheme);
    } else {
      currentTheme.value = MyThemeData.lightTheme;
      storage.write('theme', 'lightMode');
      Get.changeTheme(MyThemeData.lightTheme);
    }
    update();
  }

  //This method is used to load the theme from storage
  void loadThemeFromStorage() {
    final savedTheme = storage.read('theme');
    if (savedTheme != null) {
      if (savedTheme == 'lightMode') {
        currentTheme.value = MyThemeData.lightTheme;
        Get.changeTheme(MyThemeData.lightTheme);
      } else {
        currentTheme.value = MyThemeData.darkTheme;
        Get.changeTheme(MyThemeData.darkTheme);
      }
    }
  }
}
