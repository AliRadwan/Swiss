part of 'reminder_bloc.dart';

@immutable
sealed class ReminderState extends Equatable{
  final List<ReminderModel> reminderList;

  ReminderState(this.reminderList);

  @override
  List<Object?> get props => [reminderList];
}

final class ReminderInitial extends ReminderState {
  ReminderInitial(super.reminderList);
}

class ReminderUpdate extends ReminderState{
  ReminderUpdate(super.reminderList);
}
