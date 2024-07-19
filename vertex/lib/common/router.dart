import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vertex/common/services/vertex_service.dart';

import '../features/image_description/bloc/image_description_bloc.dart';
import '../features/image_description/screens/image_description_screen.dart';
import 'home_page.dart';

const String homeRoute = '/home_page';
const String imageDescriptionScreen = '/image_description_screen';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

// the one and only GoRouter instance
final goRouter = GoRouter(
  initialLocation: homeRoute,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: homeRoute,
      pageBuilder: (context, state) => MaterialPage(child: HomePage()),
    ),
    GoRoute(
      path: imageDescriptionScreen,
      pageBuilder: (context, state) => MaterialPage(
          child: RepositoryProvider(
        create: (context) => VertexService(),
        child: BlocProvider<ImageDescriptionBloc>(
          create: (context) => ImageDescriptionBloc(
            vertexService: context.read<VertexService>(),
          ),
          child: ImageDescriptionScreen(),
        ),
      )),
    ),

  ],
);
