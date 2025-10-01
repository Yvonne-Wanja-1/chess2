import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../config/chess_icons.dart';

class KnightIcon extends StatelessWidget {
  final double? size;
  final Color? color;

  const KnightIcon({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ChessIcons.knightPath,
      width: size ?? 24,
      height: size ?? 24,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).iconTheme.color!,
        BlendMode.srcIn,
      ),
    );
  }
}
