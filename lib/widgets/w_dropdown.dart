import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fancy_dropdown/data/entities/dropdown_item.dart';
import 'package:fancy_dropdown/utils/constants.dart';
import 'package:fancy_dropdown/widgets/w_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinycolor2/tinycolor2.dart';

class WDropdown extends StatefulWidget {
  const WDropdown({Key? key}) : super(key: key);

  @override
  State<WDropdown> createState() => _WDropdownState();
}

class _WDropdownState extends State<WDropdown>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation simpleAnimation;
  bool isExpanded = false;

  double heightFactor = AppConstants.dropdownHeight / 2.5;

  double itemWidth = AppConstants.minItemWidth;

  List<DropdownItem> items = [
    DropdownItem(
      name: 'COMPONENTS',
      iconData: Iconsax.screenmirroring,
      header: true,
    ),
    DropdownItem(
      name: 'NAVBARS',
      iconData: Iconsax.folder,
    ),
    DropdownItem(
      name: 'CTA SECTIONS',
      iconData: Iconsax.toggle_on_circle,
    ),
    DropdownItem(
      name: 'GALLERIES',
      iconData: Iconsax.gallery,
    ),
    DropdownItem(
      name: 'PRICING',
      iconData: Iconsax.shopping_bag,
    ),
  ];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);

    simpleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.bounceIn),
    );
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: items.reversed
            .mapIndexed(
              (index, item) => AnimatedPositioned(
                curve: Curves.easeInOutExpo,
                duration: const Duration(
                  milliseconds: 300,
                ),
                // bottom: index * heightFactor,
                top: index * heightFactor,
                bottom: isExpanded
                    ? -1 * MediaQuery.of(context).size.height / 2
                    : 0,
                width: AppConstants.minItemWidth,
                child: Center(
                  child: AnimatedScale(
                    curve: Curves.bounceOut,
                    duration: const Duration(milliseconds: 300),
                    scale: isExpanded ? 1 : 1 - (0.05 * (1 - index)),
                    child: WDropdownItem(
                      expanded: isExpanded,
                      item: item,
                      color: const Color(0xff302d30).tint(index * 2),
                      onHeaderTap: () {
                        toggleDropdown();
                        setState(() {
                          heightFactor = isExpanded
                              ? -1 * AppConstants.dropdownHeight * 2.5
                              : AppConstants.dropdownHeight / 2.5;
                          itemWidth = isExpanded
                              ? AppConstants.minItemWidth
                              : AppConstants.minItemWidth * 10;
                        });
                      },
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      );

  toggleDropdown() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
