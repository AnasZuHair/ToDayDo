import 'package:flutter/material.dart';
import 'package:notse_app/models/task.dart';
import 'package:notse_app/models/task_data.dart';
import 'package:notse_app/screens/add_task_screen.dart';
import 'package:notse_app/widgets/tasks_lists.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowButtom(context);
        },
        backgroundColor: Colors.teal,
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.teal,
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          right: 20,
          left: 20,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.playlist_add_check,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'ToDayDo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${Provider.of<TaskData>(context).tasks.length} tasks',
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 2),
                          blurRadius: 10,
                          spreadRadius: 1)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                child: const TasksLists(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> ShowButtom(BuildContext context) {
    return showModalBottomSheet(
        barrierColor: Colors.teal[900]!.withOpacity(0.2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        isDismissible: false,
        enableDrag: false,
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen())));
  }
}
