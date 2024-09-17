import 'package:flutter/material.dart';

import '../../model/todo_model.dart';
import 'widgets/fab.dart';
import 'widgets/listitem_decoration.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maktub'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: toDo.value.length,
        itemBuilder: (context, index) {
          final item = toDo.value[index];

          return ListItemDecoration(
            child: ValueListenableBuilder(
              valueListenable: toDo,
              builder: (context, value, _) {
                return ListTile(
                  leading: Checkbox(
                    value: item[0],
                    onChanged: (newValue) {
                      if (newValue != null) {
                        toDo.value[index][0] = newValue;
                        toDo.notifyListeners();
                      }
                    },
                  ),
                  title: Text(
                    item[1],
                    style: TextStyle(
                      decoration: item[0] ? TextDecoration.lineThrough : null,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: Fab(toDo: toDo),
    );
  }
}
