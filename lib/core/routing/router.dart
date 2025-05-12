import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sott_examen/core/routing/routes.dart';
import 'package:sott_examen/features/home/managers/home_bloc.dart';
import 'package:sott_examen/features/home/pages/home_view.dart';


final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => BlocProvider(
          create: (context) => HomeBloc(repo: context.read()),
          child: HomeView(),
        )
    ),
  ],
);