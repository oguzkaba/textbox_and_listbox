import 'package:flutter/material.dart';

import '../../providers/provider.dart';
import 'custom_text_field_widget.dart';
import 'title_widget.dart';

class ChangeBGColorWidget extends StatelessWidget {
  const ChangeBGColorWidget({
    Key? key,
    required this.myProvider,
  }) : super(key: key);

  final MyProvider myProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TitleWidget(text: "Renk"),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomTextFieldWidget(
            controller: myProvider.colorTFController,
            hintText: "Renk Adı Yazınız...",
            change: (value) => myProvider.changeBGColor(value),
            color: myProvider.bgColor,
          ),
          const Text(
            "* 4 renkten birini yazınız (Mavi, Kırmızı, Sarı, Yeşil)",
            textAlign: TextAlign.left,
          )
        ])
      ],
    );
  }
}
