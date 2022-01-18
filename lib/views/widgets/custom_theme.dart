import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// light theme
ThemeData customLightTheme(
  BuildContext context,
) {
  return ThemeData(
    fontFamily: 'Lexend Deca',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.grey),
    platform: defaultTargetPlatform,
    dividerTheme:
        const DividerThemeData(color: Color(0xffEDF2F7), thickness: 1),

    // primaryColor: const Color(0xFFF687D4),
    // brightness: Brightness.light,
    // backgroundColor: Colors.white,
    // dividerColor: const Color(0xFFF687D4),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFF687D4),
    ),
    // colorSchemeSeed: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Color(0xFFF687D4),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Lexend Deca',
        fontSize: 40,
      ),
    ),
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xffff92d3),
    ),
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
      contentPadding: EdgeInsets.only(top: 24, bottom: 16, left: 12, right: 12),
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
  );

  // ThemeData(
  //     scaffoldBackgroundColor: Colors.white,
  //     visualDensity: VisualDensity.adaptivePlatformDensity,
  //     textSelectionTheme:
  //         const TextSelectionThemeData(cursorColor: customGreyColor),
  //     errorColor: const Color.fromRGBO(229, 62, 62, 1),
  //     platform: defaultTargetPlatform,
  //     highlightColor: customRedColor.withOpacity(.5),
  //     primaryColor: Colors.white,
  //     indicatorColor: customRedColor,
  //     floatingActionButtonTheme:
  //         const FloatingActionButtonThemeData(backgroundColor: customRedColor),
  //     unselectedWidgetColor: Colors.grey,
  //     brightness: Brightness.light,
  //     fontFamily: GoogleFonts.poppins().fontFamily,
  //     cardColor: const Color.fromRGBO(250, 250, 250, 1),
  //     inputDecorationTheme: InputDecorationTheme(
  //       fillColor: Colors.white,
  //       filled: true,
  //       alignLabelWithHint: true,
  //       hintStyle: Theme.of(context).textTheme.bodyText1,
  //       contentPadding: const EdgeInsets.all(15.0),
  //       floatingLabelBehavior: FloatingLabelBehavior.auto,
  //       focusedBorder: const UnderlineInputBorder(
  //           borderSide: BorderSide(color: Colors.grey, width: .5),
  //           borderRadius: BorderRadius.all(Radius.circular(5))),
  //       enabledBorder: const UnderlineInputBorder(
  //           borderSide: BorderSide(color: Colors.grey, width: .5),
  //           borderRadius: BorderRadius.all(Radius.circular(5))),
  //       disabledBorder: const UnderlineInputBorder(
  //           borderSide: BorderSide(color: Color(0xffE5E5E5)),
  //           borderRadius: BorderRadius.all(Radius.circular(5))),
  //       errorBorder: UnderlineInputBorder(
  //           borderSide:
  //               BorderSide(color: const Color(0xffB00020).withOpacity(.5)),
  //           borderRadius: const BorderRadius.all(Radius.circular(5))),
  //       focusedErrorBorder: const UnderlineInputBorder(
  //           borderSide: BorderSide(color: Color(0xffB00020)),
  //           borderRadius: BorderRadius.all(Radius.circular(5))),
  //       labelStyle: Theme.of(context).textTheme.bodyText2,
  //       errorStyle: Theme.of(context)
  //           .textTheme
  //           .bodyText2!
  //           .copyWith(color: const Color.fromRGBO(229, 62, 62, 1)),
  //     ),
  //     iconTheme: const IconThemeData(color: Colors.black),
  //     tabBarTheme: TabBarTheme(
  //       unselectedLabelColor: Colors.black.withOpacity(.5),
  //     ),
  //     textTheme: Typography.material2018(platform: defaultTargetPlatform)
  //         .white
  //         .copyWith(
  //           bodyText1: const TextStyle(color: Colors.black, fontSize: 16),
  //           bodyText2: const TextStyle(color: Colors.black, fontSize: 14),
  //           caption: const TextStyle(color: Colors.black, fontSize: 12),
  //           headline1: const TextStyle(color: Colors.black, fontSize: 96),
  //           headline2: const TextStyle(color: Colors.black, fontSize: 60),
  //           headline3: const TextStyle(color: Colors.black, fontSize: 48),
  //           headline4: const TextStyle(color: Colors.black, fontSize: 34),
  //           headline5: const TextStyle(color: Colors.black, fontSize: 24),
  //           headline6: const TextStyle(color: Colors.black, fontSize: 20),
  //           subtitle1: const TextStyle(color: Colors.black, fontSize: 16),
  //           subtitle2: const TextStyle(color: Colors.black, fontSize: 14),
  //           overline: const TextStyle(color: Colors.black, fontSize: 10),
  //           button: const TextStyle(color: Colors.black, fontSize: 16),
  //         ),
  //     dividerTheme:
  //         const DividerThemeData(color: Color(0xffEDF2F7), thickness: 1),
  //     appBarTheme: const AppBarTheme(
  //       elevation: 0,
  //       systemOverlayStyle: SystemUiOverlayStyle.light,
  //       color: Colors.white,
  //       iconTheme: IconThemeData(color: Colors.black),
  //       titleTextStyle: TextStyle(color: Colors.black),
  //     ),
  //     colorScheme: const ColorScheme.light(secondary: customRedColor));
}

