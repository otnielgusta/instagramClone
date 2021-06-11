import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/home_page/models/post_model.dart';

class PostNameAvatarWidget extends StatelessWidget {
  final PostModel dados;
  const PostNameAvatarWidget({Key? key, required this.dados}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: CircleAvatar(
              backgroundImage: NetworkImage(dados.nomeFoto.foto),
              radius: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            dados.nomeFoto.nome,
            style: TextStyle(color: Colors.white),
          ),
        ]),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded, color: Colors.white))
      ],
    );
  }
}
