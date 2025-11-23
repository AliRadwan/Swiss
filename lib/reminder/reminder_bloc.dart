import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo/task/task_model.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc() : super(ReminderInitial([])) {
    on<ReminderEvent>((event, emit) {
      on<AddReminderEvent>((event, emit) {
          emit(ReminderUpdate(List.from(state.reminderList)..add(event.reminder)));
      });
    });

    on<RemoveReminderEvent>((event, emit) {
      final List<ReminderModel> updatedList = state.reminderList.where((reminder) => reminder.id != event.id).toList();
      emit(ReminderUpdate(updatedList));
    });
    on<ToggleReminderEvent>((event, emit) {
      final List<ReminderModel> updatedList = state.reminderList.map((reminder) {
        if (reminder.id == event.id) {
          return reminder.copyWith(isCompleted: !reminder.isCompleted);
        }
        return reminder;
      }).toList();
      emit(ReminderUpdate(updatedList));
    });
  }
}
