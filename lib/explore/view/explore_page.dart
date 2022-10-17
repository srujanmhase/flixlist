import 'package:dio/dio.dart';
import 'package:flixlist/explore/cubit/explore_cubit.dart';
import 'package:flixlist/movie/movie_repository.dart';
import 'package:flixlist/movie_list/movie_list.dart';
import 'package:flixlist/routes/custom_route.dart';
import 'package:flixlist/services/firestore_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreCubit(
        context.read<FirestoreRepository>(),
        MovieRepository(
          context.read<Dio>(),
        ),
      ),
      child: ExplorePageView(),
    );
  }
}

class ExplorePageView extends StatefulWidget {
  const ExplorePageView({Key? key}) : super(key: key);

  @override
  State<ExplorePageView> createState() => _ExplorePageViewState();
}

class _ExplorePageViewState extends State<ExplorePageView> {
  @override
  void initState() {
    super.initState();
    context.read<ExploreCubit>().fetchExplorePage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreCubit, ExploreState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state.error != null) {
          return Center(
            child: Text(state.error ?? ''),
          );
        }
        return SafeArea(
          child: SingleChildScrollView(
            child: RefreshIndicator(
              onRefresh: () => context.read<ExploreCubit>().fetchExplorePage(),
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 30,
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
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "The world's Flixlists",
                      style: GoogleFonts.leagueGothic(fontSize: 36),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 32,
                      height: MediaQuery.of(context).size.height - 300,
                      child: GridView.builder(
                        itemCount: state.lists.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.5,
                          mainAxisExtent: 200,
                        ),
                        itemBuilder: (context, index) {
                          return Center(
                            child: SizedBox(
                              height: 190,
                              width: 150,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    FlixRoute(
                                      widget: MovieListPage(
                                        movieList: state.lists[index],
                                      ),
                                      offset: 0.2,
                                    ),
                                  );
                                },
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(3, 5),
                                          blurRadius: 12,
                                          color: Colors.black.withOpacity(0.4),
                                        )
                                      ]),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Image.network(
                                          state.lists[index].movies?[0]
                                                  .Poster ??
                                              '',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 14,
                                        left: 10,
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${state.lists[index].title}',
                                                style: GoogleFonts.leagueGothic(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                '${state.lists[index].movies?[0].Title} ${state.lists[index].movies?.length != 1 ? '& ${(state.lists[index].movies?.length ?? 0) - 1} other' : ''}',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
