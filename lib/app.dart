import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/style/app_theme.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'features/home/presentation/blocs/post_bloc/post_bloc.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'injection_container.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<PostBloc>(),
        ),
        BlocProvider(
          create: (context) => sl.get<AuthBloc>(),
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
