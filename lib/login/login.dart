import 'package:flixlist/auth/auth_repository.dart';
import 'package:flixlist/login/cubit/login_cubit.dart';
import 'package:flixlist/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const route = '/login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<AuthRepository>()),
      child: Builder(builder: (context) {
        return BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.error != null) {
              AppUtils.showSnackBar(context, state.error ?? '');
            }
          },
          listenWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Text('Login'),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                          ),
                          TextFormField(
                            controller: _passwordController,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().signUp(
                            email: _emailController.text,
                            password: _passwordController.text);
                      },
                      child: Text('Sign Up'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().login(
                            email: _emailController.text,
                            password: _passwordController.text);
                      },
                      child: Text('Login'),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
