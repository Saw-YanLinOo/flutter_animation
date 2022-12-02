import 'package:flutter/material.dart';

const kAnimationDurationFavoriateIcon = Duration(milliseconds: 500);
const kMARGIN_X_LARGE = 32.0;
const kMARGIN_XX_LARGE = 42.0;

class ExplicitAnimationFavouriteIconButton extends StatefulWidget {
  const ExplicitAnimationFavouriteIconButton({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationFavouriteIconButton> createState() =>
      _ExplicitAnimationFavouriteIconButtonState();
}

class _ExplicitAnimationFavouriteIconButtonState
    extends State<ExplicitAnimationFavouriteIconButton>
    with TickerProviderStateMixin {
  // State
  bool isAnimationComplete = false;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double?> _sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      duration: kAnimationDurationFavoriateIcon,
      vsync: this,
    );

    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_controller.view);
    _sizeAnimation = Tween(begin: kMARGIN_X_LARGE, end: kMARGIN_XX_LARGE)
        .animate(_controller.view);

    _controller.addStatusListener((status) {
      isAnimationComplete = (status == AnimationStatus.completed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller.view,
        builder: (context, child) {
          return IconButton(
            onPressed: () {
              if (isAnimationComplete) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: _sizeAnimation.value,
            ),
          );
        });
  }
}
