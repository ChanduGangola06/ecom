// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:math';

import 'package:ecom/constants/app_colors.dart';
import 'package:ecom/models/page_view_model.dart';
import 'package:flutter/material.dart';

class IntroView extends StatefulWidget {
  final List<PageViewModel> pages;
  final VoidCallback? onTapDoneButton;
  final Color? pageButtonsColor;
  final bool showSkipButton;
  final bool showNextButton;
  final bool showBackButton;
  final TextStyle? pageButtonTextStyles;
  final VoidCallback? onTapSkipButton;
  final VoidCallback? onTapNextButton;
  final VoidCallback? onTapBackButton;
  final double pageButtonTextSize;
  final String? pageButtonFontFamily;
  final Widget doneText;
  final Widget backText;
  final Widget nextText;
  final Widget skipText;
  final bool doneButtonPersist;
  final MainAxisAlignment columnMainAxisAlignment;
  final double fullTransition;
  final Color? background;

  const IntroView(
    this.pages, {
    super.key,
    this.onTapDoneButton,
    this.showSkipButton = true,
    this.pageButtonTextStyles,
    this.onTapBackButton,
    this.showNextButton = false,
    this.showBackButton = false,
    this.pageButtonTextSize = 18.0,
    this.pageButtonFontFamily,
    this.onTapSkipButton,
    this.onTapNextButton,
    this.pageButtonsColor,
    this.doneText = const Text(
      "DONE",
      style: TextStyle(color: AppColors.black),
    ),
    this.nextText = const Text(
      "NEXT",
      style: TextStyle(color: AppColors.black),
    ),
    this.skipText = const Text(
      "SKIP",
      style: TextStyle(color: AppColors.black),
    ),
    this.backText = const Text(
      "BACK",
      style: TextStyle(color: AppColors.black),
    ),
    this.doneButtonPersist = false,
    this.columnMainAxisAlignment = MainAxisAlignment.spaceAround,
    this.fullTransition = FULL_TARNSITION_PX,
    this.background,
  });

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> with TickerProviderStateMixin {
  StreamController<SlideUpdate>? slideUpdateStream;

  AnimatedPageDragger? animatedPageDragger;
  int activePageIndex = 0; //active page index
  int nextPageIndex = 0; //next page index
  SlideDirection? slideDirection = SlideDirection.none; //slide direction
  double? slidePercent = 0.0; //slide percentage (0.0 to 1.0)
  StreamSubscription<SlideUpdate>? slideUpdateStream$;

  @override
  void initState() {
    //Stream Controller initialization
    slideUpdateStream = StreamController<SlideUpdate>();
    //listening to updates of stream controller
    slideUpdateStream$ = slideUpdateStream!.stream.listen((SlideUpdate event) {
      setState(() {
        //setState is used to change the values dynamically

        //if the user is dragging then
        if (event.updateType == UpdateType.dragging) {
          slideDirection = event.direction;
          slidePercent = event.slidePercent;

          //conditions on slide direction
          if (slideDirection == SlideDirection.leftToRight) {
            nextPageIndex = max(0, activePageIndex - 1);
          } else if (slideDirection == SlideDirection.rightToLeft) {
            nextPageIndex = min(widget.pages.length - 1, activePageIndex + 1);
          } else {
            nextPageIndex = activePageIndex;
          }
        }
        //if the user has done dragging
        else if (event.updateType == UpdateType.doneDragging) {
          //Auto completion of event using Animated page dragger.
          if (slidePercent! > 0.5) {
            animatedPageDragger = AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.open,
              //we have to animate the open page reveal
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );
          } else {
            animatedPageDragger = AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.close,
              //we have to close the page reveal
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );
            //also next page is active page
            nextPageIndex = activePageIndex;
          }
          //Run the animation
          animatedPageDragger!.run();
        }
        //when animating
        else if (event.updateType == UpdateType.animating) {
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
        }
        //done animating
        else if (event.updateType == UpdateType.doneAnimating) {
          activePageIndex = nextPageIndex;

          slideDirection = SlideDirection.none;
          slidePercent = 0.0;

          //disposing the animation controller
          // animatedPageDragger?.dispose();
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    slideUpdateStream$?.cancel();
    animatedPageDragger?.dispose();
    slideUpdateStream?.close();
    super.dispose();
  }

  /// Build method

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
            fontSize: widget.pageButtonTextSize,
            color: widget.pageButtonsColor ?? const Color(0x88FFFFFF),
            fontFamily: widget.pageButtonFontFamily)
        .merge(widget.pageButtonTextStyles);

    List<PageViewModel> pages = widget.pages;

    return Scaffold(
      //Stack is used to place components over one another.
      // resizeToAvoidBottomPadding: false,
      backgroundColor: widget.background,
      body: Stack(
        children: <Widget>[
          PageScreen(
            pageViewModel: pages[activePageIndex],
            percentVisible: 1.0,
            columnMainAxisAlignment: widget.columnMainAxisAlignment,
          ), //Pages
          PageReveal(
            //next page reveal
            revealPercent: slidePercent,
            child: PageScreen(
                pageViewModel: pages[nextPageIndex],
                percentVisible: slidePercent ?? 0.0,
                columnMainAxisAlignment: widget.columnMainAxisAlignment),
          ), //PageReveal
          // Container(
          //   padding: EdgeInsets.only(bottom: Constant.size20),
          //   alignment: Alignment.bottomCenter,
          //   child: DotsIndicator(
          //     dotsCount: pages.length,
          //     position: double.parse(activePageIndex.toString()),
          //     decorator: DotsDecorator(

          //       color: Colors.white,
          //       activeColor: Colors.redAccent,
          //     ),
          //   ),
          // ),
          PagerIndicator(
            //bottom page indicator
            viewModel: PagerIndicatorViewModel(
              pages,
              activePageIndex,
              slideDirection!,
              slidePercent!,
            ),
          ), //PagerIndicator

          SafeArea(
            child: PageIndicatorButtons(
              //Skip and Done Buttons
              textStyle: textStyle,
              activePageIndex: activePageIndex,
              totalPages: pages.length,
              onPressedDoneButton: widget.onTapDoneButton,
              //void Callback to be executed after pressing done button
              slidePercent: slidePercent,
              slideDirection: slideDirection,
              onPressedSkipButton: () {
                //method executed on pressing skip button
                setState(() {
                  activePageIndex = pages.length - 1;
                  nextPageIndex = activePageIndex;
                  // after skip pressed invoke function
                  // this can be used for analytics/page transition
                  if (widget.onTapSkipButton != null) {
                    widget.onTapSkipButton!();
                  }
                });
              },
              showSkipButton: widget.showSkipButton,
              showNextButton: widget.showNextButton,
              showBackButton: widget.showBackButton,
              onPressedNextButton: () {
                //method executed on pressing next button
                setState(() {
                  activePageIndex = min(pages.length - 1, activePageIndex + 1);
                  nextPageIndex = min(pages.length - 1, nextPageIndex + 1);
                  // after next pressed invoke function
                  // this can be used for analytics/page transition
                  if (widget.onTapNextButton != null) {
                    widget.onTapNextButton!();
                  }
                });
              },
              onPressedBackButton: () {
                //method executed on pressing back button
                setState(() {
                  activePageIndex = max(0, activePageIndex - 1);
                  nextPageIndex = max(0, nextPageIndex - 1);
                  // after next pressed invoke function
                  // this can be used for analytics/page transition
                  if (widget.onTapBackButton != null) {
                    widget.onTapBackButton!();
                  }
                });
              },
              nextText: widget.nextText,
              doneText: widget.doneText,
              backText: widget.backText,
              skipText: widget.skipText,
              doneButtonPersist: widget.doneButtonPersist,
            ),
          ),

          PageDragger(
            //Used for gesture control
            fullTransitionPX: widget.fullTransition,
            canDragLeftToRight: activePageIndex > 0,
            canDragRightToLeft: activePageIndex < pages.length - 1,
            slideUpdateStream: slideUpdateStream,
          ), //PageDragger
        ], //Widget
      ), //Stack
    ); //Scaffold
  }
}
