import 'package:flutter/material.dart';

import '../../providers/provider.dart';
import 'custom_button.dart';
import 'custom_text_field_widget.dart';
import 'title_widget.dart';

class SortedCharacterWidget extends StatelessWidget {
  const SortedCharacterWidget({
    Key? key,
    required this.myProvider,
  }) : super(key: key);

  final MyProvider myProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        const TitleWidget(text: "Harf Sıralama"),
        CustomTextFieldWidget(
            controller: myProvider.sortedTFController,
            hintText: "Lütfen değer giriniz..."),
        CustomButton(text: "Sırala", press: myProvider.sortedText),
        CustomTextFieldWidget(
            controller: myProvider.sortedTF2Controller,
            readOnly: true,
            enabled: false),
        const SizedBox(height: 5)
      ],
    );
  }
}
