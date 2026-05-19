import 'package:flutter/material.dart';

class LayoutPart1 extends StatefulWidget {
  const LayoutPart1({super.key});

  @override
  State<LayoutPart1> createState() => _LayoutPart1State();
}

class _LayoutPart1State extends State<LayoutPart1> {
  final data = const [
    {"tgl": "02/03/2022", "nilai": "150"},
    {"tgl": "01/02/2022", "nilai": "140"},
    {"tgl": "12/01/2022", "nilai": "170"},
    {"tgl": "11/12/2021", "nilai": "110"},
    {"tgl": "10/11/2021", "nilai": "180"},
    {"tgl": "09/10/2021", "nilai": "190"},
    {"tgl": "08/09/2021", "nilai": "160"},
    {"tgl": "07/08/2021", "nilai": "155"},
    {"tgl": "06/07/2021", "nilai": "145"},
    {"tgl": "05/06/2021", "nilai": "140"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7367F0),
        foregroundColor: Colors.white,
        title: const Text('Layout Part 1'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Welcome,",
                          style: TextStyle(
                            color: Color(0xFF7367F0),
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.25,
                          ),
                        ),
                        Text(
                          "2311102210 - Haposan Felix",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4B4B4B),
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFF7367F0),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Status Card
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4839EB), Color(0xFF7367F0)],
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Status tes TOEFL Anda:',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "LULUS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.25,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Listening\n    80',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            'Structure\n    80',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            'Reading\n    90',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // Riwayat Tes Title
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Riwayat Tes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.25,
                  ),
                ),
              ),

              // List Riwayat
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tanggal tes',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data[index]["tgl"]!,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Nilai',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data[index]["nilai"]!,
                                  style: const TextStyle(
                                    color: Color(0xFF7367F0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
