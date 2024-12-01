// create a app i'm rich
import 'package:flutter/material.dart';

void main() {
  runApp(const ImRich());
}

class ImRich extends StatelessWidget {
  const ImRich({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ImRichApp(),
    );
  }
}

class ImRichApp extends StatefulWidget {
  const ImRichApp({super.key});

  @override
  State<ImRichApp> createState() => _ImRichAppState();
}

class _ImRichAppState extends State<ImRichApp> {
  int _count = 0;

  void _handleTap() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(_count <= 10 ? 'I\'m Rich' : 'I\'m Poor',
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: _handleTap,
          )
        ],
      ),
      body: Center(
        child: Image(
            image: _count <= 10
                ? NetworkImage(
                    'https://miro.medium.com/v2/resize:fit:4000/0*6WLqebrITTPNHwu7.gif')
                : AssetImage('assets/images/image.png')),
      ),
    );
  }
}
