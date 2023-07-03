import 'package:fancy_dropdown/data/entities/dropdown_item.dart';
import 'package:fancy_dropdown/utils/constants.dart';
import 'package:fancy_dropdown/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WDropdownItem extends StatefulWidget {
  const WDropdownItem({
    Key? key,
    required this.item,
    required this.onHeaderTap,
    this.expanded = false,
    this.shadowColor = Colors.black,
    this.color = const Color(0xff302d30),
  }) : super(key: key);

  final DropdownItem item;

  final VoidCallback onHeaderTap;

  final bool expanded;

  final Color shadowColor;

  final Color color;

  @override
  State<WDropdownItem> createState() => _WDropdownItemState();
}

class _WDropdownItemState extends State<WDropdownItem> {
  @override
  void initState() {
    super.initState();
  }

  // factory WDropdownItem.header(WDropdownItem item)=> header
  @override
  Widget build(BuildContext context) => Container(
        height: AppConstants.dropdownHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(
            8,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.shadowColor.withOpacity(0.045),
              offset: const Offset(0, -.5),
              blurRadius: 0,
            ),
            BoxShadow(
              color: widget.shadowColor.withOpacity(0.037),
              offset: const Offset(0, -1.5),
              blurRadius: 1.5,
            ),
            BoxShadow(
              color: widget.shadowColor.withOpacity(0.018),
              offset: const Offset(0, -3),
              blurRadius: 3,
            ),
            BoxShadow(
              color: widget.shadowColor.withOpacity(0.004),
              offset: const Offset(0, -10),
              blurRadius: 5,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: const Color(0xff171417),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
              child: Icon(
                widget.item.iconData,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                widget.item.name,
                style: TextStyles.mainTextStyle.apply(
                  color: Colors.white,
                  fontSizeDelta: 1,
                ),
              ),
            ),
            AnimatedSwitcher(
              switchInCurve: Curves.easeInExpo,
              switchOutCurve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 400),
              child: widget.expanded && widget.item.header
                  ? const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
            ),
          ],
        ),
      ).addTap(() {
        if (widget.item.header) {
          widget.onHeaderTap.call();
        }
      });
}

extension GestExt on Widget {
  Widget addTap(VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: this,
      );
}
