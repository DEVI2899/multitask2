import 'package:ecommerce_app/animationController/cubeanimation.dart';
import 'package:ecommerce_app/animationController/implictanimation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/themeprovider.dart';
import 'Tabbar.dart';



void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => themeProvider(),
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<themeProvider>(context).themeDataStyle ,
       // home: const ImplicitAnimations(),
        home:  const CubeAnimation(),
        debugShowCheckedModeBanner: false,

    );
  }
}


