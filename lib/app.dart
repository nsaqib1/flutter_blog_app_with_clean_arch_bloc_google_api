import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/style/app_theme.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/presentation/screens/home_screen.dart';

import 'injection_container.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.defaultTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
