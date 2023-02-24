part of 'get_tickets_cubit.dart';

class GetTicketsState extends Equatable {
  final List<TicketDatesModel> ticketDates;

  const GetTicketsState({required this.ticketDates});

  @override
  List<Object> get props => [ticketDates];

  GetTicketsState copyWith({List<TicketDatesModel>? items}) {
    return GetTicketsState(ticketDates: items ?? ticketDates);
  }
}

class GetTicketsChanged extends GetTicketsState {
  final List<TicketDatesModel> dates;

  const GetTicketsChanged({required this.dates})
      : super(ticketDates: dates);

  @override
  List<Object> get props => [dates];
}

class GetTicketsInitial extends GetTicketsState {
  const GetTicketsInitial({required super.ticketDates});
}
