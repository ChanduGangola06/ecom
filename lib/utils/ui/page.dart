import 'package:ecom/models/page_view_model.dart';
import 'package:flutter/material.dart';

class PageScreen extends StatelessWidget {
  final PageViewModel? pageViewModel;
  final double percentVisible;
  final MainAxisAlignment columnMainAxisAlignment;

  const PageScreen({
    super.key,
    this.pageViewModel,
    this.percentVisible = 1.0,
    this.columnMainAxisAlignment = MainAxisAlignment.spaceAround,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: pageViewModel!.pageColor,
          image: DecorationImage(
              image: AssetImage(pageViewModel!.pageBg!),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken))),
      child: Opacity(
        opacity: percentVisible,
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return orientation == Orientation.portrait
                ? _buildPortraitPage()
                : __buildLandscapePage();
          },
        ), //OrientationBuilder
      ),
    );
  }

  Widget _buildPortraitPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: Constant.size15),
            child: _TitlePageTransform(
              percentVisible: percentVisible,
              pageViewModel: pageViewModel,
            ),
          ),
        ), //Transform
        _BodyPageTransform(
          percentVisible: percentVisible,
          pageViewModel: pageViewModel,
        ), //Transform
      ],
    );
  }

  Widget __buildLandscapePage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: _ImagePageTransform(
            percentVisible: percentVisible,
            pageViewModel: pageViewModel,
          ),
        ), //Transform

        Flexible(
          child: Column(
            mainAxisAlignment: columnMainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: SafeArea(
                  child: _TitlePageTransform(
                    percentVisible: percentVisible,
                    pageViewModel: pageViewModel,
                  ),
                ),
              ), //Transform
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: _BodyPageTransform(
                    percentVisible: percentVisible,
                    pageViewModel: pageViewModel,
                  ),
                ),
              ), //Transform
            ],
          ), // Column
        ),
      ],
    );
  }
}

class _BodyPageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel? pageViewModel;

  const _BodyPageTransform(
      {super.key, required this.percentVisible, this.pageViewModel});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
