import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_list/pages/my_drawer.dart';

import '../model/movie_list_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  MovieList? movieData;

  Future<dynamic> post() async {
    http.Response data = await http
        .post(Uri.parse("https://hoblist.com/api/movieList"), body: {
      "category": "movies",
      "language": "kannada",
      "genre": "all",
      "sort": "voting"
    });
    if (data == null) {
      //show toast
    } else {
      setState(() {
        movieData = MovieList.fromJson(json
            .decode(data.body.toString())); //movieListModelFromJson(response);
        isLoading = false;
        // var a = movieData.result[0].title;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    post();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movie list"),
        ),
        drawer: const MyDrawer(),
        body: (isLoading)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 12.0),
                    Text("Please wait...")
                  ],
                ),
              )
            : ListView(
                children: List.generate(movieData!.result!.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          movieData!.result![index].totalVoted =
                                              (movieData!.result![index]
                                                      .totalVoted! +
                                                  1)!;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_up_outlined,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      movieData!.result![index].totalVoted
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          movieData!.result![index].totalVoted =
                                              (movieData!.result![index]
                                                      .totalVoted! -
                                                  1)!;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "votes",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.23,
                                width: 100,
                                child: Image(
                                  image: NetworkImage(movieData!
                                      .result![index].poster
                                      .toString()),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          movieData!.result![index].title
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Genre  : ',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54),
                                          children: [
                                            TextSpan(
                                              text:
                                                  " ${movieData!.result![index].genre.toString()}",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Director : ',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54),
                                          children: [
                                            TextSpan(
                                              text:
                                                  " ${movieData!.result![index].director![0].toString()}",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Starring : ',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54),
                                          children: [
                                            TextSpan(
                                              text: movieData!
                                                  .result![index].stars![0]
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(movieData!
                                                      .result![index].runTime ==
                                                  null
                                              ? ''
                                              : movieData!
                                                  .result![index].runTime
                                                  .toString()),
                                          SizedBox(
                                            width: movieData!.result![index]
                                                        .runTime ==
                                                    null
                                                ? 0
                                                : 7,
                                          ),
                                          Text(
                                            movieData!.result![index].language
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black54),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            '|',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        DateTime.fromMillisecondsSinceEpoch(
                                                movieData!.result![index]
                                                    .releasedDate!)
                                            .toString()
                                            .split(" ")
                                            .first,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 10),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${movieData!.result![index].pageViews.toString()} Views",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blue),
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const Text(
                                            '|',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20,
                                                color: Colors.blue),
                                          ),
                                          Expanded(
                                            child: Text(
                                              " voted by ${movieData!.result![index].voting.toString()} people ",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            //height: 35,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: ElevatedButton(
                                onPressed: () {
                                },
                                child: const Text(
                                  "Watch Trailer",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
      ),
    );
  }
}
