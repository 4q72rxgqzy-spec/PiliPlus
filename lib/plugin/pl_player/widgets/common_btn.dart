import 'package:PiliPlus/utils/platform_utils.dart';
import 'package:flutter/material.dart';

class ComBtn extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onSecondaryTap;
  final double width;
  final double height;
  final String? tooltip;

  const ComBtn({
    super.key,
    required this.icon,
    this.onTap,
    this.onLongPress,
    this.onSecondaryTap,
    this.width = 34,
    this.height = 34,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (PlatformUtils.isTV) {
      child = SizedBox(
        width: width,
        height: height,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            borderRadius: BorderRadius.circular(8),
            focusColor: Colors.white24,
            child: Center(child: icon),
          ),
        ),
      );
    } else {
      child = SizedBox(
        width: width,
        height: height,
        child: GestureDetector(
          onTap: onTap,
          onLongPress: onLongPress,
          onSecondaryTap: onSecondaryTap,
          behavior: HitTestBehavior.opaque,
          child: icon,
        ),
      );
    }
    if (tooltip != null) {
      return Tooltip(message: tooltip, child: child);
    }
    return child;
  }
}
