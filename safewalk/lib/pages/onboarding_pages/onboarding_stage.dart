import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tempsafewalk/pages/create_and_login/create_account.dart';
import 'package:tempsafewalk/pages/onboarding_pages/onboarding_page2.dart';
import 'package:tempsafewalk/pages/onboarding_pages/onboarding_page3.dart';
import 'package:tempsafewalk/pages/onboarding_pages/onboarding_page4.dart';
import 'package:tempsafewalk/styles/global_themes.dart';

class OnboardingStage extends StatefulWidget {
  const OnboardingStage({super.key});

  @override
  State<OnboardingStage> createState() => _OnboardingStageState();
}

class _OnboardingStageState extends State<OnboardingStage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (_currentPage == 0 && details.delta.dx > 0) return;
              _controller.position.moveTo(
                _controller.offset - details.delta.dx,
              );
            },
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity == null) return;

              if (details.primaryVelocity! > 0 && _currentPage > 0) {
                _controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              } else if (details.primaryVelocity! < 0 && _currentPage < 3) {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            },
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                OnboardingPage2(),
                OnboardingPage3(),
                OnboardingPage4(),
              ],
            ),
          ),
          Align(
            alignment: _currentPage == 2
                ? const Alignment(0.80, 0.85) // Custom alignment for page 4
                : const Alignment(
                    0, 0.75), // Default alignment for page indicator
            child: _currentPage == 2
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const CreateAccount(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    child: const CircularButtonWithArc(),
                  )
                : SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const JumpingDotEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Color(0xffA29F9F),
                      activeDotColor: Color(0xff6979F8),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// Custom Circular Button with Arc
class CircularButtonWithArc extends StatelessWidget {
  const CircularButtonWithArc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color surface = Theme.of(context).colorScheme.surface;
    final Color onSurface = Theme.of(context).colorScheme.onSurface;

    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final Color onSecondaryColor = Theme.of(context).colorScheme.onSecondary;

    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(100, 100),
            painter: ArcPainter(),
          ),
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color:onSurface,
              borderRadius: BorderRadius.circular(100),
            ),
            child:  Icon(
              HugeIcons.strokeRoundedArrowRight01,
              color: surface,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color =  ThemeManager().dynamicPrimaryColor
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawArc(
      rect,
      -pi / 3,
      pi / 1.5,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


class ThemeManager with WidgetsBindingObserver {
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;
  ThemeManager._internal() {
    WidgetsBinding.instance.addObserver(this);
  }

  Brightness _brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;

  Brightness get brightness => _brightness;

  Color get dynamicPrimaryColor {
    return _brightness == Brightness.dark
        ? GlobalThemeData.darkColorScheme.onSurface
        : GlobalThemeData.lightColorScheme.onSurface;
  }

   

  @override
  void didChangePlatformBrightness() {
    _brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
  }
}