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

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var brightnes = MediaQuery.of(context).platformBrightness;
    bool isDark = brightnes == Brightness.dark;
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
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
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          // color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                2, 2, 2, 2),
                            child: Container(
                              width: 60,
                              height: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://www.linkpicture.com/q/unknown_user_icon.webp',
                              ),
                            ),
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
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
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://www.linkpicture.com/q/Visa-Logo.png',
                              width: 44,
                              height: 14,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    // color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        // color: Color(0x39000000),
                        offset: Offset(0, -1),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                // color: isDark ? Colors.black : Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    // color: Color(0x3B000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.swap_horiz_rounded,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Transfer',
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
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                // color: isDark ? Colors.black : Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    // color: isDark ? Colors.black : Colors.white,
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.stacked_line_chart_rounded,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Activity',
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
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                // color: isDark ? Colors.black : Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    // color: Color(0x39000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.account_balance_outlined,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'My Stock',
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
                              'Latest Transactions',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
