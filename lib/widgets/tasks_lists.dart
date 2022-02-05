import 'package:flutter/material.dart';
import 'package:notse_app/models/task_data.dart';
import 'package:notse_app/widgets/tasks_tiles.dart';
import 'package:provider/provider.dart';

class TasksLists extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TasksLists();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemCount: taskdata.tasks.length,
          itemBuilder: (context, index) => TasksTiles(
            isCheked: taskdata.tasks[index].isDone,
            text: taskdata.tasks[index].name,
            checkboxChange: (vlaue) {
              taskdata.updateTask(taskdata.tasks[index]);
            },
            listTileDelete: () {
              taskdata.deleteTask(taskdata.tasks[index]);
            },
          ),
        );
      },
    );
  }
}
