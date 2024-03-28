import 'package:isar/isar.dart';
part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? name;

  int quantity = 0;
}
