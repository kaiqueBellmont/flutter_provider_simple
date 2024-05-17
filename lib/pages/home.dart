import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 50,
              color: Colors.transparent,
              // i need this bottom bar more bauty
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      Navigator.pushNamed(context, '/example');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      Navigator.pushNamed(context, '/example');
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
