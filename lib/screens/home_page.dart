import 'package:bookmypark/api/manga_api.dart';
import 'package:bookmypark/widgets/manga_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Map<String, String>>>? _topRatedMangalist;

  @override
  void initState() {
    super.initState();
    //_fetchTopRated();
  }

  void _fetchTopRated() {
    setState(() {
      _topRatedMangalist = MangaDexApi.fetchTopRated();
    });
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue,
                hintText: "Search Manga...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            const Text("Newest Manga"),
            // SizedBox(
            //   height: mq.size.height * 0.2,
            //   width: mq.size.width * 0.9,
            //   child: FutureBuilder<List<Map<String, String>>>(
            //       future: _topRatedMangalist,
            //       builder: (context, snapshot) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return const Center(child: CircularProgressIndicator());
            //         } else if (snapshot.hasError) {
            //           return Center(child: Text('Error: ${snapshot.error}'));
            //         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //           return const Center(child: Text('No manga found'));
            //         } else {
            //           return ListView.builder(
            //             scrollDirection: Axis.horizontal,
            //             itemCount: snapshot.data!.length,
            //             itemBuilder: (context, index) {
            //               var manga = snapshot.data![index];
            //               return MangaCard(
            //                 title: manga['title']!,
            //                 description: manga['id']!,
            //               );
            //             },
            //           );
            //         }
            //       }),
            // ),
            SizedBox(
              height: mq.size.height * 0.3,
              width: mq.size.width * 0.9,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return MangaCard(
                    title: "Solo Leveling",
                    description: "A man who levels up",
                    image: "solo.jpg",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
