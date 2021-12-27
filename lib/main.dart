import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leja/pages/sign_in_page_widget.dart';

void main() {
  runApp(const MyApp());
}

var brightness = SchedulerBinding.instance!.window.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;

//  var brightness = MediaQuery.of(context).platformBrightness;
//  bool isDarkMode = brightness == Brightness.dark;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFF687D4),
        // primaryColor: Color.fromARGB(255, 177, 19, 129),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        dividerColor: const Color(0xFFF687D4),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFF687D4),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFF687D4),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Lexend Deca',
            fontSize: 42,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          primary: const Color(0xFFF687D4),
          shadowColor: Colors.red,
          backgroundColor: Colors.transparent,
          textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend Deca'),
          shape: const StadiumBorder(),
          side: const BorderSide(
              color: Color(0xFFF687D4), width: 3, style: BorderStyle.solid),
          elevation: 0,
        )),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFFF687D4),
          elevation: 0,
          selectedLabelStyle: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
          unselectedLabelStyle: TextStyle(
              color: Colors.grey[100],
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
          selectedItemColor: const Color(0xFFFFFFFF),
          unselectedItemColor: Colors.grey[400],
          showUnselectedLabels: true,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFF687D4),
          shape: StadiumBorder(),
          textTheme: ButtonTextTheme.accent,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        dialogTheme: const DialogTheme(
          alignment: Alignment.center,
          backgroundColor: Colors.white,
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xFFF687D4),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(),
        fontFamily: GoogleFonts.varela().fontFamily,
        highlightColor: const Color(0xFFF687D4),
        iconTheme: const IconThemeData(
          color: Color(0xFFF687D4),
          size: 16,
        ),
        inputDecorationTheme: const InputDecorationTheme(),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          circularTrackColor: Color.fromARGB(255, 182, 52, 143),
          color: Color(0xFFF687D4),
        ),
        popupMenuTheme: const PopupMenuThemeData(),
        scaffoldBackgroundColor: const Color(0xFFF687D4),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(5),
          interactive: true,
          thickness: MaterialStateProperty.all(5.0),
        ),
        visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
        primarySwatch: const MaterialColor(
          0xFFF5E0C3,
          <int, Color>{
            50: Color(0x1A0C9E3D),
            100: Color(0xa1F5E0C3),
            200: Color(0xaaF5E0C3),
            300: Color(0xafF5E0C3),
            400: Color(0xffF5E0C3),
            500: Color(0xffEDD5B3),
            600: Color(0xffDEC29B),
            700: Color(0xffC9A87C),
            800: Color(0xffB28E5E),
            900: Color(0xff936F3E)
          },
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          textStyle: const TextStyle(
              fontSize: 20,
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        )),
        primaryColorLight: Colors.white,
        canvasColor: Colors.white,
        bottomAppBarColor: const Color(0xFFF687D4),
        focusColor: const Color(0xFFF687D4),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 3,
              textStyle: const TextStyle(
                fontSize: 20,
                fontFamily: 'Lexend Deca',
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: const Color(0xFFF687D4),
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        dividerColor: const Color(0xFFF687D4),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFF687D4),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Color(0xFFF687D4),
          elevation: 0,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Lexend Deca',
            fontSize: 42,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          textStyle: const TextStyle(
              fontSize: 20,
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.bold,
              color: Color(0xFFF687D4)),
        )),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFFF687D4),
          elevation: 0,
          selectedLabelStyle: const TextStyle(
              color: Color(0xFF000000),
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
          unselectedLabelStyle: TextStyle(
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
              fontSize: 18.0),
          selectedItemColor: const Color(0xFFFFFFFF),
          unselectedItemColor: Colors.grey[400],
          showUnselectedLabels: true,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFF687D4),
          shape: StadiumBorder(),
          textTheme: ButtonTextTheme.accent,
        ),
        cardTheme: CardTheme(
          color: Colors.grey[900],
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        dialogTheme: const DialogTheme(
          alignment: Alignment.center,
          backgroundColor: Colors.black,
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xFFF687D4),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 3,
              textStyle: const TextStyle(
                fontSize: 20,
                fontFamily: 'Lexend Deca',
                fontWeight: FontWeight.bold,
              )),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(),
        fontFamily: GoogleFonts.varela().fontFamily,
        highlightColor: const Color(0xFFF687D4),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 16,
        ),
        inputDecorationTheme: const InputDecorationTheme(),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          circularTrackColor: Color.fromARGB(255, 179, 68, 145),
          color: Color(0xFFF687D4),
        ),
        popupMenuTheme: const PopupMenuThemeData(),
        scaffoldBackgroundColor: const Color(0xFFF687D4),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(5),
          interactive: true,
          thickness: MaterialStateProperty.all(5.0),
        ),
        visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
        primarySwatch: const MaterialColor(
          0xFFF5E0C3,
          <int, Color>{
            50: Color(0x1aF5E0C3),
            100: Color(0xa1F5E0C3),
            200: Color(0xaaF5E0C3),
            300: Color(0xafF5E0C3),
            400: Color(0xffF5E0C3),
            500: Color(0xffEDD5B3),
            600: Color(0xffDEC29B),
            700: Color(0xffC9A87C),
            800: Color(0xffB28E5E),
            900: Color(0xff936F3E)
          },
        ),
        primaryColorLight: Colors.black,
        canvasColor: Colors.black,
        bottomAppBarColor: Colors.deepPurple,
        focusColor: Colors.deepPurple[700],
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          primary: Colors.deepPurple,
          backgroundColor: Colors.transparent,
          textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend Deca'),
          shape: const StadiumBorder(),
          side: const BorderSide(
              color: Colors.deepPurple, width: 3, style: BorderStyle.solid),
          elevation: 0,
        )),
      ),
      themeMode: ThemeMode.system,
      home: const SignInPageWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Home Content',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
