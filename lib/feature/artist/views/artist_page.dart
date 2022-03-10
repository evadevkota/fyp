import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyp/core/models/music.dart';
import 'package:fyp/api/musics_api.dart';
import 'package:fyp/core/widgets/search.dart';

import '../../../core/widgets/main_drawer.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  List<Songs> musics = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final musics = await MusicsApi.getMusics(query);

    setState(() => this.musics = musics);
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              leading: IconButton(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                  icon: Image.asset(
                    'images/menu.png',
                    height: 20,
                    color: const Color.fromRGBO(53, 6, 102, 1),
                  ),
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  }),
              backgroundColor: Colors.white,
              actions: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 60, 0),
                  child: Text(
                    'Artist',
                    style: TextStyle(
                        color: Color.fromRGBO(53, 6, 102, 1),
                        fontFamily: "SanFranciscos",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          extendBodyBehindAppBar: true,
          drawer: const MainDrawer(),
          body: Column(
            children: <Widget>[
              buildSearch(),
              Expanded(
                child: ListView.builder(
                  itemCount: musics.length,
                  itemBuilder: (context, index) {
                    final music = musics[index];

                    return buildMusic(music);
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildSearch() => Search(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchMusic,
      );

  Future searchMusic(String query) async => debounce(() async {
        final musics = await MusicsApi.getMusics(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.musics = musics;
        });
      });

  Widget buildMusic(Songs music) => ListTile(
        leading: Image.network(
          music.imgUrl,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(music.title),
        subtitle: Text(music.artist),
      );
}
