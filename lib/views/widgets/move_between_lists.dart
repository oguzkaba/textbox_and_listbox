import 'package:flutter/material.dart';

import '../../providers/provider.dart';
import 'custom_button.dart';
import 'custom_text_field_widget.dart';
import 'title_widget.dart';

class MoveBetweenListsWidget extends StatelessWidget {
  const MoveBetweenListsWidget({
    Key? key,
    required Size size,
    required this.myProvider,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final MyProvider myProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWidget(text: "Listeleme"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: _size.width * .6,
              child: CustomTextFieldWidget(
                  controller: myProvider.addTFController,
                  hintText: "Yazınız..."),
            ),
            const SizedBox(width: 20),
            CustomButton(press: myProvider.addList, text: "Ekle")
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildListView(
                text: "Ana Liste",
                list: myProvider.mainList,
                onTap: myProvider.mainMovetoSelectList),
            _buildListView(
                text: "Seçilmiş Liste",
                list: myProvider.selectList,
                onTap: myProvider.selectMovetoMainList),
          ],
        ),
      ],
    );
  }

  Column _buildListView(
      {required String text, required Function onTap, required List list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        Container(
          width: _size.width * .4,
          decoration: list.isEmpty
              ? null
              : BoxDecoration(border: Border.all(color: Colors.grey)),
          padding: const EdgeInsets.all(5),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () => onTap(index), child: Text(list[index]));
            },
            separatorBuilder: (context, index) => const Divider(
              color: Colors.black,
            ),
            itemCount: list.length,
          ),
        ),
      ],
    );
  }
}
