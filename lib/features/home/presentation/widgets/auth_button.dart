import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth_bloc/auth_bloc.dart';

class AuthButton extends StatefulWidget {
  const AuthButton({super.key});

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(CheckAuthStatusEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case AuthSuccessTrueState:
            state as AuthSuccessTrueState;

            return IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      state.currentUserEntity.avatarUrl ?? "",
                                      errorBuilder: (context, error, stackTrace) => Text(state.currentUserEntity.name?.split("")[0] ?? "A"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  state.currentUserEntity.name ?? "Error!",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Sign Out"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.person),
            );

          default:
            return TextButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(SignInEvent());
              },
              child: const Text("Sign In"),
            );
        }
      },
    );
  }
}
