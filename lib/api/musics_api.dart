import 'dart:convert';

import 'package:fyp/core/models/music.dart';
import 'package:http/http.dart' as http;

class MusicsApi {
  static Future<List<Songs>> getMusics(String query) async {
    final url = Uri.parse(
        'https://gist.githubusercontent.com/milankamilya/ac2261bc143d8c2da1a42e2403da41a0/raw/0a107fb45a29a0fc7dc99aec7168f23690d0e681/Musiclist.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List musics = json.decode(response.body);

      return musics.map((json) => Songs.fromJson(json)).where((music) {
        final titleLower = music.title.toLowerCase();
        final authorLower = music.artist.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) || authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
