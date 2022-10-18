import 'package:flixlist/models/list/list.dart';
import 'package:flixlist/movie/movie_details.dart';
import 'package:flixlist/routes/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key, required this.movieList}) : super(key: key);
  final MovieList movieList;
  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Image.network(
                    widget.movieList.movies?[0].Poster ?? '',
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
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
                                widget.movieList.title,
                                style: GoogleFonts.leagueGothic(
                                  fontSize: 48,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    widget.movieList.private
                                        ? Icons.lock
                                        : Icons.public,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.movieList.private
                                        ? 'Private List'
                                        : 'Public List',
                                    maxLines: 4,
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.list_alt,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '${widget.movieList.movies?[0].Title} ${widget.movieList.movies?.length != 1 ? '& ${(widget.movieList.movies?.length ?? 0) - 1} other movie(s)' : ''}',
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.separated(
                itemCount: widget.movieList.movies?.length ?? 0,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      FlixRoute(
                        widget: MoviePage(
                          name: '',
                          id: widget.movieList.movies?[index].imdbID ?? '',
                        ),
                        offset: 0.3,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Image.network(
                            widget.movieList.movies?[index].Poster ?? '',
                            height: 200,
                            width: 145,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180,
                                child: Text(
                                  widget.movieList.movies?[index].Title ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.leagueGothic(
                                    fontSize: 48,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  widget.movieList.movies?[index].Plot ?? '',
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                widget.movieList.movies?[index].Year ?? '',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
