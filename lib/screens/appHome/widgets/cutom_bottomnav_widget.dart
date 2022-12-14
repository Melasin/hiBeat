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
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: fullHeight(context) * 0.6,
          width: fullWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _navigationItems(context),
          )),
    );
  }

  List<Widget> _navigationItems(context) {
    return [
      _buildNavItem(0, isSelected: widget.selectedIndex == 0),
      _buildNavItem(1, isSelected: widget.selectedIndex == 1),
      _buildNavItem(2, isSelected: widget.selectedIndex == 2),
      _buildNavItem(3, isSelected: widget.selectedIndex == 3),
      _buildNavItem(4, isSelected: widget.selectedIndex == 4),
    ];
  }

  Widget _buildNavItem(int positionIndex, {required bool isSelected}) {
    switch (positionIndex) {
      case 0:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.homeIconFilled,
          inactiveIcon: AppAssets.homeIconLine,
          isSelected: isSelected,
          title: 'Home',
        );

      case 1:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.favIconFllled,
          inactiveIcon: AppAssets.favIconLine,
          isSelected: isSelected,
          title: 'Favourites',
        );

      case 2:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.libIconFilled,
          inactiveIcon: AppAssets.libIconLine,
          isSelected: isSelected,
          title: 'Library',
        );

      case 3:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.collectionIconFilled,
          inactiveIcon: AppAssets.collectionIconLine,
          isSelected: isSelected,
          title: 'Collection',
        );

      case 4:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.userIconFilled,
          inactiveIcon: AppAssets.userIconLine,
          isSelected: isSelected,
          title: 'Profile',
        );

      default:
        return _navItem(
          index: positionIndex,
          activeIcon: AppAssets.homeIconFilled,
          inactiveIcon: AppAssets.homeIconLine,
          isSelected: isSelected,
          title: 'Home',
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
    required String title,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.onItemSelected(index);
        },
        child: SizedBox.square(
          dimension: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  isSelected ? activeIcon : inactiveIcon,
                  color: isSelected ? AppColors.white : AppColors.white,
                ),
              ),
              // Expanded(
              //   child: Text(
              //     title,
              //     style: const TextStyle()
              //         .copyWith(color: AppColors.white, fontSize: 10),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
