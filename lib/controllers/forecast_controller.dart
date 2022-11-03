import '../models/app_settings.dart';
import '../models/weather.dart';
import '../utils/generate_weather_data.dart';

class ForecastController {
  City _city;
  Forecast? forecast;
  ForecastDay? selectedDay;
  Weather? selectedHourlyTemperature;
  DateTime _today = DateTime.now();
  WeatherDataRepository _repository = WeatherDataRepository();

  ForecastController(this._city) {
    init();
  }

  City get city => _city;

  set city(City value) {
    _city = value;
    init();
  }

  init() {
    forecast = _repository.getTenDayForecast(city);
    selectedDay = Forecast.getSelectedDayForecast(
      forecast!,
      DateTime(
        _today.year,
        _today.month,
        _today.day,
      ),
    );
    selectedHourlyTemperature = ForecastDay.getWeatherForHour(
      selectedDay,
      DateTime.now().toLocal().hour,
    );
  }
}
