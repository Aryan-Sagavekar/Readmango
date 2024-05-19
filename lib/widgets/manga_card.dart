import 'package:flutter/material.dart';

class MangaCard extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  const MangaCard(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  State<MangaCard> createState() => _MangaCardState();
}

class _MangaCardState extends State<MangaCard> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 100,
        height: 150,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 150, 217, 255),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage("assets/images/${widget.image}"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(widget.title),
          Text(widget.description),
        ],
      ),
    ]);
  }
}