///dark theme
ThemeData customDarkTheme(
  BuildContext context,
) {
  return ThemeData(
    fontFamily: 'Lexend Deca',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.grey),
    platform: defaultTargetPlatform,
    dividerTheme:
        const DividerThemeData(color: Color(0xffEDF2F7), thickness: 1),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.pink,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.pink,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Lexend Deca',
        fontSize: 40,
      ),
    ),
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
      contentPadding: EdgeInsets.only(top: 24, bottom: 16, left: 12, right: 12),
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
  );

  // ThemeData(
  //     scaffoldBackgroundColor: const Color(0xff121212),
  //     visualDensity: VisualDensity.adaptivePlatformDensity,
  //     textSelectionTheme:
  //         const TextSelectionThemeData(cursorColor: customGreyColor),
  //     errorColor: const Color(0xffCF6679),
  //     primaryColor: Colors.black,
  //     indicatorColor: customRedColor,
  //     highlightColor: customRedColor.withOpacity(.5),
  //     floatingActionButtonTheme:
  //         const FloatingActionButtonThemeData(backgroundColor: customRedColor),
  //     platform: defaultTargetPlatform,
  //     unselectedWidgetColor: Colors.grey,
  //     brightness: Brightness.dark,
  //     fontFamily: GoogleFonts.poppins().fontFamily,
  //     cardColor: const Color.fromRGBO(31, 31, 31, 1),
  //     tabBarTheme: TabBarTheme(
  //       unselectedLabelColor: Colors.white.withOpacity(.7),
  //     ),
  //     textTheme: Typography.material2018(platform: defaultTargetPlatform)
  //         .white
  //         .copyWith(
  //           bodyText1: const TextStyle(color: Colors.white, fontSize: 16),
  //           bodyText2: const TextStyle(color: Colors.white, fontSize: 14),
  //           caption: const TextStyle(color: Colors.white, fontSize: 12),
  //           headline1: const TextStyle(color: Colors.white, fontSize: 96),
  //           headline2: const TextStyle(color: Colors.white, fontSize: 60),
  //           headline3: const TextStyle(color: Colors.white, fontSize: 48),
  //           headline4: const TextStyle(color: Colors.white, fontSize: 34),
  //           headline5: const TextStyle(color: Colors.white, fontSize: 24),
  //           headline6: const TextStyle(color: Colors.white, fontSize: 20),
  //           subtitle1: const TextStyle(color: Colors.white, fontSize: 16),
  //           subtitle2: const TextStyle(color: Colors.white, fontSize: 14),
  //           overline: const TextStyle(color: Colors.white, fontSize: 10),
  //           button: const TextStyle(color: Colors.white, fontSize: 16),
  //         ),
  //     iconTheme: const IconThemeData(color: Colors.white),
  //     dividerTheme: const DividerThemeData(
  //         color: Color.fromRGBO(113, 128, 150, 1), thickness: 1),
  //     inputDecorationTheme: InputDecorationTheme(
  //       fillColor: const Color.fromRGBO(31, 31, 31, 1),
  //       filled: true,
  //       alignLabelWithHint: true,
  //       hintStyle: Theme.of(context).textTheme.bodyText1,
  //       contentPadding: const EdgeInsets.all(15.0),
  //       floatingLabelBehavior: FloatingLabelBehavior.auto,
  //       focusedBorder: const UnderlineInputBorder(
  //           borderSide: BorderSide(color: Colors.grey, width: .5),
  //           borderRadius: BorderRadius.all(Radius.circular(5))),
  //       enabledBorder: const UnderlineInputBorder(
  //           borderSide: BorderSide(color: Colors.grey, width: .5),
  //           borderRadius: BorderRadius.all(Radius.circular(5))),
  //       disabledBorder: const UnderlineInputBorder(
  //           borderSide: BorderSide(color: Color(0xffE5E5E5)),
  //           borderRadius: BorderRadius.all(Radius.circular(5))),
  //       errorBorder: UnderlineInputBorder(
  //           borderSide:
  //               BorderSide(color: const Color(0xffCF6679).withOpacity(.5)),
  //           borderRadius: const BorderRadius.all(Radius.circular(5))),
  //       focusedErrorBorder: const UnderlineInputBorder(
  //           borderSide: BorderSide(color: Color(0xffCF6679)),
  //           borderRadius: BorderRadius.all(Radius.circular(5))),
  //       labelStyle: Theme.of(context)
  //           .textTheme
  //           .bodyText2!
  //           .copyWith(color: Colors.white),
  //       errorStyle: Theme.of(context)
  //           .textTheme
  //           .bodyText2!
  //           .copyWith(color: const Color(0xffCF6679)),
  //     ),
  //     appBarTheme: const AppBarTheme(
  //       elevation: 0,
  //       systemOverlayStyle: SystemUiOverlayStyle.dark,
  //       color: Color(0xff121212),
  //       iconTheme: IconThemeData(color: Colors.white),
  //       titleTextStyle: TextStyle(color: Colors.white),
  //     ),
  //     colorScheme: const ColorScheme.dark(secondary: customRedColor));
}
