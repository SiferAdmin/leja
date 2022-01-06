// import 'package:flutter/material.dart';
// import 'package:leja/views/pages/projects/account/account_view.dart';
// import 'package:leja/views/pages/projects/auth/organization_view.dart';
// import 'package:leja/views/pages/projects/inbox/create_inbox_view.dart';
// import 'package:leja/views/pages/projects/task/create_task_view.dart';

// import 'utils/ui_utils/custom_colors.dart';
// import 'views/pages/projects/dashboard/dashboard_view.dart';

// class Routes {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         const int currentIndex = 0;
//         return MaterialPageRoute(
//             builder: (_) => const DashboardView(currentIndex: currentIndex));
//       case '/createNewTaskView':
//         return MaterialPageRoute(builder: (_) => const CreateNewTaskView());
//       // case '/loginView':
//       //   return MaterialPageRoute(builder: (_) => LoginView());
//       case '/organizationView':
//         return MaterialPageRoute(builder: (_) => const OrganizationView());
//       case '/accountView':
//         return MaterialPageRoute(builder: (_) => const AccountView());
//       case '/createInboxView':
//         return MaterialPageRoute(
//             builder: (_) => const CreateInboxView(), fullscreenDialog: true);
//       default:
//         return MaterialPageRoute(
//             builder: (context) => Scaffold(
//                   appBar: AppBar(
//                     backgroundColor: customRedColor,
//                     iconTheme: const IconThemeData(color: Colors.white),
//                   ),
//                   body: Center(
//                       child: Text('No route defined for ${settings.name}')),
//                 ));
//     }
//   }
// }
