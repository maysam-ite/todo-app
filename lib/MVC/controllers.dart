
import 'package:get/get.dart';
import 'package:todo/DB/DBhelper.dart';
import 'package:todo/MVC/models.dart';
import 'package:todo/main.dart';

class TaskController extends GetxController{
  List<TaskModel> todos = [];


  @override
  void onInit() async {
    todos = await DBHelper().getTasks();
    update();
  }



  void add(TaskModel model) async{
    await DBHelper().insertTask(model);
    todos = await DBHelper().getTasks();
  //  await addNotification(todos[todos.length-1]);
    update();
  }

  void remove(TaskModel x)async{
    await DBHelper().deleteTask(x.id);
    todos = await DBHelper().getTasks();
   // await removeNotification(x.id);
    update();
  }

}

