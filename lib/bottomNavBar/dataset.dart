import 'package:flutter/material.dart';

class dataset extends StatelessWidget {
  const dataset({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: RichText(

          overflow: TextOverflow.ellipsis,
          text:  const TextSpan(
              text: 'Rich Text', style: TextStyle(fontSize: 15, color:Colors.red),
              children: <InlineSpan>[
                WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: SizedBox(width: 10,)),
                TextSpan(text:'Flutter Development\n',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                TextSpan(text:'Firebase Development\n',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                TextSpan(text:'MvvM Development',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
              ]
          ),

        ),
      ),
    );
  }
}
