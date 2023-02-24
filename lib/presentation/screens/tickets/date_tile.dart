import 'package:flutter/material.dart';
import 'package:movieflix/common/extensions/size_extensions.dart';
import 'package:movieflix/data/models/ticket_dates_model.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/styles.dart';

class DateTile extends StatelessWidget {
  TicketDatesModel ticketDate;
  DateTile({Key? key, required this.ticketDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ticketDate.isSelected? AppColors.blue : AppColors.smokeGrey,
        borderRadius: BorderRadius.circular(Sizes.dimen_12.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_20.w, vertical: Sizes.dimen_4.w),
      margin: EdgeInsets.only(right: Sizes.dimen_12.w, bottom: Sizes.dimen_6.w),
      child: Center(
        child: Text(
          ticketDate.date,
          style: AppStyles.regularTextStyle(
              color: AppColors.black,
              fontSize: Sizes.dimen_14
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
