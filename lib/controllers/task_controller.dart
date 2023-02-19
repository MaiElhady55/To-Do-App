import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/db/db_helper.dart';
import 'package:todo_app/models/task.dart';

class TaskController extends GetxController {
  final RxList<Task> taskList = <Task>[].obs;

  // add data to table
  //second brackets means they are named optional
  Future<int> addTask({Task? task}) {
    return DBHelper.insert(task);
  }

  // get all the data from table
  Future<void> getTasks() async {
    final List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  // delete data from table
  void deleteTasks(Task task) async {
    await DBHelper.delete(task);
    getTasks();
  }
  void deleteAllTasks() async {
    await DBHelper.deleteAll();
    getTasks();
  }

  // update data int table
  //Update data from DataBase
  //update iscomleted depened on id to make TO DO or Completed
  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }
}


