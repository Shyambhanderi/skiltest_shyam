// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:skilltest/presentation/discription.dart';
import 'package:skilltest/presentation/widget/customtext.dart';

class TreandingMovie extends StatefulWidget {
  final List trending;
  const TreandingMovie({Key? key, required this.trending}) : super(key: key);

  @override
  State<TreandingMovie> createState() => _TreandingMovieState();
}

class _TreandingMovieState extends State<TreandingMovie> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 25,
      ),
      const CustomText(text: "Treanding Movie", color: Colors.blue, size: true),
      const SizedBox(
        height: 25,
      ),
      SizedBox(
        height: 500,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          scrollDirection: Axis.vertical,
          itemCount: widget.trending.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: SizedBox(
                  width: 160,
                  child: Column(
                    children: [
                      Container(
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500" +
                                          widget.trending[index]
                                              ['poster_path'])))),
                      CustomText(
                        text: "${widget.trending[index]['title'] ?? "loading"}",
                        color: Colors.white,
                      ),
                    ],
                  )),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Description(
                        description: widget.trending[index]['overview'],
                        name: widget.trending[index]['title'],
                        bannerurl: "https://image.tmdb.org/t/p/w500" +
                            widget.trending[index]['backdrop_path'],
                        posturl: "https://image.tmdb.org/t/p/w500" +
                            widget.trending[index]['poster_path'],
                        vote: widget.trending[index]['vote_average'].toString(),
                        launchon: widget.trending[index]['release_date']);
                  },
                ));
              },
            );
          },
        ),
      )
    ]);
  }
}
