import 'package:flutter/material.dart';

import 'appliance.dart';

import 'appliances_list_item.dart';

class AppliancesList extends StatefulWidget {
  const AppliancesList({
    @required this.appliances,
    this.onSelect,
    this.onApplianceStateChange,
    Key key,
  }) : super(key: key);

  final List<Appliance> appliances;
  final Function(Appliance) onSelect;
  final Function(Appliance, bool) onApplianceStateChange;

  @override
  _AppliancesListState createState() => _AppliancesListState();
}

class _AppliancesListState extends State<AppliancesList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: widget.appliances.map(
        (appliance) {
          return Padding(
            padding: const EdgeInsets.only(right: 24),
            child: AppliancesListItem(
              name: appliance.name,
              activeIcon: appliance.activeIcon,
              inActiveIcon: appliance.inActiveIcon,
              selectedIcon: appliance.selectedIcon,
              value: appliance.isActive,
              selected: appliance.selected,
              onStateChange: (value) =>
                  widget.onApplianceStateChange(appliance, value),
              onSelected: () => widget.onSelect(appliance),
            ),
          );
        },
      ).toList(),
    );
  }
}
