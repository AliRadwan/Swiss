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


class ReminderState extends Equatable {
  final List<ReminderModel> reminderList;
  ReminderState(this.reminderList);

  @override
  // TODO: implement props
  List<Object?> get props => [reminderList];
}

class ReminderInitial extends ReminderState{
  ReminderInitial() : super(const [],);
}

class ReminderUpdate extends ReminderState{
  ReminderUpdate(super.reminderList);
}
