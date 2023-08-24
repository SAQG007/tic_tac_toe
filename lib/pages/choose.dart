// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
// import 'package:tic_tac_toe/global/utils.dart';
// import 'package:tic_tac_toe/pages/board.dart';
// import 'package:tic_tac_toe/widgets/menu_button.dart';

// class Choose extends StatefulWidget {
//   const Choose({ Key? key }) : super(key: key);

//   @override
//   _ChooseState createState() => _ChooseState();
// }

// class _ChooseState extends State<Choose> {

//   void _navigateToBoard(String symbol) async {
//     playButtonTapSound();
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Board()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           const RiveAnimation.asset(
//             'assets/backgrounds/planet-orbit.riv',
//             fit: BoxFit.cover,
//             alignment: Alignment.center,
//             antialiasing: true,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               MenuButton(title: "Play as X", onTap: () {
//                 _navigateToBoard("X");
//               },),
//               MenuButton(title: "Play as O", onTap: () {
//                 _navigateToBoard("O");
//               },),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
