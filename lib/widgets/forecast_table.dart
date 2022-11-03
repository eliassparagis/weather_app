import 'package:flutter/material.dart';
import '../utils/date_utils.dart' as utils;
import '../models/app_settings.dart';
import '../models/weather.dart';
import '../utils/forecast_animation_utils.dart';
import '../widgets/color_transition_icon.dart';
import '../widgets/color_transition_text.dart';

class ForecastTableView extends StatelessWidget {
  final AppSettings settings;
  final AnimationController controller;
  final ColorTween textColorTween;
  final Forecast forecast;

  ForecastTableView(
      {required this.textColorTween,
      required this.controller,
      required this.forecast,
      required this.settings});

  IconData? _getWeatherIcon(Weather weather) {
    return AnimationUtil.weatherIcons[weather.description];
  }

  int _temperature(int temp) {
    if (settings.selectedTemperature == TemperatureUnit.fahrenheit) {
      return Temperature.celsiusToFahrenheit(temp);
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        bottom: 48.0,
      ),
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(100.0),
          2: FixedColumnWidth(20.0),
          3: FixedColumnWidth(20.0),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: List.generate(7, (int index) {
          ForecastDay day = forecast.days[index];
          Weather dailyWeather = forecast.days[index].hourlyWeather[0];
          var weatherIcon = _getWeatherIcon(dailyWeather);
          return TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ColorTransitionText(
                    text: utils.DateUtils.weekdays[dailyWeather.dateTime.weekday]!,
                    style: textStyle!,
                    animation: textColorTween.animate(controller),
                  ),
                ),
              ),
              TableCell(
                child: ColorTransitionIcon(
                  icon: weatherIcon!,
                  animation: textColorTween.animate(controller),
                  size: 16.0,
                ),
              ),
              TableCell(
                child: ColorTransitionText(
                  text: _temperature(day.max).toString(),
                  style: textStyle,
                  animation: textColorTween.animate(controller),
                ),
              ),
              TableCell(
                child: ColorTransitionText(
                  text: _temperature(day.min).toString(),
                  style: textStyle,
                  animation: textColorTween.animate(controller),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
