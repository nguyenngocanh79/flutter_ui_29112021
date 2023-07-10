import 'package:flutter/material.dart';

class KeyboardAvoidancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keyboard Avoidance Example'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
                const Text('Header'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(decoration: InputDecoration(hintText: "ABC"),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(decoration: InputDecoration(hintText: "ABC"),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(decoration: InputDecoration(hintText: "ABC"),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(decoration: InputDecoration(hintText: "ABC"),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(decoration: InputDecoration(hintText: "ABC"),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(decoration: InputDecoration(hintText: "ABC"),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(decoration: InputDecoration(hintText: "ABC"),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(decoration: InputDecoration(hintText: "ABC"),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(decoration: InputDecoration(hintText: "ABC"),),
                ),

                Expanded(child: Container(color: Colors.red)),
                const Text('Footer'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
