import 'package:ecom/utils/constants/constants.dart';

class PageButtonViewModel {
  final double? slidePercent;
  final int? totalPages;
  final int? activePageIndex;
  final SlideDirection? slideDirection;

  PageButtonViewModel({
    this.slidePercent,
    this.totalPages,
    this.activePageIndex,
    this.slideDirection,
  });
}
