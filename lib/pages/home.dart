import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/counter_provider.dart';
import 'package:flutter_provider/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showUserSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return AlertDialog(
              title: const Text('Select User'),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userProvider.users.length,
                  itemBuilder: (context, index) {
                    final user = userProvider.users[index];
                    return ListTile(
                      title: Text(user.username),
                      onTap: () {
                        userProvider.selectUser(user);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<CounterProvider, UserProvider>(
      builder: (context, counterProvider, userProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                _showUserSelection(context); // Mostrar diálogo de seleção ao clicar
              },
            ),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    userProvider.selectedUser?.username != null
                        ? CircleAvatar(
                            backgroundColor: Colors.grey.shade800,
                            child: Text(
                              userProvider.selectedUser!.username[0],
                              style: const TextStyle(color: Colors.white),
                            ),
                          )
                        : const SizedBox(width: 10),
                    const SizedBox(width: 10),
                    Text(
                      userProvider.selectedUser?.username ?? 'No user selected',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
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
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
            width: 100,
            height: 60,
            child: FloatingActionButton(
              onPressed: () {
                counterProvider.increment();
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          bottomNavigationBar: ClipPath(
            clipper: BottomAppBarClipper(),
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 6.0,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.home),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/example');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BottomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
