import 'package:realm_dart/realm.dart';

part 'bar.g.dart';

@RealmModel()
class _Bar {
  @PrimaryKey()
  late ObjectId id;

  late String name;
  late String street;
  late String housenumber;
}