import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/multimodal_completion/bloc/multi_modal_bloc.dart';
import 'features/multimodal_completion/screens/multi_modal_screen.dart';
import 'features/multimodal_completion/services/vertex_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RepositoryProvider(
        create: (context) => VertexService(),
        child: BlocProvider<MultiModalBloc>(
          create: (content) => MultiModalBloc(
            vertexService: content.read<VertexService>(),
          ),
          child: const MultiModalScreen(title: 'Flutter Vertex Ai Demo'),
        ),
      ),
    );
  }
}


