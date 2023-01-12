import 'package:flutter/material.dart';
import 'package:skilltest/presentation/screen/search.dart';
import 'package:skilltest/presentation/screen/topreatedmovie.dart';
import 'package:skilltest/presentation/screen/treandingmovie.dart';
import 'package:skilltest/presentation/widget/customtext.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../model/treandingmovie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apikey = "d3089b832c3ac67a138a7d200f9ea110";
  final accesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzA4OWI4MzJjM2FjNjdhMTM4YTdkMjAwZjllYTExMCIsInN1YiI6IjYzYmUzODA4ZmMzMWQzMDBhOGRmY2I4YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wFRbQfnEn9DRkfQW4dpFdauXC73EFEfmaahmiqBcGdA";

  List treandingMovie = [];
  List treandingMovie1 = [];
  List<TreandingMovieModel> treandingMovieModelList = <TreandingMovieModel>[];
  List toptreandingMovie = [];
  List tv = [];
  @override
  void initState() {
    loadmovie();
    super.initState();
  }

  loadmovie() async {
    TMDB tmdbWidth = TMDB(
        ApiKeys(
          apikey,
          accesstoken,
        ),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map result = await tmdbWidth.v3.trending.getTrending();
    Map result1 = await tmdbWidth.v3.search.queryMovies(accesstoken);
    Map toptreandingMovieresult = await tmdbWidth.v3.movies.getTopRated();
    Map tvresult = await tmdbWidth.v3.tv.getPopular();

    setState(() {
      treandingMovie = result['results'];
      treandingMovie1 = result1['results'];

      toptreandingMovie = toptreandingMovieresult['results'];
      tv = tvresult['results'];
    });
    debugPrint("result treandingMovie ==== $treandingMovie1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          title: const CustomText(
            text: "Trending Movie or Tv show",
            color: Colors.white,
            size: true,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchBar(search: treandingMovie);
                  }));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TreandingMovie(
                trending: treandingMovie,
              ),
              TopTreandingMovie(
                trending: toptreandingMovie,
              ),
              // TreandingTv(
              //   trendingTv: tv,
              // ),
            ],
          ),
        ));
  }
}
