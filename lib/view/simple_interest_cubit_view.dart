import 'package:class_assignment2/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatelessWidget {
  const SimpleInterestView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController principalController = TextEditingController();
    final TextEditingController rateController = TextEditingController();
    final TextEditingController timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Princy: Simple Interest'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: principalController,
              decoration: const InputDecoration(
                labelText: 'Principal',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: rateController,
              decoration: const InputDecoration(
                labelText: 'Rate of Interest (%)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: timeController,
              decoration: const InputDecoration(
                labelText: 'Time (Years)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final double principal =
                    double.tryParse(principalController.text) ?? 0.0;
                final double rate = double.tryParse(rateController.text) ?? 0.0;
                final double time = double.tryParse(timeController.text) ?? 0.0;
                context
                    .read<SimpleInterestCubit>()
                    .calculateInterest(principal, rate, time);
              },
              child: const Text('Calculate Interest'),
            ),
            const SizedBox(height: 16),
            BlocBuilder<SimpleInterestCubit, double>(
              builder: (context, interest) {
                return Text(
                  'Simple Interest: ${interest.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
