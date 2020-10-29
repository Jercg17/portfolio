import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, size) {
        if (size.isMobile) return HeaderMobileView();
        return Container(
          height: height * .90,
          width: width * .80,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Header_body(),
                ),
                FlutterLogo(size: 300),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Header_body extends StatelessWidget {
  final bool isMobile;
  const Header_body({
    Key key,
    this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "I/'m a mobile",
          style: GoogleFonts.montserrat(fontSize: 60),
          maxLines: 1,
        ),
        SizedBox(
          height: 37,
        ),
        AutoSizeText(
          "Developer < / >",
          style: GoogleFonts.montserrat(fontSize: 60),
          maxLines: 1,
        ),
        SizedBox(
          height: isMobile ?? false ? 20 : 37,
        ),
        AutoSizeText(
          "I'm trying to make a flutter portfolio",
          style: GoogleFonts.montserrat(fontSize: 24),
        ),
        SizedBox(
          height: isMobile ?? false ? 20 : 47,
        ),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          color: Colors.redAccent,
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ?? false ? 10 : 17,
              horizontal: isMobile ?? false ? 8 : 15,
            ),
            child: AutoSizeText(
              "Contact me",
              style: GoogleFonts.montserrat(
                fontSize: isMobile ?? false ? 20 : 24,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      width: width,
      child: Column(
        children: [
          Image.asset(
            'assets/images/imageedit_6_9979574410.png',
            height: 500,
          ),
          Header_body(
            isMobile: true,
          ),
        ],
      ),
    );
  }
}
