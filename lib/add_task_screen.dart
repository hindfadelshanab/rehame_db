import 'package:flutter/material.dart';
import 'todo_list_secreen.dart';
import 'task_model.dart';

class AddTaskScreen extends StatefulWidget{

   final Task task;
   AddTaskScreen({this.task});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>() ;
   bool iscomplete=false;
  String taskName;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     appBar:AppBar(
       title:Text('New Task'),
     ),
     body: Form(
       key: _formKey ,  
       child:Column(

         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Padding(
             padding: const EdgeInsets.all(20),
             child: TextFormField(
               decoration:InputDecoration(
                 border: OutlineInputBorder(
                   borderRadius:BorderRadius.circular(20)
                 )
               ),
               validator:(input) => input.trim().isEmpty?'ples':null,
               onSaved: (input) => taskName=input,
               initialValue: taskName,

               
             ),
           ),
           Checkbox(value: iscomplete,
            onChanged: (value){
              setState(() {
                iscomplete=value;
                
              });
            }),
            RaisedButton(
              child: Text('Add New Task'),
              onPressed: (){
 
              })
         ],
       )
     
     ),
   );
  }
}