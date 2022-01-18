import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:leja/views/pages/events/float/event_provider.dart';
import 'package:leja/views/pages/sign_up/sign_in_page_widget.dart';
import 'package:leja/views/widgets/custom_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


final Brightness bright =
    WidgetsBinding.instance!.platformDispatcher.platformBrightness;
bool isProcessing = false;
bool isReady = false;
var brightness = SchedulerBinding.instance!.window.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;
bool isBrightMode = brightness != Brightness.dark;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true, cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  var brightness = SchedulerBinding.instance!.window.platformBrightness;
  // ignore: unused_local_variable
  bool isDarkMode = brightness == Brightness.dark;
  // ignore: unused_local_variable
  bool isBrightMode = brightness != Brightness.dark;
  final Brightness bright =
      WidgetsBinding.instance!.platformDispatcher.platformBrightness;
  // @override
  // var window = WidgetsBinding.instance!.window;

  // This callback is called every time the brightness changes.
  // window.onPlatformBrightnessChanged = () {
  //   // ignore: unused_local_variable
  //   var brightness = window.platformBrightness;
  // };

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          bright == Brightness.light ? const Color(0xFFF687D4) : Colors.pink,
      // systemNavigationBarContrastEnforced: true,
      systemNavigationBarColor:
          bright == Brightness.light ? const Color(0xFFF687D4) : Colors.pink));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        title: 'Leja',
        // locale: DevicePreview.locale(context),
        color: Colors.pink,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', 'US')], //, Locale('pt', 'BR')],
        theme: customLightTheme(context),
        darkTheme: customDarkTheme(context),
        themeMode: ThemeMode.system,
        home: const SignIn(),
      ),
    );
  }
}
