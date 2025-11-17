part of 'task_cubit.dart';

@immutable
sealed class TaskState extends Equatable {
  final List<TaskModel> taskList;

  const TaskState(this.taskList);

  @override
  List<Object?> get props => [taskList];
}

final class TaskInitial extends TaskState {
  TaskInitial() : super(const [],);
}

final class UpdateTask extends TaskState{
  UpdateTask(super.reminderList);
}
