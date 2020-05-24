import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:smart_home_dashboard/common/common.dart';
import 'package:smart_home_dashboard/constants/constant.dart';

class DeviceFilter extends StatelessWidget {
  const DeviceFilter({
    @required this.initValue,
    @required this.filters,
    this.onChange,
    Key key,
  }) : super(key: key);

  final String initValue;
  final ValueChanged<String> onChange;
  final List<String> filters;

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      borderRadius: 8.0,
      child: Container(
        width: 100,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        padding: EdgeInsets.only(left: 16, right: 8),
        child: HandCursor(
          child: DropdownButton<String>(
            underline: SizedBox(),
            icon: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                SimpleLineIcons.arrow_down,
                color: AppColors.white,
                size: 16,
              ),
            ),
            elevation: 16,
            dropdownColor: AppColors.containerFill,
            style: TextStyle(
              color: AppColors.white,
            ),
            value: initValue,
            items: filters
                .map(
                  (filter) => DropdownMenuItem(
                    value: filter,
                    child: HandCursor(
                      child: Text(
                        filter.toUpperCase(),
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: onChange,
          ),
        ),
      ),
    );
  }
}
