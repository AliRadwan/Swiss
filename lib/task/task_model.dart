import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {

  final String id;
  final String title;
  final bool isCompleted;

  TaskModel copyWith({String? id, String? title, bool? isCompleted}) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  const TaskModel({required this.id, required this.title, required this.isCompleted});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, isCompleted];
}

class ReminderModel extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;



  const ReminderModel({required this.id, required this.title, required this.isCompleted});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, isCompleted];


  ReminderModel copyWith({String? id, String? title, bool? isCompleted}) {
    return ReminderModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

}