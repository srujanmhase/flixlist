import 'package:dio/dio.dart';
import 'package:flixlist/auth/auth_repository.dart';
import 'package:flixlist/home/cubit/home_cubit.dart';
import 'package:flixlist/models/list/list.dart';
import 'package:flixlist/movie/movie_details.dart';
import 'package:flixlist/movie/movie_repository.dart';
import 'package:flixlist/movie_list/movie_list.dart';
import 'package:flixlist/routes/custom_route.dart';
import 'package:flixlist/services/firestore_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        context.read<FirestoreRepository>(),
        MovieRepository(
          context.read<Dio>(),
        ),
        context.read<AuthRepository>(),
      ),
      child: HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return Material(
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        if (state.error != null) {
          return Material(
            child: Center(
              child: Text('An Error Occured'),
            ),
          );
        }
        return SafeArea(
          child: RefreshIndicator(
            onRefresh: () => context.read<HomeCubit>().fetchHomeData(),
            child: SingleChildScrollView(
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Flixlist',
                                    style: GoogleFonts.leagueGothic(
                                      fontSize: 48,
                                      color: Colors.white,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => context
                                        .read<AuthRepository>()
                                        .signOut(),
                                    child: Icon(
                                      Icons.logout,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 25,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: TextFormField(
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide.none,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        if (_searchController.text.isNotEmpty)
                                          Navigator.of(context).push(
                                            FlixRoute(
                                              widget: MoviePage(
                                                name: _searchController.text,
                                                id: '',
                                              ),
                                              offset: 0.3,
                                            ),
                                          );
                                      },
                                      child: Icon(
                                        Icons.search,
                                        color: Color(0xff320000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Try searching for a movie: "2012"',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      FlixRoute(
                                        widget: MovieListPage(
                                          movieList: state.featuredList ??
                                              MovieList(
                                                uuid: 'uuid',
                                                title: 'title',
                                                private: false,
                                              ),
                                        ),
                                        offset: 0.2,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          state.featuredList?.movies?[0]
                                                  .Poster ??
                                              '',
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 16, left: 16),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 8),
                                            child: Text(
                                              'Featured Movies',
                                              style: GoogleFonts.leagueGothic(
                                                color: Colors.white,
                                                fontSize: 36,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 20,
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
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Your Flixlists',
                      style: GoogleFonts.leagueGothic(fontSize: 36),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      height: 230,
                      width: MediaQuery.of(context).size.width - 32,
                      child: ListView.separated(
                        itemCount: state.yourLists.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                        itemBuilder: (context, index) => Center(
                          child: SizedBox(
                            height: 190,
                            width: 150,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  FlixRoute(
                                    widget: MovieListPage(
                                      movieList: state.yourLists[index],
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
                                        state.yourLists[index].movies?[0]
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
                                          color: Colors.black.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${state.yourLists[index].title}',
                                              style: GoogleFonts.leagueGothic(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              '${state.yourLists[index].movies?[0].Title} ${state.yourLists[index].movies?.length != 1 ? '& ${(state.yourLists[index].movies?.length ?? 0) - 1} other' : ''}',
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
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
