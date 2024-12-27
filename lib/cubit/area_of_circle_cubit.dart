import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfCircleCubit extends Cubit<double> {
  AreaOfCircleCubit() : super(0.0);

  void calculateArea(double radius) {
    if (radius < 0) {
      emit(0.0); // Reset to 0 for invalid input
    } else {
      emit(3.14159 * radius * radius);
    }
  }
}
