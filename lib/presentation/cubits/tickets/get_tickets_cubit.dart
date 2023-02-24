import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movieflix/data/models/ticket_dates_model.dart';

part 'get_tickets_state.dart';

class GetTicketsCubit extends Cubit<GetTicketsState> {
  GetTicketsCubit() : super(const GetTicketsInitial(ticketDates: []));

  void loadTicketDates(String title) {
    final newItem = TicketDatesModel(isSelected: false, date: title);
    final updatedItems = List.of(state.ticketDates)..add(newItem);
    emit(state.copyWith(items: updatedItems));
  }

  void selectItem(int index) {
    final updatedItems = List.of(state.ticketDates);
    final item = state.ticketDates[index];
    for (int i = 0; i < updatedItems.length; i++) {
      updatedItems[i] = updatedItems[i].copyWith(isSelected: false);
    }
    updatedItems[index] = item.copyWith(isSelected: true);
    emit(state.copyWith(items: updatedItems));
  }
}
