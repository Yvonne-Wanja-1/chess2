import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChessKnightIcon extends StatelessWidget {
  final Color? color;
  final double? size;

  const ChessKnightIcon({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/knight.svg',
      width: size ?? 24,
      height: size ?? 24,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).iconTheme.color!,
        BlendMode.srcIn,
      ),
    );
  }
}
