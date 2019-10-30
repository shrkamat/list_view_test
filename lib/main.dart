import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: Text("IVP"),
          ),
          body: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ImageDisplay(
                  offset: 120,
                ),
                ImageDisplay(
                  offset: 177,
                ),
                Container(
                  height: 120,
                  color: Colors.amber,
                  child: CachedNetworkImage(
                    imageUrl:
                        "http://ipsumimage.appspotiii.com/140x100,ff7700?l=999",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    // errorWidget: (context, url, error) => Image.network("http://ipsumimage.appspot.com/140x100,ff7700?l=ERR"),
                    errorWidget: (context, url, error) => Image.asset(
                      "images/poster.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class ImageDisplay extends StatelessWidget {
  final int offset;
  const ImageDisplay({Key key, this.offset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 11,
        itemBuilder: (BuildContext cxt, int index) {
          return Image.network(
            "http://ipsumimage.appspot.com/140x100,ff7700?l=" +
                (offset + index).toString(),
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
