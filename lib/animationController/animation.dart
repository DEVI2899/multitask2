

import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  const Animations({super.key});

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations>{
  String message = 'New';
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:  Column(
          children: [
            // Center(
            //   child: CustomButton(
            //     onPressed: (){},
            //     text: 'center button',
            //
            //   )),
            Container(
              height: 60,
              color: Colors.orangeAccent,
              child: Center(
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(child: NotificationListener<ScrollNotification>(
               onNotification: (scrollNotification) {
                 if(ScrollNotification is ScrollStartNotification){
                   setState(() {
                     message = 'Scroll Started';
                   });
                 } else if (scrollNotification is ScrollUpdateNotification) {
                   setState(() {
                     message = 'Scroll Updated';
                   });
                 } else if (scrollNotification is ScrollEndNotification) {
                   setState(() {
                     message = 'Scroll Ended';
                   });
                 }
                 return true;
               },

              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item: $index'),
                    );
                  }),
             )
             )
      
          ],
        ),
      ),
    );
  }

}


class CustomButton extends StatelessWidget {
  final  String text;
  final  Function onPressed ;
  final backgroundcolor;
  const CustomButton( {super.key, required this.text, required this.onPressed, this.backgroundcolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 100,
        width: 100,
        color: Colors.red,
        child: const Text('Testing'),
      ),
    );
  }
}
