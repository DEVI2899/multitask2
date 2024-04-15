import 'package:flutter/material.dart';

class add_details extends StatefulWidget {
  const add_details({super.key});

  @override
  State<add_details> createState() => _add_detailsState();
}

class _add_detailsState extends State<add_details> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Table(
            defaultColumnWidth: FixedColumnWidth(135.0),
            border: TableBorder.all(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
                style: BorderStyle.solid
            ),
            children: const [
             TableRow(
               children: [
                 Column(children:[Text('Flutter', style: TextStyle(fontSize: 20.0))]),
                 Column(children:[Text('Dart', style: TextStyle(fontSize: 20.0))]),
                 Column(children:[Text('Firebase Sdk', style: TextStyle(fontSize: 20.0))]),
               ]
             ),
              TableRow(
                  children: [
                    Column(children:[Text('Flutter', style: TextStyle(fontSize: 20.0))]),
                    Column(children:[Text('Dart', style: TextStyle(fontSize: 20.0))]),
                    Column(children:[Text('Firebase Sdk', style: TextStyle(fontSize: 20.0))]),
                  ]
              ),
              TableRow(
                  children: [
                    Column(children:[Text('Flutter', style: TextStyle(fontSize: 20.0))]),
                    Column(children:[Text('Dart', style: TextStyle(fontSize: 20.0))]),
                    Column(children:[Text('Firebase Sdk', style: TextStyle(fontSize: 20.0))]),
                  ]
              )
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(thickness: 3,),
          const SizedBox(height: 10,),
          Row(
            children: [
              DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('ID',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  ),),
                    DataColumn(label: Text(
                        'Name',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    )),
                    DataColumn(label: Text(
                        'Profession',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    )),
                  ],
                  rows: const [
                    DataRow(
                        cells: [
                          DataCell(Text('1')),
                          DataCell(Text('Stephen')),
                          DataCell(Text('Actor')),
                        ]

                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('2')),
                          DataCell(Text('deepali')),
                          DataCell(Text('Actor')),
                        ]

                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('3')),
                          DataCell(Text('deekshith')),
                          DataCell(Text('Actor')),
                        ]

                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('4')),
                          DataCell(Text('devika')),
                          DataCell(Text('Modeling')),
                        ]

                    )
                  ]
              )
            ],
          )
        ],

      ),
    );
  }
}