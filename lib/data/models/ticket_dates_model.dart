class TicketDatesModel {
  final String date;
  bool isSelected;

  TicketDatesModel({required this.date, this.isSelected = false});

  TicketDatesModel copyWith({String? date, bool? isSelected}) {
    return TicketDatesModel(
      date: date ?? this.date,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}