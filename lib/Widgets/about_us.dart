import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmagnet/Constant/color.dart';

Future<dynamic> about_us(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    )),
    builder: (context) {
      return SizedBox(
        height: 400,
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'Assets/Logo.png',
                    width: 110,
                    height: 110,
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  Text(
                    'Developed By',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      color: pcolor,
                      fontSize: 30,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  Text(
                    'HusseinMbarak',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      color: pcolorAccent.shade700,
                      fontSize: 15,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(10.0)),
                      Text(
                        'RateUs',
                        style: GoogleFonts.getFont(
                          'Nunito',
                          color: tcolor,
                          fontSize: 25,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10.0)),
                      RatingBar.builder(
                        itemSize: 50,
                        initialRating: 0,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: pcolor,
                        ),
                        onRatingUpdate: (rating) {
                          Fluttertoast.showToast(
                              msg: "Thanks for $rating Stars",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: tcolor,
                              fontSize: 16.0);
                        },
                      )
                    ],
                  ),
                ],
              )),
        ),
      );
    },
  );
}
