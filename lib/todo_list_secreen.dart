import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'task_model.dart';
import 'add_task_screen.dart';
import 'datebase_helpeer.dart';
import 'add_task_screen.dart';


class TodoListSecreen extends  StatefulWidget{
  @override
  _TodoListSecreenState createState() => _TodoListSecreenState();
}

class _TodoListSecreenState extends State<TodoListSecreen> {
 Future <List<Task>> _taskList;
@override
 void initState(){
   super.initState();
   _updateTaskList();

 }
 _updateTaskList(){
   setState(() {
        _taskList=DateabasHelper.instance.getTaskList();
      });
 }





  Widget _buildTask(Task task){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child:Card(
          margin:EdgeInsets.all(10),
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal:15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children:[
           Icon(
             Icons.delete,
             color: Colors.black,
             size: 30,

           ),
           Text(task.taskname),
            Checkbox(
             onChanged: (value){
               task.statue=value?1:0;
               DateabasHelper.instance.updatTaske(task);
              _updateTaskList();
                   
             },
             activeColor: Theme.of(context).primaryColor, 
             value: false, 
           ),
           
           
             
         ]
        ),
           
           

      ) ,));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
       length: 3,
      child: Scaffold(
         drawer: Drawer(child: Column(
            children: [
              Text('data1'),
              Text('data2'),
              Text('data3'),
            ],
          ),),
          appBar:AppBar(
            title:Text('Todo'),
            bottom:TabBar(
              tabs: [
                Tab(text:'All Tasks'),
                Tab(text:'Complete Tasks'),
                Tab(text:'InComplete Tasks'),

                
                ], isScrollable: true,)
            
            
          ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:Theme.of(context).primaryColor,
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (_)=> AddTaskScreen())),
        ),
        body: FutureBuilder(
          future:_taskList ,
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return Center(
                child:CircularProgressIndicator() ,);
            }

          return ListView.builder(
            itemCount:1 + snapshot.data.lenght,
            itemBuilder:(BuildContext context, int index){
              if(index == 0){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                  AllTasks(),
 ]


                );
              }
                 return _buildTask(snapshot.data[index - 1]);
            } ,
       
         );
        },
        ),
      ),
    );
  }
}
 class AllTasks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(),


    );
  }

   }
    

















 