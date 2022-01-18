// import 'package:flutter/material.dart';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:leja/main.dart';
// import 'package:leja/views/pages/expenses/budget_page.dart';
// import 'package:leja/views/pages/expenses/create_budge_page.dart';
// import 'package:leja/views/pages/expenses/daily_page.dart';
// import 'package:leja/views/pages/expenses/profile_page.dart';
// import 'package:leja/views/pages/expenses/stats_page.dart';

// class RootApp extends StatefulWidget {
//   const RootApp({Key? key}) : super(key: key);

//   @override
//   _RootAppState createState() => _RootAppState();
// }

// class _RootAppState extends State<RootApp> {
//   int pageIndex = 0;
//   List<Widget> pages = [
//     const DailyPage(),
//     const StatsPage(),
//     const BudgetPage(),
//     const ProfilePage(),
//     const CreatBudgetPage()
//   ];

//   @override
//   void initState() {
//     // ignore: todo
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: getBody(),
//         bottomNavigationBar: getFooter(),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             selectedTab(4);
//           },
//           child: const Icon(
//             Icons.add,
//             size: 25,
//           ),
//           // backgroundColor: Colors.pink
//           //params
//         ),
//         floatingActionButtonLocation:
//             FloatingActionButtonLocation.centerDocked);
//   }

//   Widget getBody() {
//     return IndexedStack(
//       index: pageIndex,
//       children: pages,
//     );
//   }

//   Widget getFooter() {
//     List<IconData> iconItems = [
//       Icons.calendar_today_sharp,
//       Icons.format_list_numbered_outlined,
//       Icons.wallet_travel,
//       Icons.person_off_sharp,
//     ];

//     return AnimatedBottomNavigationBar(
//       activeColor: bright == Brightness.light ? Colors.white : Colors.white,
//       splashColor: bright == Brightness.light ? Colors.white : Colors.white,
//       inactiveColor:
//           bright == Brightness.light ? Colors.white70 : Colors.white70,
//       backgroundColor:
//           bright == Brightness.light ? const Color(0xFFF687D4) : Colors.pink,
//       icons: iconItems,
//       activeIndex: pageIndex,
//       gapLocation: GapLocation.center,
//       notchSmoothness: NotchSmoothness.softEdge,
//       leftCornerRadius: 10,
//       iconSize: 25,
//       rightCornerRadius: 10,
//       onTap: (index) {
//         selectedTab(index);
//       },
//       //other params
//     );
//   }

//   selectedTab(index) {
//     setState(() {
//       pageIndex = index;
//     });
//   }
// }
