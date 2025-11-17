import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());


  addTask(TaskModel task){
    emit(UpdateTask([... state.taskList,task]));
  }
  addTaskByTitle( String title){
    final newTask = TaskModel(id: const Uuid().v4(), title: title, isCompleted: false);
    if (kDebugMode) {
      print(state.taskList);
    }
    emit(UpdateTask([... state.taskList,newTask]));
    if (kDebugMode) {
      print(state.taskList);
    }
  }
  removeTask(String id){
    final List<TaskModel> updatedList = state.taskList.where((task) => task.id != id).toList();
    emit(UpdateTask(updatedList));
  }
  tpggleTask(String id){
    final List<TaskModel> updatedList = state.taskList.map((task) {
      if (task.id == id) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();
    emit(UpdateTask(updatedList));
  }
}

class Remindercubit extends Cubit<ReminderState>{
  Remindercubit() : super(ReminderInitial());

  addReminder(ReminderModel reminder){
    emit(ReminderUpdate(List.from(state.reminderList)..add(reminder)));
  }

  removeReminder(int id){
    final List<ReminderModel> upfateList = state.reminderList.where((reminder)=> reminder.id != id).toList();
    emit(ReminderState(upfateList));
  }

  toggleReminder(int id ){
    final List<ReminderModel> updateList = state.reminderList.map((reminder){
      if (reminder.id == id ){
        return reminder.copyWith(isCompleted:!reminder.isCompleted);
      }
      return reminder;
    }).toList();
    emit(ReminderUpdate(updateList));
  }


}

