// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/DB/DBhelper.dart';
import 'package:todo/MVC/controllers.dart';
import 'package:todo/MVC/models.dart';
import 'package:todo/MVC/views.dart';
import 'package:todo/main.dart';

import 'inputs.dart';

class Home extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: MyApp.isLight ? Colors.black87 : null,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      body: TodosList(controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           showModalBottomSheet(
              context: context,
              builder: (context) {
                return InputTask(controller);
              });
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Center(
          child: GestureDetector(
            onTap: () {
              Get.changeThemeMode(
                  MyApp.isLight ? ThemeMode.dark : ThemeMode.light);
              MyApp.isLight = !MyApp.isLight;
            },
            child: Container(
              child: const Text('Change theme'),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.01),
                  color: Theme.of(context).primaryColor),
              padding: EdgeInsets.all(size.width * 0.05),
            ),
          ),
        ),
      ),
    );
  }
}
