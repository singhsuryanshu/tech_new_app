
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

// ignore: camel_case_types
class appbar extends StatelessWidget implements PreferredSizeWidget {
  const appbar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [],
      elevation: 0,
      backgroundColor: AppColors.black,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boldText(
              text: "Tech",
              size: 20,
              color: AppColors.primary,
            ),
            modifiedText(
              text: "News",
              size: 20,
              color: AppColors.lightwhite,
            ),
          ],
        ),
      ),
      
      centerTitle: true,
    );
  }
}
