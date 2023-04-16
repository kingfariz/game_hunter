import 'package:flutter/material.dart';

//COLOR
const Color primaryColor = Color(0xff21153B);
const Color softPrimaryColor = Color(0xFF45365F);
const Color darkPrimaryColor = Color(0xFF120D21);
const Color whiteColor = Color(0xffffffff);
const Color blueColor = Color(0xff2C96F1);
const Color primaryTextColor = whiteColor;
const Color greyColor = Color(0xFF515151);
const Color lightgreyColor = Color(0xff777777);

//Margins
const double defaultMargin = 16.0;

//FONT STYLES
TextStyle primaryTextStyle =
    const TextStyle(color: primaryTextColor, fontSize: 16);

TextStyle primaryBigTextStyle =
    const TextStyle(color: primaryTextColor, fontSize: 22);

TextStyle titleTextStyle = const TextStyle(
    color: primaryTextColor, fontSize: 18, fontWeight: FontWeight.w500);

TextStyle releaseDateTextStyle = const TextStyle(
    color: primaryTextColor, fontSize: 12, fontWeight: FontWeight.w300);

TextStyle appbarSearchTextStyle = const TextStyle(
    color: whiteColor, fontSize: 12, fontWeight: FontWeight.w300);

//unused yet
TextStyle productTotalReview = const TextStyle(
    color: softPrimaryColor, fontSize: 11, fontWeight: FontWeight.bold);

TextStyle productTotalReviewLight =
    const TextStyle(color: softPrimaryColor, fontSize: 11);

TextStyle productName = const TextStyle(color: greyColor, fontSize: 12);

TextStyle productPrice = const TextStyle(
    color: primaryTextColor, fontSize: 13, fontWeight: FontWeight.bold);

TextStyle productSale = const TextStyle(color: softPrimaryColor, fontSize: 11);

TextStyle buttonTextStyle = const TextStyle(
    color: primaryColor, fontSize: 18, fontWeight: FontWeight.w600);
