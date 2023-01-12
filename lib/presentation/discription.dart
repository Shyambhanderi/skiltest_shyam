import 'package:flutter/material.dart';
import 'package:skilltest/presentation/widget/customtext.dart';

class Description extends StatelessWidget {
  final String description;
  final String name;
  final String bannerurl;
  final String posturl;
  final String vote;
  final String launchon;

  const Description(
      {Key? key,
      required this.description,
      required this.name,
      required this.bannerurl,
      required this.posturl,
      required this.vote,
      required this.launchon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(children: [
              Positioned(
                  child: SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  bannerurl,
                  fit: BoxFit.cover,
                ),
              )),
              Positioned(
                  bottom: 10,
                  child: CustomText(
                    text: "Average vote = $vote",
                    color: Colors.white,
                  )),
            ]),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: CustomText(text: name, color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: CustomText(
                text: "Reales Date on = $launchon", color: Colors.white),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 200,
                width: 100,
                child: Image.network(posturl),
              ),
              Flexible(
                child: CustomText(text: description, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
