import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/utils.dart';

class CustomNavBarWidget extends StatefulWidget {
  const CustomNavBarWidget({
    Key? key,
    required this.onItemSelected,
    this.selectedIndex,
  }) : super(key: key);

  final int? selectedIndex;
  final ValueChanged<int> onItemSelected;

  @override
  State<CustomNavBarWidget> createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SizedBox(
        height: fullHeight(context) * 0.2,
        width: fullWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      )),
    );
  }

  List<Widget> _navigationItems(context) {
    return [
      _buildNavItem(0, context, isSelected: widget.selectedIndex == 0),
      _buildNavItem(1, context, isSelected: widget.selectedIndex == 1),
      _buildNavItem(2, context, isSelected: widget.selectedIndex == 2),
      _buildNavItem(3, context, isSelected: widget.selectedIndex == 3),
      _buildNavItem(4, context, isSelected: widget.selectedIndex == 4),
    ];
  }

  Widget _buildNavItem(int positionIndex, dynamic context,
      {required bool isSelected}) {
    switch (positionIndex) {
      case 0:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.homeIconFilled,
          inactiveIcon: AppAssets.homeIconLine,
          isSelected: isSelected,
        );

      case 1:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.homeIconFilled,
          inactiveIcon: AppAssets.homeIconLine,
          isSelected: isSelected,
        );

      case 2:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.homeIconFilled,
          inactiveIcon: AppAssets.homeIconLine,
          isSelected: isSelected,
        );

      case 3:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.homeIconFilled,
          inactiveIcon: AppAssets.homeIconLine,
          isSelected: isSelected,
        );

      case 4:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.homeIconFilled,
          inactiveIcon: AppAssets.homeIconLine,
          isSelected: isSelected,
        );

      default:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.homeIconFilled,
          inactiveIcon: AppAssets.homeIconLine,
          isSelected: isSelected,
        );
    }
  }

  ///? A function that is called when the user presses the back button.
  ///
  ///* Resets page index to prev page then Returns:
  ///*   A Future<bool>
  ///
  Future<bool> _onWillPop() async {
    setState(() {
      widget.onItemSelected(widget.selectedIndex!);
    });
    return true;
  }

  Widget _navItem({
    required int index,
    required String activeIcon,
    required String inactiveIcon,
    required bool isSelected,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.onItemSelected(index);
        },
        child: SizedBox.square(
          dimension: 23,
          child: SvgPicture.asset(
            isSelected ? activeIcon : inactiveIcon,
            color: isSelected ? AppColors.primary : AppColors.white,
          ),
        ),
      ),
    );
  }
}
