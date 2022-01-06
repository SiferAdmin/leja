// import 'dart:convert';
// import 'dart:io';

// import 'package:bot_toast/bot_toast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get_it/get_it.dart';
// import 'package:groovin_widgets/groovin_widgets.dart';
// import 'package:logger/logger.dart';

// import 'package:leja/managers/organization_manager.dart';
// import 'package:leja/managers/user_manager.dart';
// import 'package:leja/models/organization.dart';
// import 'package:leja/utils/local_storage.dart';
// import 'package:leja/utils/ui_utils/custom_colors.dart';
// import 'package:leja/utils/ui_utils/ui_utils.dart';
// import 'package:leja/views/pages/projects/account/account_view.dart';
// import 'package:leja/views/pages/projects/inbox/inbox_view.dart';
// import 'package:leja/views/pages/projects/overview/over_view.dart';
// import 'package:leja/views/pages/projects/task/task_view.dart';

// final FirebaseMessaging _messaging = FirebaseMessaging.instance;
// final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// final LocalStorage _localStorage = GetIt.I.get<LocalStorage>();
// final OrganizationManager _organizationManager =
//     GetIt.I.get<OrganizationManager>();
// final UserManager _userManager = GetIt.I.get<UserManager>();

// // ignore: must_be_immutable
// class DashboardView extends StatefulWidget {
//   final int currentIndex;

//   const DashboardView({
//     Key? key,
//     required this.currentIndex,
//   }) : super(key: key);
//   @override
//   _DashboardViewState createState() => _DashboardViewState();
// }

// class _DashboardViewState extends State<DashboardView> {
//   final Logger _logger = Logger();
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   final UiUtilities uiUtilities = UiUtilities();
//   String? team;
//   late int _currentIndex;
//   final List<Widget> _pages = [
//     OverView(),
//     const TaskView(),
//     const InboxView(),
//     const AccountView()
//   ];

//   _onChanged(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   void initState() {
//     // checkAuth();
//     confirmAuthStatus();
//     setState(() {
//       _currentIndex = widget.currentIndex;
//     });
//     initialNotification(context: context);
//     uploadNotificationToken();

//     super.initState();
//   }

//   void uploadNotificationToken() async {
//     if (_firebaseAuth.currentUser != null) {
//       await _messaging.getToken().then((token) async {
//         await _userManager.sendNotificationToken(token: token);
//       });
//     }
//   }

//   Future onSelectNotification(String payload) async {
//     _logger.d("payload : $payload");
//   }

//   initialNotification({required BuildContext context}) async {
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     var android = const AndroidInitializationSettings('@mipmap/launcher_icon');
//     var iOS = const IOSInitializationSettings(
//         defaultPresentAlert: true,
//         defaultPresentBadge: true,
//         defaultPresentSound: true);
//     // ignore: unused_local_variable
//     var initSettings = InitializationSettings(android: android, iOS: iOS);
//     // flutterLocalNotificationsPlugin.initialize(initSettings,
//     //     onSelectNotification: onSelectNotification);

//     if (Platform.isIOS) {
//       await _messaging.requestPermission(
//         alert: true,
//         announcement: true,
//         badge: true,
//         carPlay: true,
//         criticalAlert: true,
//         provisional: true,
//         sound: true,
//       );

//       await _messaging.setForegroundNotificationPresentationOptions(
//         alert: true, // Required to display a heads up notification
//         badge: true,
//         sound: true,
//       );
//     }

//     var androidNotificationDetails = const AndroidNotificationDetails(
//         'tasky', 'Tasky' 'Notifications from Tasky app',
//         priority: Priority.high, importance: Importance.max);
//     var iOSNotificationDetails = const IOSNotificationDetails();
//     var platform = NotificationDetails(
//         android: androidNotificationDetails, iOS: iOSNotificationDetails);

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       RemoteNotification? notification = message.notification;
//       // If `onMessage` is triggered with a notification, construct our own
//       // local notification to show to users using the created channel.
//       await flutterLocalNotificationsPlugin.show(
//           0, notification!.title, notification.body, platform,
//           payload: json.encode(message.data));
//     });

