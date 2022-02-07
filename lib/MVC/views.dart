
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/MVC/models.dart';
import 'controllers.dart';

class TodosList extends StatelessWidget {
  final TaskController controller ;

  TodosList(this.controller);

  @override
  Widget build(BuildContext context) {
    TaskWidget.controller = controller;
    return GetBuilder<TaskController>(
      init: controller,
      builder: (_){
        return ListView.builder(
          itemCount: _.todos.length,
          itemBuilder: (context,i){
            return TaskWidget(_.todos[i]);
          },
        );
      },
    );
  }
}

class TaskWidget extends StatelessWidget {
  final TaskModel model ;
  static TaskController? controller ;

  TaskWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(model.title),
        subtitle: Text(model.dateTime.toString()),
        leading: const Icon(Icons.text_snippet),
        trailing: IconButton(
          onPressed:() {
            controller!.remove(model);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${model.title} deleted!'),
              duration: const Duration(milliseconds: 800),
              ),
            );
          },
          icon:const Icon(CupertinoIcons.delete,),
        ),
      ),
    );
  }
}


