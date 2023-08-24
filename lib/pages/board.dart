import 'package:flutter/material.dart';
import 'package:tic_tac_toe/global/utils.dart';

class Board extends StatefulWidget {
  final String symbol;

  const Board({
    required this.symbol,
    Key? key
  }) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {

  String currentPlayer = "";
  List<String> gridSymbols = List.filled(9, "");
  int _filledIndexCount = 0;

  void _changeGridSymbol(int index) {
    setState(() {
      gridSymbols[index] = currentPlayer;
    });
    _filledIndexCount++;
  }

  void _changeCurrentPlayer() {
    setState(() {
      currentPlayer == "X" ? currentPlayer = "O" : currentPlayer = "X";
    });
  }

  void _resetBoard() {
    setState(() {
      gridSymbols = List.filled(9, "");
      currentPlayer = widget.symbol;
    });
    _filledIndexCount = 0;
  }

  @override
  void initState() {
    super.initState();
    currentPlayer = widget.symbol;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Turn ($currentPlayer)",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Center(
            child: GridView.count(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 10.0),
              crossAxisCount: 3,
              children: List.generate(9, (index) {
                return GestureDetector(
                  onTap: () {
                    playButtonTapSound();
                    _changeGridSymbol(index);
                    _changeCurrentPlayer();
                    print("Filled index count: $_filledIndexCount");
                  },
                  child: Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white60,
                          blurRadius: 5.0,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        gridSymbols[index],
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          playButtonTapSound();
          _resetBoard();
        },
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
