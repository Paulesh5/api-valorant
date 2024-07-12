import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/pokemon_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
      ],
      child: const MaterialApp(
        title: 'Agentes Valorant',
        home: AgentListScreen(),
      ),
    );
  }
}

class AgentListScreen extends StatelessWidget {
  const AgentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agentes Valorant'),
      ),
      body: Consumer<PokemonProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: provider.agentPortraits.length,
            itemExtent: 100.0,
            itemBuilder: (context, index) {
              String portraitUrl = provider.agentPortraits[index];
              return ListTile(
                title: Image.network(portraitUrl),
                onTap: () {
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<PokemonProvider>(context, listen: false).fetchAgentPortraits();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
