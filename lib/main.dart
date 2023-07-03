import 'package:fancy_dropdown/widgets/w_dropdown.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        title: 'Smooth expansion tile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DropdownApp(),
      );
}

class DropdownApp extends StatelessWidget {
  const DropdownApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: const Align(
            alignment: Alignment.center,
            child: WDropdown(),
          ),
        ),
      );
}
