// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo/MVC/controllers.dart';
import 'package:todo/MVC/models.dart';

import '../main.dart';


class InputTask extends StatelessWidget {
  final TaskController controller;
  static final TextEditingController textController = TextEditingController();
  static DateTime? _dateTime ;

  InputTask(this.controller);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).cardColor,
      padding: EdgeInsets.all(size.width * 0.025),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: 'Task title',
                  ),
                ),

              ),
              IconButton(
                icon: Icon(Icons.date_range_outlined),
                onPressed: () async {
                    DateTime initialDate = DateTime.now();
                    var date = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: DateTime(initialDate.year),
                      lastDate: DateTime(initialDate.year + 3),
                    );

                  if(date == null)
                    return;

                  var initialTime = TimeOfDay.now();
                  var time = await showTimePicker(context: context, initialTime: initialTime);


                  if(date != null && time != null ){
                    _dateTime = DateTime(date.year,date.month,date.day,time.hour,time.minute);


                  }
                    print(_dateTime);


                  },


              ),
            ],
          ),
          Container(
            height: size.height *0.15,
            child: Row(
              children: [
                TaskButton(content: 'Submit',color: Theme.of(context).primaryColor,
                  onTab:(){
                  if(_dateTime != null && textController.text.isNotEmpty){
                    String title = textController.text;
                    textController.text = '';
                    DateTime dt = _dateTime!;
                    _dateTime = null;
                    controller.add(TaskModel(
                      title: title,
                      dateTime: dt,
                      id:-1,
                    ));

                  }
                  Navigator.pop(context);
                  } ,
                ),
                TaskButton(content: 'Cancel',color: Colors.red,
                  onTab:(){
                    textController.text = '';
                    _dateTime = null;
                    Navigator.pop(context);
                  } ,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TaskButton extends StatelessWidget {
  final String content;
  final Color color;
  final GestureTapCallback onTab;


  TaskButton({required this.content,required  this.color,required  this.onTab});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.all(size.width*0.05),
          margin:EdgeInsets.all(size.width*0.025),
          width: double.infinity,
          height:  double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size.width*0.05)
          ),
          
          child: FittedBox(
            child: Text(content,style: TextStyle(
              color: Colors.white
            ),),
          ),
        ),
        onTap: onTab,
      ),
    );
  }
}
