import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/counter_provider.dart';
import 'package:flutter_provider/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CounterProvider, UserProvider>(
      builder: (context, counterProvider, userProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            actions: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  userProvider.selectedUser?.username ?? 'No user selected',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.supervised_user_circle),
              onPressed: () {},
            ),
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
              counterProvider.increment();
            },
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 50,
              color: Colors.transparent,
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
                      Navigator.pushNamed(
                          context, '/userSelection'); // Navegar para a tela de seleção de usuários
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
