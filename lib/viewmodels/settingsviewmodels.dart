import 'package:flutter/material.dart';
import 'package:tp2/repository/settings_repository.dart';

class SettingsViewModel extends ChangeNotifier {
  //Liste toutes les données qui sont susceptibles de faire changer l'état de l'application
  //ChangeNotifier est une classe qui permet de notifier les widgets qui l'écoute

  late bool _isDark;

  late SettingsRepository _settingsRepository;
  bool get isDark => _isDark;

  SettingsViewModel() {
    _settingsRepository = SettingsRepository();
    _isDark = false;
    getSettings();
  }

  void getSettings() async {
    _isDark = await _settingsRepository.getSettings();
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    _settingsRepository.saveSettings(value);
    notifyListeners();
  }
}