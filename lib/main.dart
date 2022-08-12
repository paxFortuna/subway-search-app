import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subway_info/view_model/subway_view_model.dart';

import 'screens/subway_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) => SubwayInfoViewModel(),
      child: const SubwayInfoScreen(),),
    );
  }
}
