import 'package:dio/dio.dart';
import 'package:flixlist/add_to_list/view/add_to_list_view.dart';
import 'package:flixlist/movie/cubit/movie_cubit.dart';
import 'package:flixlist/movie/movie_repository.dart';
import 'package:flixlist/routes/custom_route.dart';
import 'package:flixlist/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key, required this.name, required this.id})
      : super(key: key);
  final String name;
  final String id;
  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(
        MovieRepository(
          context.read<Dio>(),
        ),
      ),
      child: MoviePageView(name: widget.name, id: widget.id),
    );
  }
}

class MoviePageView extends StatefulWidget {
  const MoviePageView({Key? key, required this.name, required this.id})
      : super(key: key);
  final String name;
  final String id;
  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  @override
  void initState() {
    super.initState();
    widget.name.isNotEmpty
        ? context.read<MovieCubit>().fetchMovieFromName(widget.name)
        : context.read<MovieCubit>().fetchMovieFromID(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {
        if (state.error != null) {
          AppUtils.showSnackBar(context, 'Something went wrong');
          Navigator.of(context).pop();
        }
      },
      listenWhen: (previous, next) => previous != next,
      builder: (context, state) {
        if (state.error != null) {
          return const SizedBox();
        }
        if (state.isLoading) {
          return Column(
            children: [
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              ),
            ],
          );
        }
        return Container(
          height: 300,
          width: 300,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Material(
            child: Stack(
              children: [
                Image.network(
                  state.movie?.Poster ?? '',
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 0,
                  bottom: MediaQuery.of(context).size.height * 0.3 + 20,
                  child: Container(
                      height: 220,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          bottomLeft: Radius.circular(35),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.movie?.Title ?? '',
                              style: GoogleFonts.leagueGothic(
                                fontSize: 48,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              state.movie?.Plot ?? '',
                              maxLines: 4,
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      state.movie?.Year ?? '',
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'English',
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () => Navigator.of(context).push(
                                    FlixRoute(
                                      widget: AddtoList(
                                        movieID: state.movie?.imdbID ?? '',
                                      ),
                                      offset: 0.4,
                                    ),
                                  ),
                                  icon: Icon(Icons.add_circle),
                                  color: Colors.white,
                                  tooltip: 'Add to album',
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
