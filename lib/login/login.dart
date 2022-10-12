import 'package:flixlist/auth/auth_repository.dart';
import 'package:flixlist/login/cubit/login_cubit.dart';
import 'package:flixlist/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const route = '/login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _pageController = PageController();
  int _activePage = 0;

  @override
  void initState() {
    super.initState();
  }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff320000), Color(0xffAD0000)],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Flixlist',
                                  style: GoogleFonts.leagueGothic(
                                    fontSize: 48,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Shortlist your favorite films',
                                  style: GoogleFonts.leagueGothic(
                                    fontSize: 28,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Center(
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        bottom: 16,
                      ),
                      child: Text(
                        'Sign in to continue',
                        style: GoogleFonts.leagueGothic(
                          fontSize: 36,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff320000), Color(0xffAD0000)],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _pageController.animateToPage(
                                        0,
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.bounceIn,
                                      );
                                      setState(() {
                                        _activePage = 0;
                                      });
                                    },
                                    child: Text(
                                      'Sign up',
                                      style: GoogleFonts.leagueGothic(
                                        color: Colors.white,
                                        fontSize: _activePage == 0 ? 28 : 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _pageController.animateToPage(
                                        1,
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.bounceIn,
                                      );
                                      setState(() {
                                        _activePage = 1;
                                      });
                                    },
                                    child: Text(
                                      'Login',
                                      style: GoogleFonts.leagueGothic(
                                        color: Colors.white,
                                        fontSize: _activePage == 1 ? 28 : 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (!state.isProcessing)
                              SizedBox(
                                height: 50,
                                width: 200,
                                child: PageView(
                                  controller: _pageController,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read<LoginCubit>().signUp(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                            );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read<LoginCubit>().login(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                            );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      child: Text(
                                        'Login',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            if (state.isProcessing)
                              CupertinoActivityIndicator(
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ),
                    ),
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
