import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as t;
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'constant/app_routes.dart';
import 'constant/restart_widget.dart';
import 'controller/chats_controller.dart';
import 'controller/theme_controller.dart';

// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024
// Description:This is the main function of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //get storage
  await GetStorage.init();
  runApp(const RestartWidget(child: MyApp()));
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatController(),
        ),
      ],
      child: GetMaterialApp(
        initialBinding: BindingsBuilder(() {}),
        debugShowCheckedModeBanner: false,
        defaultTransition: t.Transition.fadeIn,
        theme: themeController.currentTheme.value,
        initialRoute: Routes.splash,
        getPages: Routes.routes,
      ),
    );
  }
}
