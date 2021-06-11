import 'package:instagram_clone/pages/home_page/models/nome_foto_model.dart';

class PostModel {
  final NomeFotoModel nomeFoto;
  final String urlPost;
  final String legenda;

  PostModel(
      {required this.nomeFoto, required this.urlPost, required this.legenda});
}
