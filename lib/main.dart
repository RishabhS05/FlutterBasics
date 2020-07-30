import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Wigets"),
          centerTitle: true,
          backgroundColor: Colors.red[600]),
      body: ListView(
        children: <Widget>[
          Container(
            width:200,
            height: 400,
            child: CachedNetworkImage(
              imageUrl:
                  "https://homepages.cae.wisc.edu/~ece533/images/airplane.png",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(
            width: 200,
            height: 400,
            child: CachedNetworkImage(
              imageUrl: "https://homepages.cae.wisc.edu/~ece533/images/boat.png",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(
            width: 200,
            height: 400,
            child: CachedNetworkImage(
              imageUrl: "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(child: Image(image: CachedNetworkImageProvider("https://homepages.cae.wisc.edu/~ece533/images/cat.png")),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Center(
            child: Image.asset('assets/profile.png'),
//              child: Image(
//            image: AssetImage('assets/profile.png'),
//          )
          ),
          backgroundColor: Colors.red[600],
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
