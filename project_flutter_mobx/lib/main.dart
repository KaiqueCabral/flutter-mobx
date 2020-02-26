import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_flutter_mobx/stores/app.store.dart';
import 'package:project_flutter_mobx/views/signup.view.dart';

void main() => runApp(FlutterWithMobX());

class FlutterWithMobX extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>.value(value: AppStore()),
      ],
      child: MaterialApp(
        title: 'Flutter MobX - To Do List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignupView(),
      ),
    );
  }
}
