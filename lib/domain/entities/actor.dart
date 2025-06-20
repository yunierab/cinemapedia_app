import 'package:isar/isar.dart';

part 'actor.g.dart'; //Esto es para la BD Isar

@collection
class Actor {
  Id? idIsar;

  final int id;
  final String name;
  final String profilePath;
  final String? character;

  Actor({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });
}
