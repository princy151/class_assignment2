import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfSquareCubit extends Cubit<double> {
  AreaOfSquareCubit() : super(0.0);

  void calculateArea(double side) {
    if (side < 0) {
      emit(0.0); // Reset to 0 for invalid input
    } else {
      emit(side * side);
    }
  }
}
