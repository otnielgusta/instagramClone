import 'dart:math';

import 'package:flutter/material.dart';

class PostIconesWidget extends StatelessWidget {
  const PostIconesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mode_comment_outlined,
                color: Colors.white,
              ),
            ),
            Transform.rotate(
              angle: -30 * pi / 180,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.bookmark_border,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
