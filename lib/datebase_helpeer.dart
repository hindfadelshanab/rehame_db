import 'dart:io';
import 'package:sqflite/sqflite.dart'; 
import 'task_model.dart';
import 'package:path/path.dart';
import "package:path_provider/path_provider.dart";


class DateabasHelper{
  static final DateabasHelper instance = DateabasHelper._instance();
  static Database _db;

  DateabasHelper._instance();

 static final String databaseName='todo_list.db';
 static final String taskeTabel='tasks';
 static final String taskIdColumnName='id';
 static final String taskNameColumnName='taskname';
  static final String taskstatueColumnName='statue';
 static final String taskIsCompleteColumnName='isComplete';


 Future<Database> initDatabase() async {
    if(_db == null){
       _db= await _inittab();
    }
      return _db;
    }
    Future<Database> _inittab()async{
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path+'todo_list.db';
    }
    void _createDb(Database db ,int version) async{
       await db.execute('''CREATE TABLE  $taskeTabel(
          $taskIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
          $taskNameColumnName TEXT NOT NULL,
          $taskIsCompleteColumnName INTEGER
        )''');
       }
       Future<List<Map<String,dynamic>>> getTaskMapLis() async{
       Database db = await initDatabase();
       final List<Map<String,dynamic>> result = await db.query(taskeTabel);
       return result;

     }
     Future<List<Task>> getTaskList()async{
       final List<Map<String, dynamic>> taskMapList= await getTaskMapLis();
       final List<Task> taskList=[];
       taskMapList.forEach((taskMap){
        taskList.add(Task.formMap(taskMap));
       });
       return taskList;
     }
     Future <int> insertTaske(Task task) async {
       Database db = await initDatabase();
       final int result = await db.insert(taskeTabel,task.toMap());
       return result;

     }
     Future <int> updatTaske(Task task) async {
       Database db = await initDatabase();
       final int result = await db.update(taskIsCompleteColumnName,task.toMap(),
        where: '$taskIdColumnName=?',
         whereArgs: [task.id],);

       return result;

     }

      Future <int> deletTaske(Task task) async {
       Database db = await initDatabase();
       final int result = await db.delete(taskeTabel,
        where: '$taskIdColumnName=?',
         whereArgs: [task.id],);

       return result;

     }

     
  }
