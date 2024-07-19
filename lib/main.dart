import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:niyam/firebase_options.dart';
import 'package:niyam/screens/splashscreens/splash_screen.dart';
import 'package:niyam/utils/colours.dart';
import 'package:path_provider/path_provider.dart';
import 'package:upgrader/upgrader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();



  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  var devices = ["4176D5E922488840D34E10F1C83F4766"];
  await MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration = RequestConfiguration(
    testDeviceIds: devices
  );
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  await clearFirebaseCache();
  await clearAppCache();
  runApp(const MyApp());

}




Future<void> clearFirebaseCache() async {
  await FirebaseFirestore.instance.clearPersistence();
}

Future<void> clearAppCache() async {
  var tempDir = await getTemporaryDirectory();
  if (tempDir.existsSync()) {
    tempDir.deleteSync(recursive: true);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Niyam Diary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: gradient1),
        useMaterial3: true,
      ),
      // debugShowCheckedModeBanner: false,
      home: UpgradeAlert(
        dialogStyle: UpgradeDialogStyle.material,
          child:const SplashScreen()),
    );
  }
}
