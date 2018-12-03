import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'styles.dart';

class ChuckButton extends StatelessWidget {

  final GestureTapCallback onPressed;

  const ChuckButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {

    var assetImage = AssetImage('assets/images/chuck_norris.png');
    var image = Image(
      image: assetImage,
      width: 36.0,
      height: 36.0,
    );

    // TODO: implement build
    return RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 16.0,
      vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Chuck!', 
          style: buttonTextStyle,),
          SizedBox(width: 4.0,),
          image
        ],
      ),
      //fillColor: Theme.of(context).accentColor,
      color: Theme.of(context).accentColor,
      splashColor: Theme.of(context).buttonColor,
      shape: StadiumBorder(),
      elevation: 8.0,
      highlightElevation: 0.0,
      onPressed: onPressed,
    );
  }

}