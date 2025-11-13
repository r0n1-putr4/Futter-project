import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugesPage extends StatefulWidget {
  const GaugesPage({super.key});

  @override
  State<GaugesPage> createState() => _GaugesPageState();
}

class _GaugesPageState extends State<GaugesPage> {

  double temperature = 27.0;
  double humidity = 65.0;

  // Fungsi untuk menentukan warna suhu
  Color getTemperatureColor(double temp) {
    if (temp < 18) return const Color(0xFF0000FF); // Biru tua
    else if (temp < 23) return const Color(0xFF00BFFF); // Biru muda
    else if (temp < 28) return const Color(0xFF00FF00); // Hijau
    else if (temp < 31) return const Color(0xFFFFD700); // Kuning
    else if (temp < 36) return const Color(0xFFFFA500); // Oranye
    else return const Color(0xFFFF0000); // Merah
  }

  // Fungsi untuk menentukan warna kelembaban
  Color getHumidityColor(double hum) {
    if (hum < 30) return const Color(0xFFFF0000); // Merah
    else if (hum < 40) return const Color(0xFFFFA500); // Oranye
    else if (hum < 61) return const Color(0xFF00FF00); // Hijau
    else if (hum < 81) return const Color(0xFF00BFFF); // Biru muda
    else return const Color(0xFF0000FF); // Biru tua
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Example Gauges'))),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    ranges: <GaugeRange>[
                      GaugeRange(startValue: 0, endValue: 18, color: Color(0xFF0000FF)),
                      GaugeRange(
                        startValue: 18,
                        endValue: 23,
                        color: Color(0xFF00BFFF),
                      ),
                      GaugeRange(
                        startValue: 23,
                        endValue: 28,
                        color: Color(0xFF00FF00),
                      ),
                      GaugeRange(startValue: 28, endValue: 31, color: Color(0xFF00FF00)),
                      GaugeRange(startValue: 31, endValue: 100, color: Color(0xFFFF0000)),

                    ],
                    pointers: <GaugePointer>[NeedlePointer(
                      value: temperature,
                      needleColor: getTemperatureColor(temperature),
                      knobStyle: const KnobStyle(color: Colors.black),
                    )],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          '$temperature C',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                '💧 Kelembaban Udara',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    ranges: <GaugeRange>[
                      GaugeRange(startValue: 0, endValue: 30, color: const Color(0xFFFF0000)),
                      GaugeRange(startValue: 30, endValue: 40, color: const Color(0xFFFFA500)),
                      GaugeRange(startValue: 40, endValue: 61, color: const Color(0xFF00FF00)),
                      GaugeRange(startValue: 61, endValue: 81, color: const Color(0xFF00BFFF)),
                      GaugeRange(startValue: 81, endValue: 100, color: const Color(0xFF0000FF)),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: humidity,
                        needleColor: getHumidityColor(humidity),
                        knobStyle: const KnobStyle(color: Colors.black),
                      )
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          '${humidity.toStringAsFixed(1)} %',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        positionFactor: 0.8,
                        angle: 90,
                      )
                    ],
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
