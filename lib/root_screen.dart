import 'package:buy_once/default_layout.dart';
import 'package:buy_once/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  String? valueText;
  Isar? isar;
  TextEditingController? _textFieldController;
  List<Product>? allProducts;

  @override
  void initState() {
    super.initState();

    readyIsar();
  }

  void readyIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [ProductSchema], // 사용할 schema 다 명시
      directory: dir.path,
    );

    final all = await isar!.products.where().findAll();

    setState(() {
      allProducts = all;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        title: Text('buy once'),
      ),
      backgroundColor: Colors.yellow,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          print(allProducts?.length);
          _displayTextInputDialog(context);
        },
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: allProducts?.length,
            itemBuilder: (context, index) {
              Product? product = allProducts?[index];
              if (product == null) {
                return Text('');
              } else {
                return ItemCell(
                  product: allProducts![index],
                  onChanged: (value) async {
                    product.quantity = value.toInt();
                    await isar?.writeTxn(() async {
                      await isar?.products.put(product);
                    });
                    setState(() {});
                  },
                );
              }
            }),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('TextField in Dialog'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
              onChanged: (value) {
                valueText = value;
              },
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () async {
                  final product = Product();
                  print(valueText);
                  product.name = valueText;
                  await isar?.writeTxn(() async {
                    await isar?.products.put(product); // insert & update
                  });

                  final all = await isar?.products.where().findAll();

                  setState(() {
                    allProducts = all;

                    for (var product in allProducts ?? []) {
                      print('name: ${product.name}');
                    }
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
}

class ItemCell extends StatelessWidget {
  const ItemCell({
    super.key,
    required this.product,
    required this.onChanged,
  });

  final Product product;
  final ValueChanged<double> onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(product.name ?? 'emptysdfsdfsdfs'),
        Text('${product.quantity}'),
        Slider(
          value: product.quantity.toDouble(),
          max: 10,
          onChanged: onChanged,
        )
      ],
    );
  }
}
