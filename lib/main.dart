import 'package:flutter/material.dart';
import 'package:newsapp/screens/card_details.dart';
import 'Layouts/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
    routes: {
        HomeLayout.routeName:(context) =>   HomeLayout(),
      CardDetails.routeName:(context) =>   CardDetails(),
    },
    );
  }
}

