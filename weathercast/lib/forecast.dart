import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjFmYWQwNTQzMDMxYTI2ZjhhNjAzOTMwNTRmNDQ2NGYyOGE1YjI1ZTA2YTFkNTI0MDc5NGUxODdhNGUyZjg0YzhkMjA1NTI4ZjU4YWYxM2RiIn0.eyJhdWQiOiIyIiwianRpIjoiMWZhZDA1NDMwMzFhMjZmOGE2MDM5MzA1NGY0NDY0ZjI4YTViMjVlMDZhMWQ1MjQwNzk0ZTE4N2E0ZTJmODRjOGQyMDU1MjhmNThhZjEzZGIiLCJpYXQiOjE3MDc4ODIyNDcsIm5iZiI6MTcwNzg4MjI0NywiZXhwIjoxNzM5NTA0NjQ3LCJzdWIiOiIzMDE1Iiwic2NvcGVzIjpbXX0.F9mpqc-isqnjasqp0Nar609Un5AENMo2_rG6Tryw3Le5OzASYAgw1FpRovvIvyFcrs98Jv11TQXGfYKvNg6p4TDapQXSU7I4DYyvpxgGLeSpnqpgyfk5DvQpsuCFqdz4LkCqhEgdL5KCvKVGuMfFCou6mroqTW4wsiTRqjBdPffP484rXZGeTk0hIcKzP8tpyF3MhaVjITpChzYlRcB12RWBN7CyJz5tF0xrnJnveq0Sno_2KMJsyb_txQeHLJ5GUT4EklUKr_Yr2EmaFTNKfemrShMHn61NBhU4cLAkK82b6mT5aWA80Yf4EOGW7rv_uzpThKVGP3Rus9t9d9g36nRCDWQZsT4pHFortcop9D9RzExFirgtcfKLfOUxPk2F4-hRrO-5D8vwPSpIdvTKgtt6B8xsaPXyok5obaDVZW8ljRuvMQTXV6gPncsa3in20UN_zd2uKe-ozbpGCtg_BKKDJnJ3qiaAPfSSrsqWlz8K4UU_E-6BZdzhP_4cTsYrwdavOXmFruQSObQnYqD1MftJSkHoQJ-VAbz1DZjr50c6s3mjMnYdhev6tFO-5GyWTLJI7PChhhgvkWoRsPuZ58qm9RoeL-7GmkOTuiX77oVUaJ3VOqy7QzTE3uponHFcMG8p4qZ6gPIKn_iNSPgIaJ5ZvZaZZJZf1KqmCz9cn0o';
  try {
    Position location = await getCurrentLocation();
    http.Response response = await http.get(
        Uri.parse(
            '$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["WeatherForecasts"][0]["forecasts"]
          [0]["data"];
      Placemark address = (await placemarkFromCoordinates(
              location.latitude, location.longitude))
          .first;
      return Weather(
          address: '${address.subLocality}\n${address.administrativeArea}',
          temperature: result['tc'],
          cond: result['cond']);
    } else {
      return Future.error(response.statusCode);
    }
  } catch (e) {
    return Future.error(e);
  }
}
