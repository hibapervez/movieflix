import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/common/constants/string_constants.dart';
import 'package:movieflix/common/extensions/size_extensions.dart';
import 'package:movieflix/presentation/cubits/tickets/get_tickets_cubit.dart';
import 'package:movieflix/presentation/screens/tickets/date_tile.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/route_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/styles.dart';
import '../../../common/utils.dart';
import '../../../di/get_it.dart';
import '../../widgets/common_widgets.dart';
import '../movie_detail/movie_detail_arguments.dart';
import 'cinema_hall_tile.dart';

class GetTicketsScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const GetTicketsScreen({
    Key? key,
    required this.movieDetailArguments,
  }) : super(key: key);

  @override
  State<GetTicketsScreen> createState() => _GetTicketsScreenState();
}

class _GetTicketsScreenState extends State<GetTicketsScreen> {
  late GetTicketsCubit _getTicketsCubit;
  @override
  void initState() {
    super.initState();
    _getTicketsCubit = getItInstance<GetTicketsCubit>();
    List.generate(10, (index) => _getTicketsCubit.loadTicketDates('$index Mar'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getTicketsCubit,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0.5,
            title: Column(
              children: [
                Text(
                  widget.movieDetailArguments.title!,
                  style: AppStyles.regularTextStyle(
                      color: AppColors.black,
                      fontSize: Sizes.dimen_16
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: Sizes.dimen_1.h,),

                Text(
                  'In Theaters ${Utils.formatDate(widget.movieDetailArguments.releaseDate ?? '')}',
                  style: AppStyles.regularTextStyle(
                    color: AppColors.blue,
                    fontSize: Sizes.dimen_14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.back,
                color: AppColors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: Container(
              color: AppColors.lightGrey,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.dimen_16,
                vertical: Sizes.dimen_8,
              ),
              width: double.maxFinite,
              height: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Sizes.dimen_30.h,),

                    Text(
                      AppStrings.date,
                      style: AppStyles.semiBoldTextStyle(
                          color: AppColors.black,
                          fontSize: Sizes.dimen_16
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: Sizes.dimen_8.h,),

                    BlocBuilder<GetTicketsCubit, GetTicketsState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: Sizes.dimen_28.h,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              state.ticketDates.length,
                              (index) => GestureDetector(
                                onTap: () => context.read<GetTicketsCubit>().selectItem(index),
                                child: DateTile(ticketDate: state.ticketDates[index],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: Sizes.dimen_20.h,),

                    SizedBox(
                      height: Sizes.dimen_200.h,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(10, (index) => const CinemaHallTile(),
                        ),
                      ),
                    ),

                    buttonFilled(
                      text: AppStrings.selectSeats,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          RouteList.ticketsFinal,
                          arguments: widget.movieDetailArguments,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
