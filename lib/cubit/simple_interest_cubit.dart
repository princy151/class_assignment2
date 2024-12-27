import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestCubit extends Cubit<double> {
  SimpleInterestCubit() : super(0.0);

  void calculateInterest(double principal, double rate, double time) {
    if (principal < 0 || rate < 0 || time < 0) {
      emit(0.0); // Reset to 0 for invalid input
    } else {
      emit((principal * rate * time) / 100);
    }
  }
}
