import 'dart:math';

import 'package:cubixd/cubixd.dart';
import 'package:flutter/material.dart';

import 'implictanimation.dart';

class CubeAnimation extends StatefulWidget {
  const CubeAnimation({super.key});

  @override
  State<CubeAnimation> createState() => _CubeAnimationState();
}

class _CubeAnimationState extends State<CubeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this ,duration: const Duration(microseconds: 400) );
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
       title: const Text('Cube Animation'),
        leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const ImplicitAnimations()));
          }, icon: const Icon(Icons.arrow_back))
      ),
      body: Center(
        child: AnimatedCubixD(
          size: 200,
          advancedXYposAnim :AnimRequirements(
              controller: _controller,
              xAnimation: Tween<double>(begin: -pi/2, end : pi *2 -pi/4).animate(_controller),
              yAnimation: Tween<double>(begin: pi/4, end : pi/4).animate(_controller)),
          stars: true,
          shadow: true,
          onSelected: (SelectedSide opt){
            switch (opt){
              case SelectedSide.back :
                return true;
              case SelectedSide.front:
                return true;
              case SelectedSide.right:
                return true;
              case SelectedSide.left:
                return true;
              case SelectedSide.top:
                return true;
              case SelectedSide.bottom:
                return true;
              case SelectedSide.none:
                return false;
              default:
                throw Exception("Unimplemented option");
            }
          },
          top: Container(
            color: Colors.purple ,
          ),
          bottom: Container(
            color: Colors.red ,
          ),
          front: Container(
            color: Colors.yellow ,
          ),
          back: Container(
            color: Colors.green,
          ),
          right: Container(
            color: Colors.pink,
          ),
          left: Container(
            color: Colors.cyanAccent ,
          ),),
      ),
    );
  }
}
