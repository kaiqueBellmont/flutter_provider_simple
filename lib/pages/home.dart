import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Step 3: Use the Consumer widget to access data
    return Consumer<CounterProvider>(
      builder: (context, counterProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Count:',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '${counterProvider.count}',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Step 4: Trigger state update
              counterProvider.increment();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
