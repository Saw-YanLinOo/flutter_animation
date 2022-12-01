import 'package:flutter/material.dart';

const kAnimationDuration = Duration(milliseconds: 500);
const kAnimationDurationForScreenFadeIn = Duration(milliseconds: 1000);
const MARGIN_MEDIUM = 8.0;
const MARGIN_MEDIUM_2X = 16.0;
const MARGIN_48 = 48.0;
const MARGIN_32 = 32.0;

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool isDescriptionShow = false;
  bool isNewDimension = true;
  bool isChangedBackgroundColor = false;
  bool isNewTranslate = true;
  bool isChangedButtonLayout = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TweenAnimationBuilder(
            duration: kAnimationDurationForScreenFadeIn,
            tween: Tween<double>(begin: 0.0, end: 1.0),
            builder: (context, double opicity, child) {
              return Opacity(
                opacity: opicity,
                child: child,
              );
            },
            child: AnimatedContainer(
              duration: kAnimationDuration,
              color: isChangedBackgroundColor ? Colors.white : Colors.black,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      width: isNewDimension ? 350 : 250,
                      height: isNewDimension ? 300 : 200,
                      duration: kAnimationDuration,
                      child: Image.asset(
                        'assets/miki-mouse.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    AnimatedSize(
                      duration: kAnimationDuration,
                      child: Container(
                        height: isDescriptionShow ? null : 0.0,
                        child: Column(children: [
                          SizedBox(
                            height: MARGIN_MEDIUM,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: MARGIN_MEDIUM_2X,
                            ),
                            child: Text(
                              'The mascot of Disney and the most famous cartoon ever, Mickey Mouse has changed the way we watch TV. Walt Disney’s creation revolutionized the world of cartoon. The first cartoon we ever saw was Mickey Mouse and that has changed our lives forever.',
                              style: TextStyle(
                                color: !isChangedBackgroundColor
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: MARGIN_MEDIUM,
                    ),
                    AnimatedSize(
                      duration: kAnimationDuration,
                      child: AnimatedSwitcher(
                        duration: kAnimationDuration,
                        child: isChangedButtonLayout
                            ? PrimartyButtonInColumn(
                                changeDimension: () {
                                  setState(() {
                                    isNewDimension = !isNewDimension;
                                  });
                                },
                                showOrHideDescription: () {
                                  setState(() {
                                    isDescriptionShow = !isDescriptionShow;
                                  });
                                },
                                changeTheme: () {
                                  setState(() {
                                    isChangedBackgroundColor =
                                        !isChangedBackgroundColor;
                                  });
                                },
                                isDescriptionShow: isDescriptionShow,
                              )
                            : PrimartyButtonInWrap(
                                changeDimension: () {
                                  setState(() {
                                    isNewDimension = !isNewDimension;
                                  });
                                },
                                showOrHideDescription: () {
                                  setState(() {
                                    isDescriptionShow = !isDescriptionShow;
                                  });
                                },
                                changeTheme: () {
                                  setState(() {
                                    isChangedBackgroundColor =
                                        !isChangedBackgroundColor;
                                  });
                                },
                                isDescriptionShow: isDescriptionShow,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: MARGIN_MEDIUM,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          isChangedButtonLayout = !isChangedButtonLayout;
                        });
                      },
                      child: Text('Change Button Layout'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TweenAnimationBuilder(
            child: Text(
              'FLUTTER Animation',
              style: TextStyle(
                color: !isChangedBackgroundColor ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: kAnimationDurationForScreenFadeIn,
            builder: (context, double opacity, child) {
              return Opacity(
                opacity: opacity,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: opacity * MARGIN_48,
                    left: MARGIN_32,
                  ),
                  child: child,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PrimartyButtonInColumn extends StatelessWidget {
  const PrimartyButtonInColumn({
    Key? key,
    required this.isDescriptionShow,
    required this.changeDimension,
    required this.showOrHideDescription,
    required this.changeTheme,
  }) : super(key: key);

  final bool isDescriptionShow;
  final Function changeDimension;
  final Function showOrHideDescription;
  final Function changeTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            changeDimension();
          },
          child: const Text('Change Dimensions'),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        ElevatedButton(
          onPressed: () {
            showOrHideDescription();
          },
          child: Text('${isDescriptionShow ? 'Show' : 'Hide'} Description'),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        ElevatedButton(
          onPressed: () {
            changeTheme();
          },
          child: const Text('Change Theme'),
        ),
      ],
    );
  }
}

class PrimartyButtonInWrap extends StatelessWidget {
  const PrimartyButtonInWrap({
    Key? key,
    required this.isDescriptionShow,
    required this.changeDimension,
    required this.showOrHideDescription,
    required this.changeTheme,
  }) : super(key: key);

  final bool isDescriptionShow;
  final Function changeDimension;
  final Function showOrHideDescription;
  final Function changeTheme;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: MARGIN_MEDIUM,
      children: [
        ElevatedButton(
          onPressed: () {
            changeDimension();
          },
          child: const Text('Change Dimensions'),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        ElevatedButton(
          onPressed: () {
            showOrHideDescription();
          },
          child: Text('${isDescriptionShow ? 'Show' : 'Hide'} Description'),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        ElevatedButton(
          onPressed: () {
            changeTheme();
          },
          child: const Text('Change Theme'),
        ),
      ],
    );
  }
}
