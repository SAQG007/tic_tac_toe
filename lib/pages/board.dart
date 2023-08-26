import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/global/utils.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {

  String _currentPlayer = "X";
  List<String> gridSymbols = List.filled(9, "");
  int _filledIndexCount = 0;
  String _winner = "";
  int _xWinCount = 0;
  int _oWinCount = 0;

  void _changeGridSymbol(int index) {
    setState(() {
      gridSymbols[index] = _currentPlayer;
    });
    _filledIndexCount++;
  }

  void _changeCurrentPlayer() {
    setState(() {
      _currentPlayer == "X" ? _currentPlayer = "O" : _currentPlayer = "X";
    });
  }

  void _findWinner() {
    if(
      gridSymbols[0].isNotEmpty &&
      (gridSymbols[0] == gridSymbols[1]) &&
      (gridSymbols[1] == gridSymbols[2]) &&
      (gridSymbols[0] == gridSymbols[2])
    ) {
      _winner = gridSymbols[0];
      return;
    }

    if(
      gridSymbols[3].isNotEmpty &&
      (gridSymbols[3] == gridSymbols[4]) &&
      (gridSymbols[4] == gridSymbols[5]) &&
      (gridSymbols[3] == gridSymbols[5])
    ) {
      _winner = gridSymbols[3];
      return;
    }

    if(
      gridSymbols[6].isNotEmpty &&
      (gridSymbols[6] == gridSymbols[7]) &&
      (gridSymbols[7] == gridSymbols[8]) &&
      (gridSymbols[6] == gridSymbols[8])
    ) {
      _winner = gridSymbols[6];
      return;
    }

    if(
      gridSymbols[0].isNotEmpty &&
      (gridSymbols[0] == gridSymbols[3]) &&
      (gridSymbols[3] == gridSymbols[6]) &&
      (gridSymbols[0] == gridSymbols[6])
    ) {
      _winner = gridSymbols[0];
      return;
    }

    if(
      gridSymbols[1].isNotEmpty &&
      (gridSymbols[1] == gridSymbols[4]) &&
      (gridSymbols[4] == gridSymbols[7]) &&
      (gridSymbols[1] == gridSymbols[7])
    ) {
      _winner = gridSymbols[1];
      return;
    }

    if(
      gridSymbols[2].isNotEmpty &&      
      (gridSymbols[2] == gridSymbols[5]) &&
      (gridSymbols[5] == gridSymbols[8]) &&
      (gridSymbols[2] == gridSymbols[8])
    ) {
      _winner = gridSymbols[2];
      return;
    }

    if(
      gridSymbols[0].isNotEmpty &&
      (gridSymbols[0] == gridSymbols[4]) &&
      (gridSymbols[4] == gridSymbols[8]) &&
      (gridSymbols[0] == gridSymbols[8])
    ) {
      _winner = gridSymbols[0];
      return;
    }

    if(
      gridSymbols[2].isNotEmpty &&
      (gridSymbols[2] == gridSymbols[4]) &&
      (gridSymbols[4] == gridSymbols[6]) &&
      (gridSymbols[2] == gridSymbols[6])
    ) {
      _winner = gridSymbols[2];
      return;
    }

    if(_filledIndexCount == 9) {
      _showDrawBar(context);
    }
  }

  void _incrementWinCount() {
    setState(() {
      _winner == "X" ? _xWinCount++ : _oWinCount++;
    });
  }

  void _showWinBar(BuildContext context){
    AchievementView(
      content: Text(
        "The winner is $_winner",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      color: Colors.amber[400]!,
      isCircle: true,
      icon: const Icon(
        Icons.emoji_events_outlined,
        size: 30,
      ),
    ).show(context);
  }

  void _showDrawBar(BuildContext context){
    AchievementView(
      content: Text(
        "Match Draw",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      color: Colors.amber[400]!,
      isCircle: true,
      icon: const Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Icon(
            Icons.emoji_events_outlined,
            size: 25,
            color: Colors.black,
          ),
          Icon(
            Icons.block_outlined,
            color: Colors.red,
            size: 40,
            weight: 0.1,
            grade: 0.1,
          ),
        ],
      ),
    ).show(context);
  }

  void _resetBoard() {
    setState(() {
      gridSymbols = List.filled(9, "");
      _currentPlayer = "X";
    });
    _filledIndexCount = 0;
    _winner = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Turn ($_currentPlayer)",
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
                    if(gridSymbols[index].isEmpty && _winner.isEmpty) {
                      playButtonTapSound();
                      _changeGridSymbol(index);

                      // this will only run if 5 or more indexes are filled
                      _filledIndexCount > 4 ? _findWinner() : null;

                      // this will only run if there is a winner
                      _winner.isNotEmpty ? 
                      {
                        _showWinBar(context),
                        _incrementWinCount()
                      } : null;

                      _changeCurrentPlayer();
                    }
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
          const SizedBox(
            height: 20,
          ),
          Text(
            "Win Streak",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "X - $_xWinCount",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                width: 55,
              ),
              Text(
                "O - $_oWinCount",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
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
