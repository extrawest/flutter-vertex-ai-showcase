import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/router.dart';
import 'common/services/vertex_service.dart';
import 'features/image_description/bloc/image_description_bloc.dart';
import 'features/image_description/screens/image_description_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Samoilenko AI App',
      routerConfig: goRouter,
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: RepositoryProvider(
    //     create: (context) => VertexService(),
    //     child: BlocProvider<ImageDescriptionBloc>(
    //       create: (content) => ImageDescriptionBloc(
    //         vertexService: content.read<VertexService>(),
    //       ),
    //       child: const MultiModalScreen(title: 'Flutter Vertex Ai Demo'),
    //     ),
    //   ),
    // );
  }
}
