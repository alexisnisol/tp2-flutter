import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:tp2/repository/settings_repository.dart';
import 'package:tp2/viewmodels/settingsviewmodels.dart';

import '../mytheme.dart';

class EcranSettings extends StatefulWidget{
  const EcranSettings({super.key});

  @override
  State<EcranSettings> createState() => _EcranSettingsState();
}
class _EcranSettingsState extends State<EcranSettings> {
  bool _dark =true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SettingsList(
        darkTheme: SettingsThemeData(
            settingsListBackground: MyTheme.dark().scaffoldBackgroundColor,
            settingsSectionBackground:
            MyTheme.dark().scaffoldBackgroundColor
        ),
        lightTheme: SettingsThemeData(
            settingsListBackground: MyTheme.light().scaffoldBackgroundColor,
            settingsSectionBackground:
            MyTheme.light().scaffoldBackgroundColor
        ),
        sections: [
          SettingsSection(
              title: const Text('Theme'),
              tiles: [
                SettingsTile.switchTile(
                  initialValue: context.watch<SettingsViewModel>().isDark,
                  onToggle: (bool value) {
                    context.read<SettingsViewModel>().isDark = value;
                  },
                  title: const Text('Dark mode'),
                  leading: const Icon(Icons.invert_colors),)
              ])
        ],
      ),
    );
  }
}