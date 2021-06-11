import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/home_page/models/nome_foto_model.dart';

class StoriesWidget extends StatefulWidget {
  final NomeFotoModel currentUser;
  const StoriesWidget({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  _StoriesWidgetState createState() => _StoriesWidgetState();
}

class _StoriesWidgetState extends State<StoriesWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.currentUser.foto),
                      radius: 35,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Icon(
                                Icons.add_circle,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Seu story",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          ...NomeFotoModel.nomeFoto.map((e) {
            return Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(e.foto),
                        radius: 35,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      e.nome,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
