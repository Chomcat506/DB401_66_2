class Weather {
  // eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjFmYWQwNTQzMDMxYTI2ZjhhNjAzOTMwNTRmNDQ2NGYyOGE1YjI1ZTA2YTFkNTI0MDc5NGUxODdhNGUyZjg0YzhkMjA1NTI4ZjU4YWYxM2RiIn0.eyJhdWQiOiIyIiwianRpIjoiMWZhZDA1NDMwMzFhMjZmOGE2MDM5MzA1NGY0NDY0ZjI4YTViMjVlMDZhMWQ1MjQwNzk0ZTE4N2E0ZTJmODRjOGQyMDU1MjhmNThhZjEzZGIiLCJpYXQiOjE3MDc4ODIyNDcsIm5iZiI6MTcwNzg4MjI0NywiZXhwIjoxNzM5NTA0NjQ3LCJzdWIiOiIzMDE1Iiwic2NvcGVzIjpbXX0.F9mpqc-isqnjasqp0Nar609Un5AENMo2_rG6Tryw3Le5OzASYAgw1FpRovvIvyFcrs98Jv11TQXGfYKvNg6p4TDapQXSU7I4DYyvpxgGLeSpnqpgyfk5DvQpsuCFqdz4LkCqhEgdL5KCvKVGuMfFCou6mroqTW4wsiTRqjBdPffP484rXZGeTk0hIcKzP8tpyF3MhaVjITpChzYlRcB12RWBN7CyJz5tF0xrnJnveq0Sno_2KMJsyb_txQeHLJ5GUT4EklUKr_Yr2EmaFTNKfemrShMHn61NBhU4cLAkK82b6mT5aWA80Yf4EOGW7rv_uzpThKVGP3Rus9t9d9g36nRCDWQZsT4pHFortcop9D9RzExFirgtcfKLfOUxPk2F4-hRrO-5D8vwPSpIdvTKgtt6B8xsaPXyok5obaDVZW8ljRuvMQTXV6gPncsa3in20UN_zd2uKe-ozbpGCtg_BKKDJnJ3qiaAPfSSrsqWlz8K4UU_E-6BZdzhP_4cTsYrwdavOXmFruQSObQnYqD1MftJSkHoQJ-VAbz1DZjr50c6s3mjMnYdhev6tFO-5GyWTLJI7PChhhgvkWoRsPuZ58qm9RoeL-7GmkOTuiX77oVUaJ3VOqy7QzTE3uponHFcMG8p4qZ6gPIKn_iNSPgIaJ5ZvZaZZJZf1KqmCz9cn0o
  static const _condition = [
    '',
    'ท้องฟ้าแจ่มใส (Clear)',
    'มีเมฆบางส่วน (Partly cloudy)',
    'เมฆเป็นส่วนมาก (Cloudy)',
    'มีเมฆมาก (Overcast)',
    'ฝนตกเล็กน้อย (Light rain)',
    'ฝนปานกลาง (Moderate rain)',
    'ฝนตกหนัก (Heavy rain)',
    'ฝนฟ้าคะนอง (Thunderstorm)',
    'อากาศหนาวจัด (Very cold)',
    'อากาศหนาว (Cold)',
    'อากาศเย็น (Cool)',
    'อากาศร้อนจัด (Very hot)',
  ];

  static const _symbol = [
    '',
    '🌈',
    '☁',
    '☁☁',
    '☁☁☁',
    '🌦',
    '🌧',
    '☔',
    '⛈',
    '☃',
    '⛄',
    '❄',
    '☀',
  ];
  final String address;
  final double temperature;
  final int cond;
  Weather({
    required this.address,
    required this.temperature,
    required this.cond,
  });

  String get condition => _condition[cond];
  String get symbol => _symbol[cond];
}
