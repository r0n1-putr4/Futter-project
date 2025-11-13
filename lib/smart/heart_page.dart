import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const HeartSensorApp());
}

class HeartSensorApp extends StatelessWidget {
  const HeartSensorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heart Rate Sensor UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HeartRateScreen(),
    );
  }
}

class HeartRateScreen extends StatefulWidget {
  const HeartRateScreen({super.key});

  @override
  State<HeartRateScreen> createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen> {
  double bpm = 72; // nilai awal BPM
  final random = Random();
  final List<double> ecgData = List.generate(50, (index) => 0);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Timer untuk simulasi perubahan data setiap 500 ms
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        bpm = (65 + random.nextInt(40)) as double; // antara 65-105 BPM
        ecgData.removeAt(0);
        ecgData.add(sin(DateTime.now().millisecondsSinceEpoch / 150) * 0.8);
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Color getBpmColor(double value) {
    if (value < 70) return Colors.blueAccent;
    if (value < 100) return Colors.greenAccent;
    if (value < 120) return Colors.orangeAccent;
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Heart Rate Monitor ❤️"),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gauge detak jantung
            SfRadialGauge(
              enableLoadingAnimation: true,
              animationDuration: 800,
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 40,
                  maximum: 160,
                  ranges: <GaugeRange>[
                    GaugeRange(startValue: 40, endValue: 70, color: Colors.blueAccent),
                    GaugeRange(startValue: 70, endValue: 100, color: Colors.greenAccent),
                    GaugeRange(startValue: 100, endValue: 120, color: Colors.orangeAccent),
                    GaugeRange(startValue: 120, endValue: 160, color: Colors.redAccent),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: bpm,
                      needleColor: getBpmColor(bpm),
                      knobStyle: const KnobStyle(color: Colors.white),
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${bpm.toStringAsFixed(0)} BPM",
                            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Heart Rate",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      angle: 90,
                      positionFactor: 0.8,
                    )
                  ],
                ),
              ],
            ),
        
            const SizedBox(height: 40),
        
            // ECG-style line graph (denyut jantung bergerak)
            SizedBox(
              height: 150,
              width: double.infinity,
              child: CustomPaint(
                painter: ECGPainter(ecgData, getBpmColor(bpm)),
              ),
            ),
        
            const SizedBox(height: 20),
            const Text(
              "Monitoring real-time...",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter untuk membuat efek denyut ECG
class ECGPainter extends CustomPainter {
  final List<double> data;
  final Color color;
  ECGPainter(this.data, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final dx = size.width / (data.length - 1);
    for (int i = 0; i < data.length; i++) {
      final x = i * dx;
      final y = size.height / 2 - data[i] * (size.height / 3);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
