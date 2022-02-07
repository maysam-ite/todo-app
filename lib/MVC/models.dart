
class TaskModel {
  final int id ;
  final String title;
  final DateTime dateTime;

  TaskModel({required this.id,required this.title,required this.dateTime,});

  factory TaskModel.map(Map<String,dynamic> m) =>
      TaskModel(
          id: m['id'] ?? -1,
          title: m['title'] ?? 'title',

          dateTime: DateTime.parse(m['dateTime']??DateTime.now().toString()) ,

      );

  @override
  String toString() {
    return 'TaskModel{id: $id, title: $title, dateTime: $dateTime}';
  }

  Map<String, dynamic> toMap() =>{
    "title":title,
    "dateTime":dateTime.toString(),
  };


}