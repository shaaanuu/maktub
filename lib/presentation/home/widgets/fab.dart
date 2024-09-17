import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  final ValueNotifier<List<List>> toDo;

  const Fab({Key? key, required this.toDo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        _showAddItemDialog(context);
      },
    );
  }

  void _showAddItemDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Item'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter a task'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  toDo.value.add([false, controller.text]);
                  toDo.notifyListeners();
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
