// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:skilltest/presentation/discription.dart';
import 'package:skilltest/presentation/widget/customtext.dart';

class SearchBar extends StatefulWidget {
  final List search;
  const SearchBar({Key? key, required this.search}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchState();
}

class _SearchState extends State<SearchBar> {
  List searchList = [];
  TextEditingController searchtext = TextEditingController();

  onMasqueNameSearch({required String search, required List userOrder}) {
    searchList = userOrder.where((element) {
      if (element['title'].toString().toLowerCase().contains(search)) {
        return element['title'].toString().toLowerCase().contains(search);
      } else {
        return element['title'].toString().toLowerCase().contains(search);
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const CustomText(
                text: "Search", color: Colors.blue, size: true),
            backgroundColor: Colors.transparent),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 50,
              color: Colors.white,
              child: TextField(
                  controller: searchtext,
                  onChanged: (value) {
                    onMasqueNameSearch(
                        search: searchtext.value.text.toLowerCase().trim(),
                        userOrder: widget.search);
                    setState(() {});
                  },
                  decoration:
                      const InputDecoration(suffixIcon: Icon(Icons.search))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            SizedBox(
                height: 550,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  scrollDirection: Axis.vertical,
                  itemCount: searchList.length,
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
                                                  searchList[index]
                                                      ['poster_path'])))),
                              CustomText(
                                text:
                                    "${searchList[index]['title'] ?? "loading"}",
                                color: Colors.white,
                              ),
                            ],
                          )),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Description(
                                description: searchList[index]['overview'],
                                name: searchList[index]['title'],
                                bannerurl: "https://image.tmdb.org/t/p/w500" +
                                    searchList[index]['backdrop_path'],
                                posturl: "https://image.tmdb.org/t/p/w500" +
                                    searchList[index]['poster_path'],
                                vote: searchList[index]['vote_average']
                                    .toString(),
                                launchon: searchList[index]['release_date']);
                          },
                        ));
                      },
                    );
                  },
                ))
          ]),
        ));
  }
}
