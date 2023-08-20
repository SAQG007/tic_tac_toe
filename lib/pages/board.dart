import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Turn (X)",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Center(
            child: GridView.count(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 10.0),
              crossAxisCount: 3,
              children: List.generate(9, (index) {
                return Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '$index',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
