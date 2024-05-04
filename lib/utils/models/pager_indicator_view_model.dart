import 'package:ecom/utils/constants/constants.dart';
import 'package:ecom/utils/models/page_view_model.dart';

class PagerIndicatorViewModel {
  List<PageViewModel> pages;
  int activeIndex;
  SlideDirection slideDirection;
  double slidePercent;

  PagerIndicatorViewModel(
    this.pages,
    this.activeIndex,
    this.slideDirection,
    this.slidePercent,
  );
}
