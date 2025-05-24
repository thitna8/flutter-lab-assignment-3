import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'presentation/blocs/album_bloc.dart';
import 'data/repositories/album_repository.dart';
import 'app/router.dart'; // Make sure you created this router file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AlbumRepository albumRepository = AlbumRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlbumBloc>(
          create: (_) => AlbumBloc(albumRepository)..add(FetchAlbums()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Stylish Album Viewer',
        routerConfig: router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 46, 2, 115), 
          cardColor: const Color.fromARGB(255, 73, 55, 115), 
          textTheme: ThemeData.dark().textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white70,
              ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 31, 1, 91),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          listTileTheme: const ListTileThemeData(
            tileColor: Color.fromARGB(255, 72, 60, 116), // block background
            textColor: Colors.white,
            iconColor: Colors.white70,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
