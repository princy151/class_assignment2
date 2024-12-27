import 'package:class_assignment2/cubit/area_of_circle_cubit.dart';
import 'package:class_assignment2/cubit/area_of_square_cubit.dart';
import 'package:class_assignment2/cubit/simple_interest_cubit.dart';
import 'package:class_assignment2/view/area_of_circle_cubit_view.dart';
import 'package:class_assignment2/view/area_of_square_cubit_view.dart';
import 'package:class_assignment2/view/simple_interest_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
    this._areaOfCircleCubit,
    this._simpleInterestCubit,
    this._areaOfSquareCubit,
  ) : super(null);

  final AreaOfCircleCubit _areaOfCircleCubit;
  final SimpleInterestCubit _simpleInterestCubit;
  final AreaOfSquareCubit _areaOfSquareCubit;

  void openAreaOfCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaOfCircleCubit,
          child: const AreaOfCircleView(),
        ),
      ),
    );
  }

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _simpleInterestCubit,
          child: const SimpleInterestView(),
        ),
      ),
    );
  }

  void openAreaOfSquareView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaOfSquareCubit,
          child: const AreaOfSquareView(),
        ),
      ),
    );
  }
}
