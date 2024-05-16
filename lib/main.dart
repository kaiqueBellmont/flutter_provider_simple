import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/home.dart';
import 'package:flutter_provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Step 2: Wrap your app with MultiProvider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
