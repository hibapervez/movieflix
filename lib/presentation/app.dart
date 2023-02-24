import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/presentation/routes.dart';
import 'package:movieflix/presentation/screens/loading/loading_screen.dart';
import '../common/constants/route_constants.dart';
import '../common/screenutil/screenutil.dart';
import 'cubits/loading/loading_cubit.dart';
import 'fade_page_route_builder.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider(
      create: (_) => LoadingCubit(),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Movieflix',
        builder: (context, child) {
          return LoadingScreen(
            screen: child!,
          );
        },
        initialRoute: RouteList.initial,
        onGenerateRoute: (RouteSettings settings) {
          final routes = Routes.getRoutes(settings);
          final WidgetBuilder? builder = routes[settings.name];
          return FadePageRouteBuilder(
            builder: builder!,
            settings: settings,
          );
        },
      ),
    );
  }
}
