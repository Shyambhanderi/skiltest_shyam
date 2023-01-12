import 'package:flutter/material.dart';

import '../discription.dart';
import '../widget/customtext.dart';

class TreandingTv extends StatelessWidget {
  final List trendingTv;

  const TreandingTv({Key? key, required this.trendingTv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 25,
      ),
      const CustomText(text: "Treanding Tv", color: Colors.blue, size: true),
      SizedBox(
        height: 500,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          scrollDirection: Axis.vertical,
          itemCount: trendingTv.length,
          itemBuilder: (context, index) {
            // if (trendingTv.indexWhere((element) => element['title']) ==
            //     search.value.toString().toUpperCase()) {}
            return InkWell(
              child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 250,
                  child: Column(
                    children: [
                      Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    "https://image.tmdb.org/t/p/w500" +
                                                trendingTv[index]
                                                    ['backdrop_path'] !=
                                            null
                                        ? trendingTv[index]['backdrop_path']
                                        : "loading",
                                  ),
                                  fit: BoxFit.cover))),
                      CustomText(
                          text:
                              "${trendingTv[index]['original_name'] ?? "loading"}",
                          color: Colors.white),
                    ],
                  )),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Description(
                        description: trendingTv[index]['overview'],
                        name: trendingTv[index]['original_name'],
                        // ignore: prefer_interpolation_to_compose_strings
                        bannerurl: "https://image.tmdb.org/t/p/w500" +
                                    trendingTv[index]['backdrop_path'] !=
                                null
                            ? trendingTv[index]['backdrop_path']
                            : "loading",
                        // ignore: prefer_interpolation_to_compose_strings
                        posturl: "https://image.tmdb.org/t/p/w500" +
                                    trendingTv[index]['poster_path'] !=
                                null
                            ? trendingTv[index]['poster_path']
                            : "loading",
                        vote: trendingTv[index]['vote_average'] != null
                            ? trendingTv[index]['vote_average'].toString()
                            : "loading",
                        launchon: trendingTv[index]['first_air_date'] ??
                            Text("loading"));
                  },
                ));
              },
            );
          },
        ),
      ),
      const SizedBox(
        height: 20,
      )
    ]);
  }
}
