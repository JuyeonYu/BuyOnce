import 'package:buy_once/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _stringTagController = StringTagController();

    return DefaultLayout(
      backgroundColor: Colors.red,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            // width: MediaQuery.of(context).size.width,
            child: TextFieldTags<String>(
              textfieldTagsController: _stringTagController,
              initialTags: ['python', 'java'],
              textSeparators: const [' ', ','],
              validator: (String tag) {
                if (tag == 'php') {
                  return 'Php not allowed';
                }
                return null;
              },
              inputFieldBuilder: (context, inputFieldValues) {
                return TextField(
                  controller: inputFieldValues.textEditingController,
                  focusNode: inputFieldValues.focusNode,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
