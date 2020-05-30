import 'package:flutter/material.dart';
import '../common/common.dart';
import '../constants/constant.dart';

import '../strings.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 8,
            ),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
          Expanded(
            child: HandCursor(
              child: const TextField(
                style: TextStyle(
                  color: AppColors.white,
                ),
                cursorColor: AppColors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  hintText: Strings.search,
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
