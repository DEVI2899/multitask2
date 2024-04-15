import 'package:flutter/material.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sample AlertDialog'),
      icon: const Icon(Icons.person),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text('Cancel')),
        ElevatedButton(onPressed: (){}, child: const Text('Confirm')),
      ],

      content: const Row(
        children: [
          Icon(Icons.person),
          FlutterLogo(size: 25,)

        ],
      ),
    );
  }
}
