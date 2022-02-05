import 'package:flutter/cupertino.dart';
import 'package:notse_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Go Shopping'),
    Task(name: 'buy a gift'),
    Task(name: 'repair the car'),
  ];

  void updateTask(Task task) {
    task.doneChanged();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void addTask(String textValue) {
    tasks.add(Task(name: textValue));
    notifyListeners();
  }
}
