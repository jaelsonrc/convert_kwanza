import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvc_kuanza/src/lang/translation_service.dart';
import 'package:mvc_kuanza/src/routes/app_pages.dart';
import 'package:mvc_kuanza/src/shared/logger/logger_utils.dart';
import 'package:mvc_kuanza/src/shared/themes/app_colors.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() async {
  await GetStorage.init();
  runApp(KuanzaApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(800, 800);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Kuanza Convert";
    win.show();
  });
}

class KuanzaApp extends StatelessWidget {
  const KuanzaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      theme: ThemeData(
          primarySwatch: Colors.orange, primaryColor: AppColors.primary),
      logWriterCallback: Logger.write,
      // initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
