import 'package:chat_gpt/constant/app_routes.dart';
import 'package:chat_gpt/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as t;
import 'package:get_storage/get_storage.dart';

// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024
// Description:This is the main function of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //get storage
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //
    ThemeController themeController = Get.put(ThemeController());
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {}),
      debugShowCheckedModeBanner: false,
      defaultTransition: t.Transition.fadeIn,
      theme: themeController.currentTheme.value,
      //   MyThemeData.darkTheme,
      initialRoute: Routes.splash,
      getPages: Routes.routes,
    );
  }
}
