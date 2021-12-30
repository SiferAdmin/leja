import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leja/main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share/share.dart';

import '../utils/validator.dart';

class SignInPageWidget extends StatefulWidget {
  const SignInPageWidget({Key? key}) : super(key: key);

  @override
  _SignInPageWidgetState createState() => _SignInPageWidgetState();
}

class _SignInPageWidgetState extends State<SignInPageWidget> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePageWidget(),
        ),
      );
    }

    return firebaseApp;
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  late TextEditingController confirmPasswordController;
  late bool confirmPasswordVisibility;
  late TextEditingController createEmailController;
  late TextEditingController createPasswordController;
  late bool createPasswordVisibility;
  late TextEditingController loginEmailAddressController;
  late TextEditingController loginPasswordController;
  late bool loginPasswordVisibility;
  String name = 'New User';
  String email = '';
  String password = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    confirmPasswordController = TextEditingController();
    confirmPasswordVisibility = false;
    createEmailController = TextEditingController();
    createPasswordController = TextEditingController();
    createPasswordVisibility = false;
    loginEmailAddressController = TextEditingController();
    loginPasswordController = TextEditingController();
    loginPasswordVisibility = false;
  }

  // ignore: unused_field
  final bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    var brightnes = MediaQuery.of(context).platformBrightness;
    // ignore: unused_local_variable
    bool isDark = brightnes == Brightness.dark;
    return SafeArea(
        child: Scaffold(
            key: scaffoldKey,
            body:
                //////////////////////////////////////////////////////////////////////////////////////////FUTURE

                //////////////////////////////////////////////////////////////////////////////////////////FUTURE

                Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 52, 16, 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Welcome To',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          // color: isDark ? Colors.black : Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                            ),
                                          ),
                                  imageUrl:
                                      'https://www.linkpicture.com/q/leja_banner.png'),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'imageTag',
                          transitionOnUserGestures: true,
                          child: Image.network(
                            'https://www.linkpicture.com/q/leja_banner.png',
                            width: 250,
                            height: 38,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child:
                        //  Container(
                        //   color: Colors.red,
                        // )
                        Column(
                      children: [
                        const TabBar(
                          // labelColor: isDark ? Colors.black : Colors.white,
                          labelStyle: TextStyle(),
                          // indicatorColor: isDark ? Colors.black : Colors.white,
                          tabs: [
                            Tab(
                              text: 'Login',
                            ),
                            Tab(
                              text: 'Create Account',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                    // color: isDark ? Colors.black : Colors.white,
                                    ),
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(24, 24, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Login',
                                                style: TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  // color: Colors.black,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(24, 4, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Enter your details to continue.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  // color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 16, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  key: const ValueKey('email'),
                                                  // focusNode: _focusEmail,
                                                  validator: (value) =>
                                                      Validator.validateEmail(
                                                    email: value,
                                                  ),
                                                  onSaved: (value) {
                                                    setState(() {
                                                      email = value!;
                                                    });
                                                  },
                                                  controller:
                                                      loginEmailAddressController,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Email Address',
                                                    labelStyle: const TextStyle(
                                                      fontFamily: 'Lexend Deca',
                                                      // color: Color(0xFF95A1AC),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    hintText:
                                                        'Enter your email here...',
                                                    hintStyle: const TextStyle(
                                                      fontFamily: 'Lexend Deca',
                                                      // color: Color(0xFF95A1AC),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                        // color: Color(0xFFDBE2E7),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                        // color: Color(0xFFDBE2E7),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    // fillColor: Colors.white,
                                                  ),
                                                  style: const TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    // color: Color(0xFF2B343A),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 16, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  key: const ValueKey(
                                                      'password'),
                                                  // focusNode:
                                                  //     _focusPassword,
                                                  validator: (value) =>
                                                      Validator
                                                          .validatePassword(
                                                    password: value,
                                                  ),
                                                  controller:
                                                      loginPasswordController,
                                                  obscureText:
                                                      !loginPasswordVisibility,
                                                  decoration: InputDecoration(
                                                    labelText: 'Password',
                                                    labelStyle: const TextStyle(
                                                      fontFamily: 'Lexend Deca',
                                                      // color: Color(0xFF95A1AC),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    hintText:
                                                        'Enter your email here...',
                                                    hintStyle: const TextStyle(
                                                      fontFamily: 'Lexend Deca',
                                                      // color: Color(0xFF95A1AC),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                        // color: Color(0xFFDBE2E7),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                        // color: Color(0xFFDBE2E7),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    // fillColor: Colors.white,
                                                    suffixIcon: InkWell(
                                                      onTap: () => setState(
                                                        () => loginPasswordVisibility =
                                                            !loginPasswordVisibility,
                                                      ),
                                                      child: Icon(
                                                        loginPasswordVisibility
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                        // color:
                                                        //     const Color(0xFF95A1AC),
                                                        size: 22,
                                                      ),
                                                    ),
                                                  ),
                                                  style: const TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    // color: Color(0xFF2B343A),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 16, 0, 0),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              // setState(() {});
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Future<UserCredential> user =
                                                    FirebaseAuth.instance
                                                        .signInWithEmailAndPassword(
                                                  email: createEmailController
                                                      .text,
                                                  password:
                                                      loginPasswordController
                                                          .text,
                                                );

                                                // setState(() {});

                                                // ignore: unnecessary_null_comparison
                                                if (user != null) {
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomePageWidget(),
                                                    ),
                                                    ModalRoute.withName('/'),
                                                  );
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Your Sign In failed'),
                                                        content: const Text(
                                                            'Please enter your correct password and email again or Sign Up for a new account if you dont have one.'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text(
                                                                'Try Again'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              }
                                            },
                                            child: const Text('Login'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 20, 0, 0),
                                          child: TextButton(
                                            onPressed: () {
                                              Share.share(
                                                  'eddy@techcuttie.com');
                                            },
                                            child:
                                                const Text('Forgot Password'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                    // color: isDark ? Colors.black : Colors.white,
                                    // ignore: unrelated_type_equality_checks
                                    // color: ThemeMode.system != ThemeMode.light
                                    //     ? Colors.white
                                    //     : Colors.black,
                                    ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24, 24, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Text(
                                              'Create Account',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                // color: Colors.whi,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24, 4, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Enter the information below to get started.',
                                              textAlign: TextAlign.center,
                                              // style: TextStyle(
                                              //   fontFamily: 'Lexend Deca',
                                              //   color: Color(0x77FFFFFF),
                                              //   fontSize: 14,
                                              //   fontWeight: FontWeight.normal,
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    createEmailController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Email Address',
                                                  labelStyle: const TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    // color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  hintText:
                                                      'Enter your email here...',
                                                  hintStyle: const TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    // color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      // color: Color(0xFFDBE2E7),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      // color: Color(0xFFDBE2E7),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  filled: true,
                                                  // fillColor: Colors.white,
                                                ),
                                                style: const TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  // color: Color(0xFF2B343A),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    createPasswordController,
                                                obscureText:
                                                    !createPasswordVisibility,
                                                decoration: InputDecoration(
                                                  labelText: 'Password',
                                                  labelStyle: const TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    // color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  hintText:
                                                      'Enter your password',
                                                  hintStyle: const TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    // color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      // color: Color(0xFFDBE2E7),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      // color: Color(0xFFDBE2E7),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  filled: true,
                                                  // fillColor: Colors.white,
                                                  suffixIcon: InkWell(
                                                    onTap: () => setState(
                                                      () => createPasswordVisibility =
                                                          !createPasswordVisibility,
                                                    ),
                                                    child: Icon(
                                                      createPasswordVisibility
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
                                                      // color:
                                                      //     const Color(0xFF95A1AC),
                                                      size: 22,
                                                    ),
                                                  ),
                                                ),
                                                style: const TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  // color: Color(0xFF2B343A),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    confirmPasswordController,
                                                obscureText:
                                                    !confirmPasswordVisibility,
                                                decoration: InputDecoration(
                                                  labelText: 'Confirm Password',
                                                  labelStyle: const TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    // color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  hintText:
                                                      'Enter the same password as above.',
                                                  hintStyle: const TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    // color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      // color: Color(0xFFDBE2E7),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      // color: Color(0xFFDBE2E7),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  filled: true,
                                                  // fillColor: Colors.white,
                                                  suffixIcon: InkWell(
                                                    onTap: () => setState(
                                                      () => confirmPasswordVisibility =
                                                          !confirmPasswordVisibility,
                                                    ),
                                                    child: Icon(
                                                      confirmPasswordVisibility
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
                                                      // color:
                                                      //     const Color(0xFF95A1AC),
                                                      size: 22,
                                                    ),
                                                  ),
                                                ),
                                                style: const TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  // color: Color(0xFF2B343A),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 20, 0, 0),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            print(1);
                                            if (_formKey.currentState!
                                                .validate()) {
                                              Future<UserCredential> user =
                                                  FirebaseAuth.instance
                                                      .createUserWithEmailAndPassword(
                                                email:
                                                    createEmailController.text,
                                                password:
                                                    loginPasswordController
                                                        .text,
                                              );
                                              print(2);
                                              final DateFormat formatter =
                                                  DateFormat('dd/MM/yyyy');
                                              String createDate = formatter
                                                  .format(DateTime.now());
                                              print(3);
                                              var userId = FirebaseAuth
                                                  .instance.currentUser!.uid;
                                              print(5);
                                              FirebaseFirestore.instance
                                                  .collection('UserData')
                                                  .doc(userId)
                                                  .set({
                                                "email":
                                                    createEmailController.text,
                                                "name": name,
                                                "key": loginPasswordController
                                                    .text,
                                                "middle_name": '',
                                                "first_name": '',
                                                "last_name": '',
                                                "pic_link": '',
                                                "phone_number": '',
                                                "online_status": true,
                                                "register_date": createDate,
                                              });
                                              print(6);

                                              // setState(() {
                                              //   _isProcessing = false;
                                              // });

                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePageWidget(),
                                                ),
                                                ModalRoute.withName('/'),
                                              );
                                              print(7);
                                            }
                                          },
                                          child: const Text('Create Account'),
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
              ],
            )

            //////////////////////////////////////////////////////////////////////////////////////////FUTURE

            //////////////////////////////////////////////////////////////////////////////////////////FUTURE

            ));
  }
}
