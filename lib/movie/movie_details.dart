import 'package:flixlist/movie/cubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: MoviePageView(),
    );
  }
}

class MoviePageView extends StatefulWidget {
  const MoviePageView({Key? key}) : super(key: key);

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().fetchMovie('name');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Material(
            child: Text(state.movie?.Title ?? 'null title'),
          ),
        );
      },
    );
  }
}
