import 'package:emulador_flutter/data/task_inherited.dart';
import 'package:emulador_flutter/screens/initial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
        primaryColorDark: Colors.black54,
        appBarTheme:const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme:  IconThemeData(color: Colors.white),
        )


          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),

        ),


        home: TaskInherited(child:  const InitialScreen(


        )),
    );
  }
}





