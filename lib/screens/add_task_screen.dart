import 'package:flutter/material.dart';
import 'package:notse_app/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String? textTitle;
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            'Add Task',
            style: TextStyle(
              color: Colors.teal[900],
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              textTitle = newText;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.teal[400],
                borderRadius: BorderRadius.circular(15)),
            child: TextButton(
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(textTitle!);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
