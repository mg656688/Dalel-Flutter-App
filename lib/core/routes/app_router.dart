import 'package:dalel/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/forget_password.dart';
import 'package:dalel/features/auth/presentation/views/sign_in.dart';
import 'package:dalel/features/auth/presentation/views/sign_up.dart';
import 'package:dalel/features/home/data/models/egyption_wars_model.dart';
import 'package:dalel/features/home/data/models/historical_character_model.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/data/models/historical_places_model.dart';
import 'package:dalel/features/home/presentation/views/egyption_wars.details_view.dart';
import 'package:dalel/features/home/presentation/views/historical_character_details_view.dart';
import 'package:dalel/features/home/presentation/views/historical_periods_details_views.dart';
import 'package:dalel/features/home/presentation/views/historical_places_details_view.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/home/presentation/widgets/home_nav_bar_widget.dart';
import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
GoRoute(
  path: "/",
  builder: (context, state) => const SplashView(),
),
GoRoute(
  path: "/OnBoarding",
  builder: (context, state) => const OnBoardingView(),
),
GoRoute(
  path: "/signUp",
  builder: (context, state) =>  BlocProvider(
    create: (context) => AuthCubit(),
    child: const SignUpView(),
  ),
),
GoRoute(
  path: "/signIn",
  builder: (context, state) =>  BlocProvider(
    create: (context) => AuthCubit(),
    child: const SignInView(),
  ),
),
GoRoute(
  path: "/forgetPassword",
  builder: (context, state) =>  BlocProvider(
    create: (context) => AuthCubit(),
    child: const ForgetPasswordView(),
  ),
),
GoRoute(
  path: "/homeNavBar",
  builder: (context, state) =>  const HomeNavBarWidget(),
),
GoRoute(
  path: "/home",
  builder: (context, state) =>  const HomeView(),
),
GoRoute(
      path: "/historicalPeriodsDetailsView",
      builder: (context, state) => HistoricalPeriodsDetailsView(
          model: state.extra as HistoricalPeriodsModel),
    ),
    
    GoRoute(
      path: "/historicalCharactersDetailsView",
      builder: (context, state) => HistoricalCharactersDetailsView(
          charactersModel: state.extra as HistoricalCharactersModel),
    ),
     GoRoute(
      path: "/historicalPlacesDetailsView",
      builder: (context, state) => HistoricalPlacesDetailsView(
          placesModel: state.extra as HistoricalPlacesModel),
    ),
     GoRoute(
      path: "/egyptionWarsDetailsView",
      builder: (context, state) => EgyptionWarsDetailsView(
          warsModel: state.extra as EgyptionWarsModel),
    ),
  ],

);
