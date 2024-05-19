import 'dart:convert';
import 'package:http/http.dart' as http;

class MangaDexApi {
  static const String baseUrl = "https://api.mangadex.org";

  static Future<List<Map<String, String>>> fetchMangaByTitle(
      String title) async {
    final response = await http.get(
      Uri.parse('$baseUrl/manga?title=$title'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Map<String, String>> mangaList = [];
      for (var manga in data['data']) {
        String id = manga['id'];
        String mangaTitle = manga['attributes']['title']['en'];
        mangaList.add({'id': id, 'title': mangaTitle});
      }
      return mangaList;
    } else {
      throw Exception('Failed to load manga');
    }
  }

  static Future<List<Map<String, String>>> fetchTopRated() async {
    final queryParams = {
      "status[]": ["completed"],
      "contentRating[]": ["suggestive"],
    };

    final uri = Uri.https("api.mangadex.org", '/manga', queryParams);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Map<String, String>> mangaList = [];
      for (var manga in data['data']) {
        String id = manga['id'];
        String mangaTitle = manga['attributes']['title']['en'];
        mangaList.add({'id': id, 'title': mangaTitle});
      }
      return mangaList;
    } else {
      throw Exception('Failed to load manga');
    }
  }
}
