import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'common/common.dart';
import 'common/vertical_spacer.dart';
import 'middle_section/home_section.dart';
import 'middle_section/search_bar.dart';
import 'middle_section/welcome_card.dart';

class MiddleSection extends StatefulWidget {
  const MiddleSection({Key key}) : super(key: key);

  @override
  _MiddleSectionState createState() => _MiddleSectionState();
}

class _MiddleSectionState extends State<MiddleSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SearchBarWidget(),
        VerticalSpacer(space: 24),
        WelcomeCardWidget(),
        VerticalSpacer(),
        HomeSectionWidget(),
      ],
    );
  }
}
