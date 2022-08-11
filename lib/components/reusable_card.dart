import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.color, this.CardChild, required this.onPress});
  final Color color;
  final Widget? CardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            onPress();
          },
          child: Container(
            //margin: EdgeInsets.all(1),
            alignment: Alignment.center,
            color: color,
            child: CardChild,
          ),
        ),
      ),
    );
  }
}

//
// class ReusableCard extends StatefulWidget {
//   //const ReusableCard({Key? key}) : super(key: key);
//   ReusableCard({required this.color, this.CardChild, required this.onPress});
//   final Color color;
//   final Widget? CardChild;
//   final Function onPress;
//   @override
//   State<ReusableCard> createState() => _ReusableCardState();
// }
//
// class _ReusableCardState extends State<ReusableCard> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: GestureDetector(
//           onTap: () {
//             onPress();
//             //(context as Element).markNeedsBuild();
//           },
//           child: Container(
//             //margin: EdgeInsets.all(1),
//             alignment: Alignment.center,
//             color: color,
//             child: CardChild,
//           ),
//         ),
//       ),
//     );
//   }
// }
