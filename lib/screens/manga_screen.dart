import 'package:bookmypark/api/manga_api.dart';
import 'package:flutter/material.dart';

class MangaPage extends StatefulWidget {
  const MangaPage({super.key});

  @override
  State<MangaPage> createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage> {
  final TextEditingController _controller = TextEditingController();
  Future<List<Map<String, String>>>? _mangaList;

  void _fetchManga() {
    setState(() {
      _mangaList = MangaDexApi.fetchMangaByTitle(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MangaDex Search'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter manga title',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _fetchManga,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: FutureBuilder<List<Map<String, String>>>(
                future: _mangaList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No manga found'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var manga = snapshot.data![index];
                        return ListTile(
                          title: Text(manga['title']!),
                          subtitle: Text('ID: ${manga['id']}'),
                          onTap: () {
                            // Handle tap, maybe navigate to a detail screen
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
