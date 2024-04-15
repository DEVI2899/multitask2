import 'dart:math';

import 'package:ecommerce_app/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  double _width = 100;
  double _height = 100;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  AnimationController? controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImplicitAnimations'),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedContainer(
                transform: Matrix4.identity(),
                duration: const Duration(
                  seconds: 5,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(isExpanded ? 40 : 10),
                  color: isExpanded ? Colors.yellow : Colors.red,

                ),
                curve: Curves.bounceOut,
                height: isExpanded ? 300 : 150,
                width: isExpanded ? 300 : 150,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              setState(() {
                // Create a random number generator.
                final random = Random();

                // Generate a random width and height.
                _width = random.nextInt(300).toDouble();
                _height = random.nextInt(300).toDouble();

                // Generate a random color.
                _color = Color.fromRGBO(
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                  5,
                );

                // Generate a random border radius.
                _borderRadius =
                    BorderRadius.circular(random.nextInt(100).toDouble());
              });
            },
            child: InkWell(
              child: AnimatedContainer(
                // Use the properties stored in the State class.
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                // Define how long the animation should take.
                duration: const Duration(seconds: 1),
                // Provide an optional curve to make the animation feel smoother.
                curve: Curves.easeInCirc,
                child: FlutterLogo(size: _width,),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.circular(10)
              )
              ),
                onPressed: (){
              showDialog(context: context,
                  builder: (context) => const AddDialog());
            }, child: const Text('Alert Dialog', style: TextStyle(
              color: Colors.white
            ),)),


        ],
      ),
    );
  }


}
