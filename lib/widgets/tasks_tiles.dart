import 'package:flutter/material.dart';

class TasksTiles extends StatelessWidget {
  const TasksTiles({
    Key? key,
    required this.isCheked,
    required this.text,
    required this.checkboxChange,
    required this.listTileDelete,
  }) : super(key: key);

  final bool isCheked;
  final String text;
  final Function(bool?) checkboxChange;
  final Function listTileDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isCheked ? 20 : 10),
      child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: isCheked ? Colors.teal[100]! : Colors.white,
              offset: const Offset(0, 2),
            ),
          ], borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(
                  decoration: isCheked ? TextDecoration.lineThrough : null,
                  color: isCheked ? Colors.teal : Colors.black,
                  fontSize: isCheked ? 15 : 20,
                  fontWeight: isCheked ? FontWeight.w600 : FontWeight.w700),
            ),
            trailing: Checkbox(
              activeColor: Colors.teal,
              value: isCheked,
              onChanged: (value) => checkboxChange(value!),
            ),
            onLongPress: () {
              listTileDelete();
            },
          )),
    );
  }
}



// class TaskCheckbox extends StatelessWidget {
//   final bool? isCheked;
//   final Function(bool) onChanged;
//   const TaskCheckbox({
//     required this.isCheked,
//     required this.onChanged,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//         activeColor: Colors.teal,
//         value: isCheked,
//         onChanged: (value) => onChanged(value!));
//   }
// }
