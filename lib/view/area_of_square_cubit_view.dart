import 'package:class_assignment2/cubit/area_of_square_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfSquareView extends StatelessWidget {
  const AreaOfSquareView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController sideController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Princy: Area of Square'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: sideController,
              decoration: const InputDecoration(
                labelText: 'Side Length',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final double side = double.tryParse(sideController.text) ?? 0.0;
                context.read<AreaOfSquareCubit>().calculateArea(side);
              },
              child: const Text('Calculate Area'),
            ),
            const SizedBox(height: 16),
            BlocBuilder<AreaOfSquareCubit, double>(
              builder: (context, area) {
                return Text(
                  'Area: ${area.toStringAsFixed(2)}',
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
