import 'package:flixlist/models/list/list.dart';
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
              widget.movieList.movies?[0].Poster ?? '',
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
                          widget.movieList.title,
                          style: GoogleFonts.leagueGothic(
                            fontSize: 48,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.movieList.private.toString(),
                          maxLines: 4,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
