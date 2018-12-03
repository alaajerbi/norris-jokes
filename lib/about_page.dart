import 'package:flutter/material.dart';
import 'styles.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetImage = AssetImage('assets/images/chuck_norris.png');
    var image = Image(
      image: assetImage,
      width: 120.0,
      height: 120.0,
    );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: appBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    image,
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'Norris Jokes',
                      style: TextStyle(
                          fontFamily: 'Patrick Hand',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor,
                          fontSize: 22.0),
                    ),
                    Text('Version 1.0.0',
                        style: TextStyle(
                            fontFamily: 'Patrick Hand',
                            fontWeight: FontWeight.normal,
                            fontSize: 18.0)),
                  ],
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Text(
                'Copyright \u00a9 2018 Alaa Jerbi. All rights reserved.',
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Proudly built with the Flutter framework.',
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
