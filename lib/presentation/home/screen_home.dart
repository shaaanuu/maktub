import 'package:flutter/material.dart';
import 'package:to_do_app/infrastructure/tasks/tasks.dart';
import 'package:to_do_app/presentation/common_widgets/icn_btn.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('To-Do')),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: tasks.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: AnimatedContainer(
            duration: const Duration(microseconds: 700),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.black,
                value: tasks[index][0],
                onChanged: (isCheck) {
                  setState(() {
                    tasks[index][0] = isCheck;
                  });
                },
              ),
              title: Text(
                tasks[index][1],
                style: TextStyle(
                  color: Colors.black,
                  decoration: tasks[index][0] == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: IcnBtn(
                icn: Icons.delete_outline,
                clr: Colors.black,
                onTap: () {
                  setState(() {
                    tasks.removeAt(index);
                  });
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: _fab(context, size),
    );
  }

  FloatingActionButton _fab(BuildContext context, Size size) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: size.width - 40,
              height: size.height * .24,
              color: Colors.white60,
              child: Column(
                children: [
                  TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'New task',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    maxLength: 50,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          textEditingController.clear();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (textEditingController.text != '') {
                            setState(() {
                              tasks.add([false, textEditingController.text]);
                            });
                          }

                          textEditingController.clear();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
