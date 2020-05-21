class Appliance {
  Appliance(this.id,
      {this.name,
      this.isActive,
      this.selected,
      this.activeIcon,
      this.inActiveIcon,
      this.selectedIcon});

  final int id;
  final String name;
  bool isActive;
  final String activeIcon;
  final String inActiveIcon;
  final String selectedIcon;
  bool selected;
}
