import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app/services/service_locator.dart';
import '../../../../../app/theme/colors/i_app_color.dart';
import '../../../../../app/theme/sizes/i_app_size.dart';

class DeleteButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  const DeleteButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(context) {
    final appSize = ServiceLocator.instance.get<IAppSize>();
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        width: appSize.passwordButtonSize,
        height: appSize.passwordButtonSize,
        child: const Center(
          child: _DeleteIcon(),
        ),
      ),
    );
  }
}

class _DeleteIcon extends StatelessWidget {
  static const _widthIcon = 46.0;
  static const _heightIcon = 34.0;
  static const _crossIconSize = 18.0;
  static const _leftPadding = _widthIcon - _heightIcon;

  const _DeleteIcon({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final appColor = ServiceLocator.instance.get<IAppColor>();

    return Stack(
      children: [
        SvgPicture.asset(
          'assets/icons/delete/rectangle.svg',
          color: appColor.primary,
          width: _widthIcon,
          height: _heightIcon,
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(left: _leftPadding),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/delete/cross.svg',
                color: appColor.onPrimary,
                width: _crossIconSize,
                height: _crossIconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
