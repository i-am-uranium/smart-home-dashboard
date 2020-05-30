import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../common/common.dart';
import '../constants/constant.dart';

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
      child: Container(
        width: 100,
        height: 36,
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: HandCursor(
          child: DropdownButton<String>(
            underline: const SizedBox(),
            icon: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                SimpleLineIcons.arrow_down,
                color: AppColors.white,
                size: 16,
              ),
            ),
            elevation: 16,
            dropdownColor: AppColors.containerFill,
            style: const TextStyle(
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
                        style: const TextStyle(color: AppColors.white),
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