//     // Get any messages which caused the application to open from
//     // a terminated state.
//     // await _messaging
//     //     .getInitialMessage()
//     //     .then((RemoteMessage initialMessage) async {
//     //   // ignore: null_aware_in_condition
//     //   var androidNotificationDetails = const AndroidNotificationDetails(
//     //       'tasky', 'Tasky', 'Notifications from Tasky app',
//     //       priority: Priority.high, importance: Importance.max);
//     //   var iOSNotificationDetails = const IOSNotificationDetails();
//     //   var platform = NotificationDetails(
//     //       android: androidNotificationDetails, iOS: iOSNotificationDetails);
//     //   await flutterLocalNotificationsPlugin.show(
//     //       0,
//     //       initialMessage.notification!.title,
//     //       initialMessage.notification!.body,
//     //       platform,
//     //       payload: json.encode(initialMessage.data));
//     // }
//     // );

//     // Also handle any interaction when the app is in the background via a
//     // Stream listener
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       var androidNotificationDetails = const AndroidNotificationDetails(
//           'tasky', 'Tasky' 'Notifications from Tasky app',
//           priority: Priority.high, importance: Importance.max);
//       var iOSNotificationDetails = const IOSNotificationDetails();
//       var platform = NotificationDetails(
//           android: androidNotificationDetails, iOS: iOSNotificationDetails);

//       await flutterLocalNotificationsPlugin.show(
//           0, message.notification!.title, message.notification!.body, platform,
//           payload: json.encode(message.data));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unnecessary_null_comparison
//     return _currentIndex == null
//         ? const Scaffold(body: Center(child: CupertinoActivityIndicator()))
//         : Scaffold(
//             body: IndexedStack(
//               children: _pages,
//               index: _currentIndex,
//             ),
//             bottomNavigationBar: BottomNavigationBar(
//               currentIndex: _currentIndex,
//               onTap: _onChanged,
//               selectedIconTheme:
//                   Theme.of(context).iconTheme.copyWith(color: customRedColor),
//               selectedLabelStyle: Theme.of(context)
//                   .textTheme
//                   .bodyText2!
//                   .copyWith(color: customRedColor),
//               unselectedIconTheme:
//                   Theme.of(context).iconTheme.copyWith(color: customGreyColor),
//               unselectedLabelStyle: Theme.of(context)
//                   .textTheme
//                   .bodyText2!
//                   .copyWith(color: customGreyColor),
//               type: BottomNavigationBarType.fixed,
//               showUnselectedLabels: true,
//               backgroundColor:
//                   Theme.of(context).bottomNavigationBarTheme.backgroundColor,
//               selectedItemColor: customRedColor,
//               unselectedItemColor: customGreyColor,
//               items: [
//                 BottomNavigationBarItem(
//                     icon: SvgPicture.asset('assets/chart_pie.svg'),
//                     label: 'Overview',
//                     activeIcon: SvgPicture.asset(
//                       'assets/chart_pie.svg',
//                       color: customRedColor,
//                     )),
//                 BottomNavigationBarItem(
//                     icon: SvgPicture.asset('assets/lightning_bolt.svg'),
//                     label: 'Task',
//                     activeIcon: SvgPicture.asset(
//                       'assets/lightning_bolt.svg',
//                       color: customRedColor,
//                     )),
//                 BottomNavigationBarItem(
//                     icon: SvgPicture.asset('assets/inbox.svg'),
//                     label: 'Inbox',
//                     activeIcon: SvgPicture.asset(
//                       'assets/inbox.svg',
//                       color: customRedColor,
//                     )),
//                 BottomNavigationBarItem(
//                     icon: SvgPicture.asset('assets/user_circle.svg'),
//                     label: 'Account',
//                     activeIcon: SvgPicture.asset(
//                       'assets/user_circle.svg',
//                       color: customRedColor,
//                     ))
//               ],
//             ),
//           );
//   }

//   void getUserTeam() async {
//     Organization? organization = await _organizationManager.getOrganization();
//     _localStorage.getUserInfo().then((data) {
//       if (data.team == null) {
//         showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text(
//                   'Update your Team',
//                   style: Theme.of(context)
//                       .textTheme
//                       .button!
//                       .copyWith(fontWeight: FontWeight.w600),
//                 ),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 content: SizedBox(
//                   height: 150,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Material(
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             side:
//                                 const BorderSide(color: Colors.grey, width: 1)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: OutlineDropdownButton(
//                             inputDecoration: InputDecoration(
//                               alignLabelWithHint: true,
//                               hintStyle: Theme.of(context)
//                                   .inputDecorationTheme
//                                   .hintStyle,
//                               contentPadding:
//                                   const EdgeInsets.fromLTRB(15, 1, 15, 1),
//                               floatingLabelBehavior: FloatingLabelBehavior.auto,
//                               focusedBorder: Theme.of(context)
//                                   .inputDecorationTheme
//                                   .focusedBorder,
//                               enabledBorder: Theme.of(context)
//                                   .inputDecorationTheme
//                                   .enabledBorder,
//                               disabledBorder: Theme.of(context)
//                                   .inputDecorationTheme
//                                   .disabledBorder,
//                               errorBorder: Theme.of(context)
//                                   .inputDecorationTheme
//                                   .errorBorder,
//                               focusedErrorBorder: Theme.of(context)
//                                   .inputDecorationTheme
//                                   .focusedErrorBorder,
//                               fillColor: Theme.of(context)
//                                   .inputDecorationTheme
//                                   .fillColor,
//                               filled: true,
//                               labelStyle: Theme.of(context)
//                                   .inputDecorationTheme
//                                   .labelStyle,
//                               errorStyle: Theme.of(context)
//                                   .inputDecorationTheme
//                                   .errorStyle,
//                             ),
//                             items: organization!.data!.teams!
//                                 .map((value) => DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(
//                                       value,
//                                       style:
//                                           Theme.of(context).textTheme.bodyText1,
//                                     )))
//                                 .toList(),
//                             value: team,
//                             hint: Text(
//                               'Select your team',
//                               style: Theme.of(context).textTheme.bodyText2,
//                             ),
//                             onChanged: (value) {
//                               setState(() {
//                                 team = value;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       TextButton(
//                           style: TextButton.styleFrom(
//                               backgroundColor: customRedColor,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8))),
//                           onPressed: () async {
//                             Navigator.pop(context);
//                             if (team == null) {
//                               uiUtilities.actionAlertWidget(
//                                   context: context, alertType: 'error');
//                               uiUtilities.alertNotification(
//                                   context: context, message: 'Select a team');
//                             } else {
//                               BotToast.showLoading(
//                                   allowClick: false,
//                                   clickClose: false,
//                                   backButtonBehavior:
//                                       BackButtonBehavior.ignore);
//                               bool isUpdated =
//                                   await _userManager.updateUserTeam(team: team);
//                               BotToast.closeAllLoading();
//                               if (isUpdated) {
//                                 uiUtilities.actionAlertWidget(
//                                     context: context, alertType: 'success');
//                                 uiUtilities.alertNotification(
//                                     context: context,
//                                     message: _userManager.message);
//                               } else {
//                                 uiUtilities.actionAlertWidget(
//                                     context: context, alertType: 'error');
//                                 uiUtilities.alertNotification(
//                                     context: context,
//                                     message: _userManager.message);
//                               }
//                             }
//                           },
//                           child: Text(
//                             'Update team',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.white),
//                           ))
//                     ],
//                   ),
//                 ),
//               );
//             });
//       }
//     });
//   }

//   // void checkAuth() async {
//   //   final FirebaseAuth _auth = FirebaseAuth.instance;
//   //   _logger.d(await _auth.currentUser.getIdToken());
//   //   int userId = await _localStorage.getId();
//   //   _auth.userChanges().listen((user) {
//   //     print('user: $user');
//   //     if (user != null) {
//   //       getUserTeam();
//   //     } else {
//   //       Navigator.pushNamedAndRemoveUntil(
//   //           context, '/loginView', (route) => false);
//   //     }
//   //   });
//   // }

//   void confirmAuthStatus() async {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     _logger.d(await _auth.currentUser!.getIdToken());
//     // ignore: unused_local_variable
//     int userId = await _localStorage.getId();
//     _auth.userChanges().listen((user) {
//       if (user != null) {
//         getUserTeam();
//       } else {
//         _auth.signOut();
//         _localStorage.clearStorage();
//         Navigator.pushNamedAndRemoveUntil(
//             context, '/loginView', (route) => false);
//       }
//     });
//   }
// }
