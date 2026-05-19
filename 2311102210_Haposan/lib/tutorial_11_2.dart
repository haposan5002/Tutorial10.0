import 'package:flutter/material.dart';

class MyApp11_2 extends StatefulWidget {
  const MyApp11_2({super.key});

  @override
  State<MyApp11_2> createState() => _MyApp11_2State();
}

class _MyApp11_2State extends State<MyApp11_2> {
  // Data list yang dapat ditambah secara dinamis
  final List<Map<String, String>> _data = [
    {"tgl": "02/03/2022", "nilai": "150"},
    {"tgl": "01/02/2022", "nilai": "140"},
    {"tgl": "12/01/2022", "nilai": "170"},
  ];

  // Controller untuk TextField di dalam dialog form
  final TextEditingController _tglController = TextEditingController();
  final TextEditingController _nilaiController = TextEditingController();

  @override
  void dispose() {
    _tglController.dispose();
    _nilaiController.dispose();
    super.dispose();
  }

  // Fungsi untuk menampilkan dialog form tambah data
  void _showAddDialog() {
    _tglController.clear();
    _nilaiController.clear();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Tambah Data Tes',
            style: TextStyle(
              color: Color(0xFF7367F0),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TextField Tanggal
              TextField(
                controller: _tglController,
                decoration: InputDecoration(
                  labelText: 'Tanggal (dd/mm/yyyy)',
                  labelStyle: const TextStyle(color: Color(0xFF7367F0)),
                  prefixIcon: const Icon(Icons.calendar_today,
                      color: Color(0xFF7367F0)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF7367F0)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // TextField Nilai
              TextField(
                controller: _nilaiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nilai',
                  labelStyle: const TextStyle(color: Color(0xFF7367F0)),
                  prefixIcon: const Icon(Icons.score, color: Color(0xFF7367F0)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF7367F0)),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            // Tombol Batal
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Batal',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            // Tombol Simpan
            ElevatedButton(
              onPressed: () {
                if (_tglController.text.isNotEmpty &&
                    _nilaiController.text.isNotEmpty) {
                  setState(() {
                    _data.insert(0, {
                      "tgl": _tglController.text,
                      "nilai": _nilaiController.text,
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7367F0),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 16),
              child: Text(
                'Daftar Riwayat Tes',
                style: TextStyle(
                  color: Color(0xFF7367F0),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // ListView
            Expanded(
              child: _data.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada data.\nTekan tombol + untuk menambah.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Kolom Tanggal
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today,
                                        color: Color(0xFF7367F0), size: 18),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Tanggal Tes',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          _data[index]["tgl"]!,
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Kolom Nilai
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      'Nilai',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    Text(
                                      _data[index]["nilai"]!,
                                      style: const TextStyle(
                                        color: Color(0xFF7367F0),
                                        fontSize: 22,
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
      // FAB untuk membuka dialog tambah data
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        backgroundColor: const Color(0xFF7367F0),
        foregroundColor: Colors.white,
        tooltip: 'Tambah Data',
        child: const Icon(Icons.add),
      ),
    );
  }
}
