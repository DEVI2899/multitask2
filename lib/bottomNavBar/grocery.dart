import 'dart:math';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class grocery extends StatefulWidget {
   grocery({super.key});

  @override
  State<grocery> createState() => _groceryState();
}

class _groceryState extends State<grocery> {
  late   Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    //var platform = Theme.of(context).platform;
    return   GestureDetector(
        onPanUpdate: (details){
         if (kDebugMode) {
           print(details.delta);
         }
       setState(() {
        // _offset = Offset(
        //   _offset.dx +details.delta.dx,
        //   _offset.dy +details.delta.dy,
        //
        // );
        _offset += details.delta;
      });
        },
        child: Scaffold(
          body:  Transform(
          transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(_offset.dy * pi /180)
          ..rotateY(_offset.dx * pi /180),
            child: const Center(
              // child: Column(
              //   children: [
              //    if(PlatformDetails().isMobile)...[
              //      const Center(
              //        child: Text(
              //          'Mobile',
              //          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              //        ),
              //      )
              //    ] else if (PlatformDetails().isDesktop)
              //      const Center(
              //        child: Text('Desktop',
              //          style: TextStyle(fontSize: 74, fontWeight: FontWeight.bold),
              //        ),
              //
              //      )
              //
              //     else const Center(
              //        child: Text('Desktop',
              //          style: TextStyle(fontSize: 74, fontWeight: FontWeight.bold),
              //        ),
              //      ),
              //
              //   ],
              // ),
              child: Cube(),
            ),
          ),
        ),

    );
  }
}


class Cube extends StatelessWidget {
  const Cube({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Transform(
            transform: Matrix4.identity()
              ..translate(0.0, 100.0, 0.0)
              ..rotateX(pi/2),

            alignment: Alignment.center,
            child: Container(
                color: Colors.blue,
                child: const FlutterLogo(size: 200,))),
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0 ,0.0, -100.0),
          child: Container(
              color: Colors.red,
              child: const FlutterLogo(size: 200,)),
        ),
        Transform(
            transform: Matrix4.identity()
              ..translate(100.0, 0.0, 0.0)
              ..rotateY(pi/2),

            alignment: Alignment.center,
            child: Container(
                color: Colors.orange,
                child: const FlutterLogo(size: 200,))),

        Transform(
          transform: Matrix4.identity()
            ..translate(100.0,0.0 ,0.0 )
            ..rotateY(pi/2)
          ,
          child: Container(
              color: Colors.purple,
              child: const FlutterLogo(size: 200,)),
        ),

        Transform(
            transform: Matrix4.identity()
              ..translate(0.0, -100.0, 0.0)
              ..rotateX(pi/2),

            alignment: Alignment.center,
            child: Container(
                color: Colors.pink.withOpacity(0.8),
                child: const FlutterLogo(size: 200,))),

        // Transform(
        //     transform: Matrix4.identity()
        //       ..translate(0.0, -100.0, 0.0)
        //       ..rotateX(-pi/2),
        //
        //     alignment: Alignment.center,
        //     child: Container(
        //         color: Colors.black,
        //         child: const FlutterLogo(size: 200,))),


        // Transform(
        //     transform: Matrix4.identity()
        //       ..rotateY(-pi/2)
        //       ..translate(-100.0, 0.0, 0.0)  ,
        //
        //     alignment: Alignment.center,
        //     child: Container(
        //         color: Colors.purple,
        //         child: const FlutterLogo(size: 200,))),
        // ///Back
        // Transform(
        //   transform: Matrix4.identity()
        //     ..translate(0.0 ,0.0, 100.0),
        //   child: Container(
        //       color: Colors.blue,
        //       child: const FlutterLogo(size: 200,)),
        // ),
        //
        //
        // ///Top
        // Transform(
        //     transform: Matrix4.identity()
        //       ..rotateY(-pi/2)
        //       ..translate( 0.0,-100.0, 0.0)  ,
        //
        //     alignment: Alignment.center,
        //     child: Container(
        //         color: Colors.pink.withOpacity(0.8),
        //         height: 200,
        //         width: 200,
        //         child: const FlutterLogo(size: 200,))),





    ]
    );
  }
}
