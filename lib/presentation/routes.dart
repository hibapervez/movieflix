import 'package:flutter/material.dart';
import 'package:movieflix/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:movieflix/presentation/screens/movie_detail/movie_detail_arguments.dart';
import 'package:movieflix/presentation/screens/movie_detail/movie_detail_screen.dart';
import 'package:movieflix/presentation/screens/tickets/get_tickets_screen.dart';
import 'package:movieflix/presentation/screens/tickets/tickets_final_screen.dart';
import '../common/constants/route_constants.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
    RouteList.initial: (context) => DashboardScreen(),
    RouteList.movieDetail: (context) => MovieDetailScreen(
      movieDetailArguments: setting.arguments as MovieDetailArguments,
    ),
    RouteList.getTickets: (context) => GetTicketsScreen(
      movieDetailArguments: setting.arguments as MovieDetailArguments,
    ),
    RouteList.ticketsFinal: (context) => TicketsFinalScreen(
      movieDetailArguments: setting.arguments as MovieDetailArguments,
    ),
  };
}
