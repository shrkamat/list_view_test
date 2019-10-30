import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: ImageDisplay(),
    );
  }
}

class ImageDisplay extends StatelessWidget {
  const ImageDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Image(s)"),
      ),
      body: Container(
        padding: EdgeInsets.only(top:2),
        height: 200,
        child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext cxt, int index) {
            return Image.network(
                "http://ipsumimage.appspot.com/140x100,ff7700?l=" +
                    index.toString());
          },
        ),
      ),
    );
  }
}
