import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;

class xmlParse extends StatefulWidget {
  const xmlParse({super.key});

  @override
  State<xmlParse> createState() => _xmlParseState();
}

class _xmlParseState extends State<xmlParse> {
  //this displays listview data
  // This list will be displayed in the ListView
  List _employees = [];

  // This function will be triggered when the app starts
  void _loadData() async {
    final temporaryList = [];

    // in real life, this is usually fetched from an API or from an XML file
    // In this example, we use this XML document to simulate the API response
    const employeeXml = '''<?xml version="1.0"?>
    <employees>
      <employee>
        <name>Spiderman</name>
        <salary>5000</salary>
      </employee>
      <employee>
        <name>Dr. Strange</name>
        <salary>6000</salary>
      </employee>
      <employee>
        <name>Thanos</name>
        <salary>7000</salary>
      </employee>
      <employee>
        <name>Iron Man</name>
        <salary>8000</salary>
      </employee>
       <employee>
        <name>sandy</name>
        <salary>7000</salary>
      </employee>
      <employee>
        <name>priya</name>
        <salary>8000</salary>
      </employee>
    </employees>''';

    // Parse XML data
    final document = xml.XmlDocument.parse(employeeXml);
    final employeesNode = document.findElements('employees').first;
    final employees = employeesNode.findElements('employee');
    // loop through the document and extract values
    for (final employee in employees) {
      final name = employee.findElements('name').first.text;
      final salary = employee.findElements('salary').first.text;
      temporaryList.add({'name': name, 'salary': salary});
    }

    // Update the UI
    setState(() {
      _employees = temporaryList;
    });
  }

  // Call the _loadData() function when the app starts
  @override
  void initState() {
    super.initState();
    _loadData();
  }


  Future<void> getXmlData()async{
    String XmlString = DefaultAssetBundle.of(context).loadString('assets/data/employee.xml') as String;
    //final raw = xml.parse(XmlString);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Educative XML Answer')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        // list of employees
        child: ListView.builder(
          itemCount: _employees.length,
          itemBuilder: (context, index) => Card(
            key: ValueKey(_employees[index]['name']),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            color: Colors.amber.shade100,
            elevation: 4,
            child: ListTile(
              title: Text(_employees[index]['name']),
              subtitle: Text("Salary: \$${_employees[index]['salary']}"),
            ),
          ),

        ),
      ),
    );
  }
}