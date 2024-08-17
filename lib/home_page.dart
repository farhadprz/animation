import 'package:animation/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Samples')),
      body: ListView(
        children: [
          ListTile(title: Text('Basics', style: Theme.of(context).textTheme.titleLarge)),
          ...basicDemos.map((d) => DemoTile(demo: d)),
          ListTile(title: Text('Misc', style: Theme.of(context).textTheme.titleLarge)),
          ...miscDemos.map((d) => DemoTile(demo: d)),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  const DemoTile({
    super.key,
    required this.demo,
  });

  final Demo demo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () => context.go('/${demo.route}'),
    );
  }
}
