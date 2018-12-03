import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:norris_jokes/chuck_button.dart';
import 'dart:async';
import 'dart:convert';
import 'package:share/share.dart';
import 'package:html_unescape/html_unescape_small.dart';
import 'about_page.dart';
import 'custom_error_widget.dart';
import 'styles.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Norris Jokes',
      theme: new ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: new JokePage(),
    );
  }
}

class JokePage extends StatefulWidget {
  JokePage({Key key}) : super(key: key);

  @override
  _JokePageState createState() => new _JokePageState();
}

class _JokePageState extends State<JokePage> {
  final url = "http://api.icndb.com/jokes/random";

  Future<String> response;

  String jokeText;

  initState() {
    super.initState();
    response = http.read(url);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Norris Jokes', style: appBarTextStyle),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.info,
              
              ),
              tooltip: 'Info',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              }),
          IconButton(
            icon: Icon(Icons.share),
            tooltip: 'Share Joke',
            onPressed: _shareJoke,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: FutureBuilder<String>(
            future: response,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return CustomErrorWidget(Icons.sync_problem,
                      'Error occured. Please contact the developer');
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    final decoded = json.decode(snapshot.data);

                    if (decoded['type'] == "success") {
                      jokeText = HtmlUnescape()
                          .convert(decoded['value']['joke'].toString());

                      return Dismissible(
                        key: Key("joke"),
                        direction: DismissDirection.horizontal,
                        onDismissed: (direction) {
                          _refreshJoke();
                        },
                        child: Text(jokeText, style: jokeTextStyle),
                      );
                    }
                  }

                  return CustomErrorWidget(
                      Icons.error, 'No internet connection');
              }
            },
          ),
        ),
      ),

      floatingActionButton: ChuckButton(onPressed: _refreshJoke),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.refresh),
      //   highlightElevation: 0.0,
      //   onPressed: _refreshJoke,
      // ),
    );
  }

  void _refreshJoke() {
    setState(() {
      response = http.read(url);
    });
  }

  void _shareJoke() {
    if (jokeText.isNotEmpty) {
      Share.share(jokeText);
    }
  }
}
