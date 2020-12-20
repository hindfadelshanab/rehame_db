import 'datebase_helpeer.dart';
class Task {
		int id;
		String taskname;
		int statue;
    bool iscomplete;
  
		Task({this.taskname,this.statue,this.iscomplete} );
		Task.withId({this.id, this.taskname, this.statue,this.iscomplete});
   

		// Convert a Note object into a Map object
		Map<String, dynamic> toMap() {
	

			var map = Map<String, dynamic>();
			if (id != null) {
				map['id'] = id;
			}
			map['taskname'] = taskname;
			map['statue'] = statue;
      map['iscomplete'] = statue;
	

			return map;
		}
	

		// Extract a Note object from a Map object
		factory Task.formMap(Map<String, dynamic> map) {
      return Task.withId(
			id : map['id'],
			taskname : map['taskname'],
			statue : map['statue'],
      iscomplete : map['iscomplete'],
      );
		}
	}