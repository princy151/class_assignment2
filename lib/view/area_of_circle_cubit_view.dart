import 'package:class_assignment2/cubit/area_of_circle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfCircleView extends StatelessWidget {
  const AreaOfCircleView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Princy: Area of Circle'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: radiusController,
              decoration: const InputDecoration(
                labelText: 'Radius',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final double radius =
                    double.tryParse(radiusController.text) ?? 0.0;
                context.read<AreaOfCircleCubit>().calculateArea(radius);
              },
              child: const Text('Calculate Area'),
            ),
            const SizedBox(height: 16),
            BlocBuilder<AreaOfCircleCubit, double>(
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