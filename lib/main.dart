import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/ui/home.dart';
import 'package:tp2/ui/mytheme.dart';
import 'package:tp2/viewmodels/settingsviewmodels.dart';
import 'package:tp2/viewmodels/taskviewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*final theme = MyTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TD2',
      theme: theme,
      home: Home(),
    );
     */
    return MultiProvider(providers: [

      ChangeNotifierProvider(create:
        (context) => SettingsViewModel()
      ),

      ChangeNotifierProvider(create:
        (context) {
          TaskViewModel taskViewModel = TaskViewModel();
          taskViewModel.generateTasks();
          return taskViewModel;
        }
      ),
    ],
      child: Consumer<SettingsViewModel>(
          builder: (context, SettingsViewModel notifier, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'TD2',
              theme: notifier.isDark ? MyTheme.dark() : MyTheme.light(),
              home: Home(),
            );
          }
      ),
    );
  }
}