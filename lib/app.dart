import 'package:class_assignment2/cubit/area_of_circle_cubit.dart';
import 'package:class_assignment2/cubit/area_of_square_cubit.dart';
import 'package:class_assignment2/cubit/dashboard_cubit.dart';
import 'package:class_assignment2/cubit/simple_interest_cubit.dart';
import 'package:class_assignment2/view/dashboard_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AreaOfCircleCubit(),
        ),
        BlocProvider(
          create: (_) => SimpleInterestCubit(),
        ),
        BlocProvider(
          create: (_) => AreaOfSquareCubit(),
        ),
        BlocProvider(
          create: (context) => DashboardCubit(
            context.read<AreaOfCircleCubit>(),
            context.read<SimpleInterestCubit>(),
            context.read<AreaOfSquareCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Cubit Example',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const DashboardView(),
      ),
    );
  }
}
