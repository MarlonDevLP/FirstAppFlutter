import 'package:flutter/material.dart';
import '../components/task.dart';


class TaskInherited  extends InheritedWidget {
   TaskInherited ({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
     Task('Estudar Flutter', 'assets/images/dash.png', 3),
     Task('Academia', 'assets/images/academia.jpg', 2),
     Task('Ler', 'assets/images/ler.jpeg', 1),
     Task('Meditar', 'assets/images/meditar.jpg', 4),
     Task('Jogar', 'assets/images/jogos.jpg', 1),
  ];

void newTask(String name, String photo, int difficulty){
  taskList.add(Task(name, photo, difficulty));
}

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No  found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
