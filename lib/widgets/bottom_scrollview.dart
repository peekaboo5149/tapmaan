import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tapmaan/models/weather.dart';

import 'one_day_forcast.dart';

class BottomScrollView extends StatelessWidget {
  final Weather locationWeather;

  BottomScrollView(this.locationWeather);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '7 days daily Forecast',
          style: GoogleFonts.openSans(
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 14.0,
        ),
        Container(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: locationWeather.daysForecast.length,
              itemBuilder: (context, index) {
                var uptoListIndex = locationWeather.daysForecast[index];
                DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                    uptoListIndex['ts'] * 1000);
                var formatter = new DateFormat('E');
                String day = formatter.format(dateTime);
                String temp = (uptoListIndex['temp']).toStringAsFixed(0);
                String icon = uptoListIndex['weather']['icon'];
                Image img = Weather().getWeatherIcon(icon);
                return OneDayForecast(day, temp, img);
              }),
        ),
      ],
    );
  }
}
