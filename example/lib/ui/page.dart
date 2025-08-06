
import 'package:flutter/material.dart';
import 'package:likeus/likeus.dart';



const double buttonSize = 40.0;

 
class LikeButtonDemo extends StatefulWidget {
  @override
  _LikeButtonDemoState createState() => _LikeButtonDemoState();
}

class _LikeButtonDemoState extends State<LikeButtonDemo> {
  final int likeCount = 999;
  final GlobalKey<LikeButtonState> _globalKey = GlobalKey<LikeButtonState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Like US'),
      ),
      body: Center(
        child: LikeButton(
          size: buttonSize,
          likeCount: likeCount,
          key: _globalKey,
          isLiked: true,
          postFrameCallback: (LikeButtonState state) {
            state.controller?.forward();
          },
          countBuilder: (int? count, bool isLiked, String text) {
            final ColorSwatch<int> color =
                isLiked ? Colors.pinkAccent : Colors.grey;
            Widget result;
            if (count == 0) {
              result = Text(
                'love',
                style: TextStyle(color: color),
              );
            } else
              result = Text(
                count! >= 1000
                    ? (count / 1000.0).toStringAsFixed(1) + 'k'
                    : text,
                style: TextStyle(color: color),
              );
            return result;
          },
          likeCountAnimationType: likeCount < 1000
              ? LikeCountAnimationType.part
              : LikeCountAnimationType.none,
          likeCountPadding: const EdgeInsets.only(left: 15.0),
          onTap: onLikeButtonTapped,
        ),
      ),
     
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {

    return !isLiked;
  }
}
