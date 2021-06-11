import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/home_page/models/nome_foto_model.dart';
import 'package:instagram_clone/pages/home_page/models/post_model.dart';
import 'package:instagram_clone/pages/home_page/widgets/app_bar_widget.dart';
import 'package:instagram_clone/pages/home_page/widgets/post_icones_widget.dart';
import 'package:instagram_clone/pages/home_page/widgets/post_name_avatar_widget.dart';
import 'package:instagram_clone/pages/home_page/widgets/stories_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController comentarioController = TextEditingController();
  bool comment = false;
  List<PostModel> feed = [];
  final NomeFotoModel currentUser = NomeFotoModel(
      foto:
          "https://i.pinimg.com/originals/8b/da/ca/8bdaca81d5ddbaeb92b61d6b5787d866.jpg",
      nome: "Otniel");

  void populaFeed() {
    for (var i = 0; i < NomeFotoModel.nomeFoto.length; i++) {
      var dado = PostModel(
          nomeFoto: NomeFotoModel.nomeFoto[i],
          legenda:
              "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          urlPost: "https://cdn.hipwallpaper.com/i/89/26/DGUd9H.jpg");
      feed.add(dado);
    }
    setState(() {});
  }

  @override
  void initState() {
    populaFeed();

    super.initState();
  }

  Widget teste() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            currentUser.foto,
          ),
        ),
      ),
      title: TextField(
        style: TextStyle(color: Colors.white),
        controller: comentarioController,
        autofocus: true,
        onChanged: (_) {
          setState(() {});
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
            hintText: "Comentar como ${currentUser.nome}"),
      ),
      trailing: comentarioController.text == ""
          ? TextButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) =>
                    TextStyle(color: Colors.black.withOpacity(0.40))),
              ),
              onPressed: null,
              child: Text("Publicar"),
            )
          : TextButton(
              onPressed: () {
                setState(() {
                  comment = false;
                  comentarioController.text = "";
                });
              },
              child: Text("Publicar"),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        setState(() {
          comment = false;
        });
        return new Future(() => false);
      },
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBarWidget(),
            preferredSize: Size.fromHeight((size.height * 5) / 100)),
        body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: StoriesWidget(
                        currentUser: currentUser,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ...feed.map((e) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: PostNameAvatarWidget(dados: e),
                          ),
                          Image.network(e.urlPost),
                          PostIconesWidget(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text.rich(
                                      TextSpan(text: "Curtido por ", children: [
                                        TextSpan(
                                            text: "teste.teste",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            recognizer:
                                                new TapGestureRecognizer()
                                                  ..onTap = () {
                                                    print("teste");
                                                  }),
                                        TextSpan(text: " e "),
                                        TextSpan(
                                            text: "outras pessoas",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            recognizer:
                                                new TapGestureRecognizer()
                                                  ..onTap = () {
                                                    print("teste");
                                                  }),
                                      ]),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Wrap(
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        text: "${e.nomeFoto.nome}",
                                        children: [
                                          TextSpan(
                                            text: " ${e.legenda}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          currentUser.foto,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          comment = true;
                                        });
                                      },
                                      child: Text(
                                        "Adicione um comentário",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
                Container(
                  color: Colors.grey.shade900,
                  child: comment ? teste() : Container(),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: (size.height * 7) / 100,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            items: [
              BottomNavigationBarItem(
                label: "teste",
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home_filled),
                ),
              ),
              BottomNavigationBarItem(
                label: "teste",
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ),
              BottomNavigationBarItem(
                label: "teste",
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.ondemand_video),
                ),
              ),
              BottomNavigationBarItem(
                label: "teste",
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_bag_outlined),
                ),
              ),
              BottomNavigationBarItem(
                label: "teste",
                icon: IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundImage: NetworkImage(
                      currentUser.foto,
                    ),
                  ),
                ),
              ),
            ],
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 0,
            unselectedItemColor: Colors.grey.shade600,
            selectedItemColor: Colors.white,
            selectedFontSize: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }
}
