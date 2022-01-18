import 'package:flutter/material.dart';
import 'package:leja/views/widgets/app_lock.dart';
import 'package:leja/views/widgets/badge.dart';
import 'package:leja/views/widgets/camera.dart';
import 'package:leja/views/widgets/date_time_picker.dart';
import 'package:leja/views/widgets/file_picker.dart';
import 'package:leja/views/widgets/flip_card.dart';
import 'package:leja/views/widgets/local_auth.dart';
import 'package:leja/views/widgets/pdf.dart';
import 'package:leja/views/widgets/storybook.dart';

class Stem extends StatelessWidget {
  const Stem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AppLock(),
                  ),
                );
              },
              child: const Text('App Lock')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BadgeWidget(),
                  ),
                );
              },
              child: const Text('Badge')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CameraExampleHome(),
                  ),
                );
              },
              child: const Text('Camera Example')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DateTimePickerWidget(),
                  ),
                );
              },
              child: const Text('Date Time')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FilePicker(),
                  ),
                );
              },
              child: const Text('File picker')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FlipCardWidget(),
                  ),
                );
              },
              child: const Text('FlipCard')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LocalAuth(),
                  ),
                );
              },
              child: const Text('Local Auth')),
          ElevatedButton(
              onPressed: () {
                pdf();
              },
              child: const Text('PDF')),
          ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => Spacer(),
                //   ),
                // );
              },
              child: const Text('Permission')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StoryBook(),
                  ),
                );
              },
              child: const Text('StoryBook')),
        ],
      ),
    ));
  }
}
