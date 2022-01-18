import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class AppPreferences extends StatefulWidget {
  const AppPreferences({Key? key}) : super(key: key);

  @override
  _AppPreferencesState createState() => _AppPreferencesState();
}

class _AppPreferencesState extends State<AppPreferences> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'App Preferences',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: SettingsList(
        sections: [
          SettingsSection(
            // title: 'Section',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading:const Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                leading:const Icon(Icons.fingerprint),
                switchValue: true,
                onToggle: (bool value) {},
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
