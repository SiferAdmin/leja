import 'dart:async';
import 'dart:developer' as developer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:leja/pages/profile_page.dart';
import 'package:leja/pages/sign_in_page_widget.dart';

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
    return MaterialApp(
      title: 'Leja',
      color: Colors.pink,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lexend Deca',
        // primaryColor: const Color(0xFFF687D4),
        // brightness: Brightness.light,
        // backgroundColor: Colors.white,
        // dividerColor: const Color(0xFFF687D4),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFF687D4),
        ),
        // appBarTheme: const AppBarTheme(
        //   color: Color(0xFFF687D4),
        //   elevation: 0,
        //   centerTitle: true,
        //   titleTextStyle: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontFamily: 'Lexend Deca',
        //     fontSize: 42,
        //   ),
        // ),
        // outlinedButtonTheme: OutlinedButtonThemeData(
        //     style: OutlinedButton.styleFrom(
        //   primary: const Color(0xFFF687D4),
        //   shadowColor: Colors.red,
        //   backgroundColor: Colors.transparent,
        //   textStyle: const TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Lexend Deca'),
        //   shape: const StadiumBorder(),
        //   side: const BorderSide(
        //       color: Color(0xFFF687D4), width: 3, style: BorderStyle.solid),
        //   elevation: 0,
        // )),
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   backgroundColor: const Color(0xFFF687D4),
        //   elevation: 0,
        //   selectedLabelStyle: const TextStyle(
        //       color: Color(0xFFFFFFFF),
        //       fontFamily: 'Lexend Deca',
        //       fontWeight: FontWeight.bold,
        //       fontSize: 18.0),
        //   unselectedLabelStyle: TextStyle(
        //       color: Colors.grey[100],
        //       fontFamily: 'Lexend Deca',
        //       fontWeight: FontWeight.bold,
        //       fontSize: 18.0),
        //   selectedItemColor: const Color(0xFFFFFFFF),
        //   unselectedItemColor: Colors.grey[400],
        //   showUnselectedLabels: true,
        // ),
        // buttonTheme: const ButtonThemeData(
        //   buttonColor: Color(0xFFF687D4),
        //   shape: StadiumBorder(),
        //   textTheme: ButtonTextTheme.accent,
        // ),
        // cardTheme: CardTheme(
        //   color: Colors.white,
        //   clipBehavior: Clip.antiAliasWithSaveLayer,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(40),
        //   ),
        // ),
        // dialogTheme: const DialogTheme(
        //   alignment: Alignment.center,
        //   backgroundColor: Colors.white,
        // ),
        // dividerTheme: const DividerThemeData(
        //   color: Color(0xFFF687D4),
        // ),
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(),
        // fontFamily: GoogleFonts.varela().fontFamily,
        // highlightColor: const Color(0xFFF687D4),
        // iconTheme: const IconThemeData(
        //   color: Color(0xFFF687D4),
        //   size: 16,
        // ),
        // inputDecorationTheme: const InputDecorationTheme(),
        // progressIndicatorTheme: const ProgressIndicatorThemeData(
        //   circularTrackColor: Color.fromARGB(255, 182, 52, 143),
        //   color: Color(0xFFF687D4),
        // ),
        // popupMenuTheme: const PopupMenuThemeData(),
        // scaffoldBackgroundColor: const Color(0xFFF687D4),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(5),
          interactive: true,
          thickness: MaterialStateProperty.all(5.0),
        ),
        // visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
        // primarySwatch: const MaterialColor(
        //   0xFFF5E0C3,
        //   <int, Color>{
        //     50: Color(0x1A0C9E3D),
        //     100: Color(0xa1F5E0C3),
        //     200: Color(0xaaF5E0C3),
        //     300: Color(0xafF5E0C3),
        //     400: Color(0xffF5E0C3),
        //     500: Color(0xffEDD5B3),
        //     600: Color(0xffDEC29B),
        //     700: Color(0xffC9A87C),
        //     800: Color(0xffB28E5E),
        //     900: Color(0xff936F3E)
        //   },
        // ),
        // textButtonTheme: TextButtonThemeData(
        //     style: TextButton.styleFrom(
        //   textStyle: const TextStyle(
        //       fontSize: 20,
        //       fontFamily: 'Lexend Deca',
        //       fontWeight: FontWeight.bold,
        //       color: Colors.black),
        // )),
        // primaryColorLight: Colors.white,
        // canvasColor: Colors.white,
        // bottomAppBarColor: const Color(0xFFF687D4),
        // focusColor: const Color(0xFFF687D4),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //       padding: EdgeInsets.all(8),
        //       elevation: 3,
        //       textStyle: const TextStyle(
        //         fontSize: 20,
        //         fontFamily: 'Lexend Deca',
        //         fontWeight: FontWeight.bold,
        //       )),
        // ),
        // ////////////////////////////////////////////////
        /////////////// LIGHT ***********************
        primarySwatch: const MaterialColor(4294939347, {
          50: Color(0xffffe5f5),
          100: Color(0xffffccea),
          200: Color(0xffff99d6),
          300: Color(0xffff66c1),
          400: Color(0xffff33ad),
          500: Color(0xffff0098),
          600: Color(0xffcc007a),
          700: Color(0xff99005b),
          800: Color(0xff66003d),
          900: Color(0xff33001e)
        }),
        brightness: Brightness.light,
        primaryColor: const Color(0xffff92d3),
        primaryColorLight: const Color(0xffffccea),
        primaryColorDark: const Color(0xff99005b),
        // accentColor: const Color(0xffff0098),/////////////////////////
        canvasColor: const Color.fromARGB(255, 255, 255, 255),
        scaffoldBackgroundColor: const Color(0xfffafafa),
        bottomAppBarColor: const Color.fromARGB(255, 255, 255, 255),
        cardColor: const Color(0xffffffff),
        dividerColor: const Color(0x1f000000),
        highlightColor: const Color(0x66bcbcbc),
        splashColor: const Color(0x66c8c8c8),
        selectedRowColor: const Color(0xfff5f5f5),
        unselectedWidgetColor: const Color(0xff607d8b),
        disabledColor: const Color(0xff607d8b),
        toggleableActiveColor: const Color(0xffcc007a),
        secondaryHeaderColor: const Color(0xffffe5f5),
        // textSelectionColor: const Color(0xffff99d6),/////////////////////////////////////////////////////
        // cursorColor: const Color(0xff4caf50),///////////////////////////////////////////
        // textSelectionHandleColor: const Color(0xffff66c1),//////////////////////////////
        backgroundColor: const Color(0xffff99d6),
        dialogBackgroundColor: const Color(0xffffffff),
        indicatorColor: const Color(0xffff0098),
        hintColor: const Color(0xff607d8b),
        errorColor: const Color(0xffd32f2f),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
          minWidth: 88,
          height: 36,
          padding: EdgeInsets.only(top: 0, bottom: 0, left: 36, right: 36),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xff000000),
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          alignedDropdown: true,
          buttonColor: Color(0xffff92d5),
          disabledColor: Color(0xff607d8b),
          highlightColor: Color(0xffff92d3),
          splashColor: Color(0x1f000000),
          focusColor: Color(0x1f000000),
          hoverColor: Color(0x0a000000),
          colorScheme: ColorScheme(
            primary: Color(0xffff92d3),
            // primaryVariant: Color(0xff99005b),////////////////////////
            secondary: Color(0xffff0098),
            // secondaryVariant: Color(0xff99005b),//////////////////////////////
            surface: Color(0xffffffff),
            background: Color(0xffff99d6),
            error: Color(0xffd32f2f),
            onPrimary: Color(0xff000000),
            onSecondary: Color(0xffffffff),
            onSurface: Color(0xff000000),
            onBackground: Color(0xff000000),
            onError: Color(0xffffffff),
            brightness: Brightness.light,
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline2: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline3: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline4: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline5: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          headline6: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          subtitle1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          bodyText2: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
          button: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        primaryTextTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline2: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline3: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline4: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline5: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          headline6: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          subtitle1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          bodyText2: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
          button: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          helperStyle: TextStyle(
            color: Color(0xff607d8b),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
          hintStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorStyle: TextStyle(
            color: Color(0xffd32f2f),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          errorMaxLines: null,
          isDense: false,
          contentPadding:
              EdgeInsets.only(top: 24, bottom: 16, left: 12, right: 12),
          isCollapsed: false,
          prefixStyle: TextStyle(
            color: Color(0xff4caf50),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          suffixStyle: TextStyle(
            color: Color(0xff4caf50),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          counterStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          filled: true,
          fillColor: Color(0x0a000000),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gapPadding: 4),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gapPadding: 4),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gapPadding: 4),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gapPadding: 4),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gapPadding: 4),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xffe91e63),
          opacity: 1,
          size: 24,
        ),
        primaryIconTheme: const IconThemeData(
          color: Color(0xffe91e63),
          opacity: 1,
          size: 24,
        ),

        sliderTheme: const SliderThemeData(
          activeTrackColor: null,
          inactiveTrackColor: null,
          disabledActiveTrackColor: null,
          disabledInactiveTrackColor: null,
          activeTickMarkColor: null,
          inactiveTickMarkColor: null,
          disabledActiveTickMarkColor: null,
          disabledInactiveTickMarkColor: null,
          thumbColor: null,
          disabledThumbColor: null,
          thumbShape: null,
          overlayColor: null,
          valueIndicatorColor: null,
          valueIndicatorShape: null,
          showValueIndicator: ShowValueIndicator.never,
          valueIndicatorTextStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Color.fromARGB(255, 0, 0, 0),
          unselectedLabelColor: Color.fromARGB(125, 0, 0, 0),
        ),

        chipTheme: const ChipThemeData(
          backgroundColor: Color(0xff607d8b),
          brightness: Brightness.light,
          deleteIconColor: Color(0xffff92d3),
          disabledColor: Color(0x0c000000),
          labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
          labelStyle: TextStyle(
            color: Color(0xde000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
          secondaryLabelStyle: TextStyle(
            color: Color(0x3d000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          secondarySelectedColor: Color(0x3dff92d3),
          selectedColor: Color(0x3d000000),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xff000000),
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
        dialogTheme: const DialogTheme(
            shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xff000000),
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
        )),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Lexend Deca',
        // primaryColor: const Color(0xFFF687D4),
        // brightness: Brightness.dark,
        // backgroundColor: Colors.black,
        // dividerColor: const Color(0xFFF687D4),
        // colorScheme: const ColorScheme.dark(
        //   primary: Color(0xFFF687D4),
        // ),
        // appBarTheme: const AppBarTheme(
        //   centerTitle: true,
        //   color: Color(0xFFF687D4),
        //   elevation: 0,
        //   titleTextStyle: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontFamily: 'Lexend Deca',
        //     fontSize: 42,
        //   ),
        // ),
        // textButtonTheme: TextButtonThemeData(
        //     style: TextButton.styleFrom(
        //   textStyle: const TextStyle(
        //       fontSize: 20,
        //       fontFamily: 'Lexend Deca',
        //       fontWeight: FontWeight.bold,
        //       color: Color(0xFFF687D4)),
        // )),
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   backgroundColor: const Color(0xFFF687D4),
        //   elevation: 0,
        //   selectedLabelStyle: const TextStyle(
        //       color: Color(0xFF000000),
        //       fontFamily: 'Lexend Deca',
        //       fontWeight: FontWeight.bold,
        //       fontSize: 18.0),
        //   unselectedLabelStyle: TextStyle(
        //       fontFamily: 'Lexend Deca',
        //       fontWeight: FontWeight.bold,
        //       color: Colors.grey[700],
        //       fontSize: 18.0),
        //   selectedItemColor: const Color(0xFFFFFFFF),
        //   unselectedItemColor: Colors.grey[400],
        //   showUnselectedLabels: true,
        // ),
        // buttonTheme: const ButtonThemeData(
        //   buttonColor: Color(0xFFF687D4),
        //   shape: StadiumBorder(),
        //   textTheme: ButtonTextTheme.accent,
        // ),
        // cardTheme: CardTheme(
        //   color: Colors.grey[900],
        //   clipBehavior: Clip.antiAliasWithSaveLayer,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(40),
        //   ),
        // ),
        // dialogTheme: const DialogTheme(
        //   alignment: Alignment.center,
        //   backgroundColor: Colors.black,
        // ),
        // dividerTheme: const DividerThemeData(
        //   color: Color(0xFFF687D4),
        // ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //       elevation: 3,
        //       textStyle: const TextStyle(
        //         fontSize: 20,
        //         fontFamily: 'Lexend Deca',
        //         fontWeight: FontWeight.bold,
        //       )),
        // ),
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(),
        // fontFamily: GoogleFonts.varela().fontFamily,
        // highlightColor: const Color(0xFFF687D4),
        // iconTheme: const IconThemeData(
        //   color: Colors.white,
        //   size: 16,
        // ),
        // inputDecorationTheme: const InputDecorationTheme(),
        // progressIndicatorTheme: const ProgressIndicatorThemeData(
        //   circularTrackColor: Color.fromARGB(255, 179, 68, 145),
        //   color: Color(0xFFF687D4),
        // ),
        // popupMenuTheme: const PopupMenuThemeData(),
        // scaffoldBackgroundColor: const Color(0xFFF687D4),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(5),
          interactive: true,
          thickness: MaterialStateProperty.all(5.0),
        ),
        // visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
        // primarySwatch: const MaterialColor(
        //   0xFFF5E0C3,
        //   <int, Color>{
        //     50: Color(0x1aF5E0C3),
        //     100: Color(0xa1F5E0C3),
        //     200: Color(0xaaF5E0C3),
        //     300: Color(0xafF5E0C3),
        //     400: Color(0xffF5E0C3),
        //     500: Color(0xffEDD5B3),
        //     600: Color(0xffDEC29B),
        //     700: Color(0xffC9A87C),
        //     800: Color(0xffB28E5E),
        //     900: Color(0xff936F3E)
        //   },
        // ),
        // primaryColorLight: Colors.black,
        // canvasColor: Colors.black,
        // bottomAppBarColor: Colors.deepPurple,
        // focusColor: Colors.deepPurple[700],
        // outlinedButtonTheme: OutlinedButtonThemeData(
        //     style: OutlinedButton.styleFrom(
        //   primary: Colors.deepPurple,
        //   backgroundColor: Colors.transparent,
        //   textStyle: const TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Lexend Deca'),
        //   shape: const StadiumBorder(),
        //   side: const BorderSide(
        //       color: Colors.deepPurple, width: 3, style: BorderStyle.solid),
        //   elevation: 0,
        // )),
        /////////////////////////////////////////////////////DARK**********************************************
        primarySwatch: Colors.pink,
        brightness: Brightness.dark,
        primaryColor: const Color(0xffe91e63),
        primaryColorLight: const Color(0xff9e9e9e),
        primaryColorDark: const Color(0xff000000),
        // accentColor: const Color(0xffff92d3),///////////////////////////////////////
        canvasColor: const Color(0xff000000),
        scaffoldBackgroundColor: const Color(0xff000000),
        bottomAppBarColor: const Color.fromARGB(255, 0, 0, 0),
        cardColor: const Color(0xff424242),
        dividerColor: const Color(0x1fffffff),
        highlightColor: const Color(0x40cccccc),
        splashColor: const Color(0x40cccccc),
        selectedRowColor: const Color(0xfff5f5f5),
        unselectedWidgetColor: const Color(0xb3ffffff),
        disabledColor: const Color(0x62ffffff),
        toggleableActiveColor: const Color(0xffff92d3),
        secondaryHeaderColor: const Color(0xff616161),
        // textSelectionColor: const Color(0xff607d8b),///////////////////////////////
        // cursorColor: const Color(0xffff92d3),///////////////////////////////////
        // textSelectionHandleColor: const Color(0xff999999),///////////////////////
        backgroundColor: const Color(0xff999999),
        dialogBackgroundColor: const Color(0xff424242),
        indicatorColor: const Color(0xffe91e63),
        hintColor: const Color(0x80ffffff),
        errorColor: const Color(0xffd32f2f),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
          minWidth: 88,
          height: 36,
          padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xff000000),
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          alignedDropdown: false,
          buttonColor: Color(0xffff92d3),
          disabledColor: Color(0x61ffffff),
          highlightColor: Color(0x29ffffff),
          splashColor: Color(0x1fffffff),
          focusColor: Color(0x1fffffff),
          hoverColor: Color(0x0affffff),
          colorScheme: ColorScheme(
            primary: Color(0xff000000),
            // primaryVariant: Color(0xff000000),///////////////////////////
            secondary: Color(0xff64ffda),
            // secondaryVariant: Color(0xff00bfa5),/////////////////////////////////////
            surface: Color.fromARGB(255, 173, 58, 58),
            background: Color.fromARGB(255, 182, 55, 55),
            error: Color(0xffd32f2f),
            onPrimary: Color(0xffffffff),
            onSecondary: Color(0xff000000),
            onSurface: Color(0xffffffff),
            onBackground: Color(0xffffffff),
            onError: Color(0xff000000),
            brightness: Brightness.dark,
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline2: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline3: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline4: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline5: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          subtitle1: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          headline6: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          bodyText2: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText1: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
          button: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        primaryTextTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline2: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline3: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline4: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline5: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          headline6: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          subtitle1: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          bodyText2: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText1: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
          button: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          helperStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          hintStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorMaxLines: null,
          isDense: false,
          contentPadding:
              EdgeInsets.only(top: 24, bottom: 16, left: 12, right: 12),
          isCollapsed: false,
          prefixStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          suffixStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          counterStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          filled: true,
          fillColor: Color(0x1affffff),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gapPadding: 4),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gapPadding: 4),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gapPadding: 4),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gapPadding: 4),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gapPadding: 4),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gapPadding: 4),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xffffffff),
          opacity: 1,
          size: 24,
        ),
        primaryIconTheme: const IconThemeData(
          color: Color(0xffffffff),
          opacity: 1,
          size: 24,
        ),

        sliderTheme: const SliderThemeData(
          activeTrackColor: null,
          inactiveTrackColor: null,
          disabledActiveTrackColor: null,
          disabledInactiveTrackColor: null,
          activeTickMarkColor: null,
          inactiveTickMarkColor: null,
          disabledActiveTickMarkColor: null,
          disabledInactiveTickMarkColor: null,
          thumbColor: null,
          disabledThumbColor: null,
          thumbShape: null,
          overlayColor: null,
          valueIndicatorColor: Color(0xffe91e63),
          valueIndicatorShape: null,
          showValueIndicator: ShowValueIndicator.never,
          valueIndicatorTextStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Color(0xffffffff),
          unselectedLabelColor: Color(0xb2ffffff),
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: Color(0x1fffffff),
          brightness: Brightness.dark,
          deleteIconColor: Color(0xfff44336),
          disabledColor: Color(0xff999999),
          labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
          labelStyle: TextStyle(
            color: Color(0xdeffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
          secondaryLabelStyle: TextStyle(
            color: Color(0x3dffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          secondarySelectedColor: Color(0xff607d8b),
          selectedColor: Color(0x3dffffff),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xff000000),
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
        dialogTheme: const DialogTheme(
            shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xff000000),
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
        )),
      ),
      themeMode: ThemeMode.system,
      home: const SignIn(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // @override
    // initState() {
    //   super.initState();

    //   var subscription = Connectivity()
    //       .onConnectivityChanged
    //       .listen((ConnectivityResult result) {
    //     // Got a new connectivity status!
    //   });
    // }

    // ignore: unused_local_variable
    var brightnes = MediaQuery.of(context).platformBrightness;
    // ignore: avoid_print
    print(
        '***************************************************************************************************************************');
    // ignore: avoid_print

    Center(child: Text('Connection Status: ${_connectionStatus.toString()}'));
    // var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      // backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ProfilePage(),
                                ),
                              );
                            },
                            child: Stack(
                              alignment: const AlignmentDirectional(
                                  .9, -0.89999999999999999),
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  // color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: 10,
                                                  width: 10,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14.0),
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      value: downloadProgress
                                                          .progress,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          imageUrl:
                                              'https://www.linkpicture.com/q/unknown_user_icon.webp'),
                                    ),
                                  ),
                                ),
                                Align(
                                  // ignore: prefer_const_constructors
                                  alignment: AlignmentDirectional(0.5, 1.8),
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: _connectionStatus.toString() ==
                                              'ConnectivityResult.none'
                                          ? Colors.red
                                          : Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Text(
                                  'Welcome,',
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    // color: const Color(0xFF1E2429),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Text(
                                    'Jael',
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      // color: const Color(0xFF00968A),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'Your latest updates are below.',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  // color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 6,
                          // color: Color(0x4B1A1F24),
                          offset: Offset(0, 2),
                        )
                      ],
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00968A), Color(0xFFF2A384)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0.94, -1),
                        end: AlignmentDirectional(-0.94, 1),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CachedNetworkImage(
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 4,
                                        value: downloadProgress.progress,
                                      ),
                                    ),
                                  ),
                                ),
                                imageUrl:
                                    'https://www.linkpicture.com/q/Visa-Logo.png',
                                width: 100,
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 24, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text(
                                'Balance',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  // color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 8, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text(
                                'KSH 7,630',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  // color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 12, 20, 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                '****',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  // color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '05/25',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  // color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Text(
                              'Quick Actions',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                // color: Color(0xFF090F13),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: Color(0x3B000000),
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.account_balance_wallet_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Accounts',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: isDark ? Colors.black : Colors.white,
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.note_alt_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Notes',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: Color(0x39000000),
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.maps_home_work_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Projects',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: Color(0x3B000000),
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.work_outline_rounded,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Sales',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: isDark ? Colors.black : Colors.white,
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.miscellaneous_services_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Vault',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: Color(0x39000000),
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.rule_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Expenses',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: Color(0x3B000000),
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add_shopping_cart_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Stocks',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: isDark ? Colors.black : Colors.white,
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.shopping_bag_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Purchase',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),

                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: Color(0x39000000),
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.date_range_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Events',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20, 12, 20, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Text(
                              'Recent Activity',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                // color: Color(0xFF090F13),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.92,
                        height: 70,
                        decoration: BoxDecoration(
                          // color: const Color(0xFFF4F5F7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 0, 0, 0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                // color: const Color(0x6639D2C0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Icon(
                                    Icons.monetization_on_rounded,
                                    // color: Color(0xFF39D2C0),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Hotel A',
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        // color: Color(0xFF1E2429),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        'Income',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    'KSH 50.00',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      // color: Color(0xFF39D2C0),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'Detol',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        // color: Color(0xFF090F13),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 70,
                          decoration: BoxDecoration(
                            // color: const Color(0xFFF4F5F7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 0, 0, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  // color: const Color(0x6639D2C0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Icon(
                                      Icons.monetization_on_rounded,
                                      // color: Color(0xFF39D2C0),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Hotel B',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF1E2429),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          'Income',
                                          style: TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            // color: Color(0xFF090F13),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'KSH 50.00',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        // color: Color(0xFF39D2C0),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        'Jik',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 70,
                          decoration: BoxDecoration(
                            // color: const Color(0xFFF4F5F7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 0, 0, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  // color: const Color(0x6639D2C0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Icon(
                                      Icons.monetization_on_rounded,
                                      // color: Color.fromARGB(255, 226, 60, 212),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Hotel C',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF1E2429),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          'Income',
                                          style: TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            // color: Color(0xFF090F13),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'KSH 50.00',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        // color: Color.fromARGB(255, 9, 102, 40),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        'Stasoft',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
