part of 'reminder_bloc.dart';

@immutable
sealed class ReminderEvent {
}


class AddReminderEvent extends ReminderEvent {
  final ReminderModel reminder;

  AddReminderEvent(this.reminder);
}

class RemoveReminderEvent extends ReminderEvent {
  final String id;
  RemoveReminderEvent(this.id);
}

class ToggleReminderEvent extends ReminderEvent {
  final String id;
  ToggleReminderEvent(this.id);

}
