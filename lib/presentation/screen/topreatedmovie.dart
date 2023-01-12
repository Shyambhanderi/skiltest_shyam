import 'package:flutter/material.dart';

import '../discription.dart';
import '../widget/customtext.dart';

class TopTreandingMovie extends StatelessWidget {
  final List trending;

  const TopTreandingMovie({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 25,
      ),
      const CustomText(
          text: "Top Treanding Movie", color: Colors.blue, size: true),
      const SizedBox(
        height: 25,
      ),
      SizedBox(
        height: 500,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          scrollDirection: Axis.vertical,
          itemCount: trending.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: SizedBox(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "https://image.tmdb.org/t/p/w500" +
                                          trending[index]['poster_path'])))),
                      CustomText(
                        text: "${trending[index]['title'] ?? "loading"}",
                        color: Colors.white,
                      ),
                    ],
                  )),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Description(
                        description: trending[index]['overview'],
                        name: trending[index]['title'],
                        // ignore: prefer_interpolation_to_compose_strings
                        bannerurl: "https://image.tmdb.org/t/p/w500" +
                            trending[index]['backdrop_path'],
                        // ignore: prefer_interpolation_to_compose_strings
                        posturl: "https://image.tmdb.org/t/p/w500" +
                            trending[index]['poster_path'],
                        vote: trending[index]['vote_average'].toString(),
                        launchon: trending[index]['release_date']);
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
