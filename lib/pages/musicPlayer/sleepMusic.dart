import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:soundescape/pages/homepage/bottomNav.dart';
import 'package:soundescape/pages/homepage/homePage.dart';

class SleepMusic extends StatefulWidget {
  const SleepMusic({Key? key}) : super(key: key);

  @override
  _SleepMusicState createState() => _SleepMusicState();
}

class _SleepMusicState extends State<SleepMusic> {
  List<dynamic> users = [];
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  late String image = '';
  late String name = '';
  late String audio = '';

  @override
  void initState() {
    super.initState();
    fetchUsers();
    _audioPlayer = AudioPlayer();

    _audioPlayer.playbackEventStream.listen((event) {
      setState(() {
        isPlaying = _audioPlayer.playing;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bnb(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: 600,
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.grey.withOpacity(0.4), BlendMode.softLight),
                        image: AssetImage("assets/sleep.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          icon: Icon(Icons.arrow_back),
                          iconSize: 35,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Sleep",
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.white70.withOpacity(0),
                          Colors.black,
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 485,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: users.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          final user = users[index];
                          final name = user['name'];
                          final audio = user['assetPath'];
                          final image = user['image'];
                          return ListTile(
                              title: GestureDetector(
                                onTap: () {
                                  _playAudio(audio, image, name);
                                },
                                child: Text(name),
                              ),
                              trailing: Icon(Icons.favorite_border_outlined));
                        },
                      ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Color.fromRGBO(47, 47, 74, 1)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: StreamBuilder<Duration?>(
                    stream: _audioPlayer.positionStream,
                    builder: (context, snapshot) {
                      var position = snapshot.data ?? Duration.zero;
                      var duration = _audioPlayer.duration ?? Duration.zero;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image(image: AssetImage("assets/audio.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              name.isNotEmpty ? name : '',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: LinearProgressIndicator(
                                value: duration.inMilliseconds > 0
                                    ? position.inMilliseconds /
                                        duration.inMilliseconds
                                    : 0.0,
                              ),
                            ),
                            IconButton(
                              iconSize: 33,
                              color: Colors.white,
                              icon: Icon(
                                  isPlaying ? Icons.pause : Icons.play_arrow),
                              onPressed: () {
                                if (isPlaying) {
                                  _audioPlayer.pause();
                                } else {
                                  _playAudio(image, '', name);
                                }
                              },
                            ),
                            Icon(Icons.favorite_border_outlined),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchUsers() async {
    const url = 'http://soundscape.boostproductivity.online/api/getSongs/sleep';
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        setState(() {
          users = json["data"];
        });
        print("User fetched completed");
      } else {
        print("Error fetching data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  Future<void> _playAudio(
      String audioUrl, String imageUrl, String songName) async {
    try {
      await _audioPlayer.setUrl(audioUrl);
      await _audioPlayer.play();
      setState(() {
        image = imageUrl;
        name = songName;
      });
    } catch (e) {
      print("Error playing audio: $e");
    }
  }
}
