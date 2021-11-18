import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_app/components/components.dart';
import 'package:tech_news_app/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
    BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          description: description,
          imageurl: imageurl,
          url: url,
          title: title,
        );
      });
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Could not launch $url";
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, url, imageurl;
  const MyBottomSheetLayout({
    Key? key,
    required this.title,
    required this.imageurl,
    required this.description,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetWidget(imageurl: imageurl, title: title),
          Container(
            padding: const EdgeInsets.all(10),
            child:
                modifiedText(text: description, size: 16, color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: "Read Full Article",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchURL(url);
                  },
                style: GoogleFonts.lato(color: Colors.blue.shade400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
