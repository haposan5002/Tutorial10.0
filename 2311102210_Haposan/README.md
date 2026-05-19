<div style="font-family: 'Times New Roman', Times, serif;">

<div align="center">
  <br />

  <h1>LAPORAN PRAKTIKUM <br>
  APLIKASI BERBASIS PLATFORM
  </h1>

  <br />

  <h3>MODUL - 11<br>
    Praktikum PageView, BottomNavigationBar, dan Dialog Form Flutter
  </h3>

  <br />

 <img width="182" height="182" alt="image1" src="https://github.com/user-attachments/assets/8937914f-d19f-4e65-b983-c927c8559522" />

  <br />
  <br />
  <br />

  <h3>Disusun Oleh :</h3>

  <p>
    <strong>Haposan Felix Marcel Siregar</strong><br>
    <strong>2311102210</strong><br>
    <strong>S1 IF-11-04</strong>
  </p>

  <br />

  <h3>Dosen Pengampu :</h3>

  <p>
    <strong>Cahyo Prihantoro, S.Kom., M.Eng.</strong>
  </p>
  
  <br />

  <h3>LABORATORIUM HIGH PERFORMANCE
  <br>FAKULTAS INFORMATIKA <br>UNIVERSITAS TELKOM PURWOKERTO <br>2026</h3>
</div>

<hr>

## 1. Penjelasan Singkat Tiap Widget

Dalam pembuatan tampilan pada Modul 11 ini, digunakan berbagai *Widget* yang disediakan Flutter untuk membangun navigasi multi-halaman dan form interaktif, antara lain:

1. **PageView** : Widget yang memungkinkan pengguna untuk menggeser (*swipe*) antar halaman secara horizontal. Dikontrol oleh `PageController` sehingga perpindahan halaman dapat dipicu secara programatik. Pada program ini digunakan untuk menampung tiga halaman (Home, Email, Profile).

2. **BottomNavigationBar** : Widget yang menampilkan navigasi di bagian bawah layar berupa ikon dan label. Digunakan untuk berpindah antar halaman dalam `PageView` secara sinkron menggunakan `pc.animateToPage()`. Pada program ini terdapat tiga item: *Home*, *Email*, dan *Profile*.

3. **Navigator.push** : Mekanisme navigasi tumpukan (*stack*) bawaan Flutter. Digunakan pada halaman Home untuk menavigasi pengguna menuju halaman detail `LayoutPart1` (Dashboard TOEFL) saat teks diklik.

4. **FloatingActionButton (FAB)** : Tombol aksi melayang yang biasanya diletakkan di pojok kanan bawah layar. Pada program ini digunakan di halaman *Email* untuk memicu tampilnya dialog form penambahan data.

5. **AlertDialog** : Widget pop-up dialog untuk berinteraksi dengan pengguna. Digunakan untuk menampilkan form yang berisi dua `TextField` (Tanggal dan Nilai) agar pengguna dapat menambahkan data baru ke dalam `ListView`.

6. **ListView.builder** : Variasi dari `ListView` yang efisien untuk data dinamis dengan memanfaatkan *lazy loading*. Digunakan pada halaman *Email* untuk menampilkan daftar data tes yang dapat bertambah secara *real-time* saat pengguna menambahkan data baru melalui form dialog.

---

## 2. Struktur Project

```
project_3/
├── lib/
│   ├── main.dart             # Entry point, memanggil MyApp11_1
│   ├── tutorial_11_1.dart    # Project 2: PageView + BottomNavigationBar
│   ├── tutorial_11_2.dart    # Project 3: ListView dinamis + Dialog Form
│   └── layout_part1.dart     # Project 1: Dashboard TOEFL
├── pubspec.yaml
└── ...
```

---

## 3. Screenshot Hasil Tampilan

Berikut adalah hasil eksekusi program dari Modul 11 yang memuat ketiga project:

<br>

<div align="center">

| Halaman Home | Halaman Email (MyApp11_2) | Dialog Tambah Data |
|:---:|:---:|:---:|
| <img width="1470" height="921" alt="image" src="https://github.com/user-attachments/assets/cf98748d-9b54-43ce-b56e-3bf8b9993b45" />
 | <img width="1470" height="918" alt="image" src="https://github.com/user-attachments/assets/801e4ca9-b914-4aa6-a6c6-e7b2c7cb0982" />
 | <img width="1470" height="915" alt="image" src="https://github.com/user-attachments/assets/4f2fe68b-aa3f-4029-b6b4-7193c198bdf1" />
 |

</div>

<br>

*(Catatan: Simpan screenshot aplikasi ke dalam folder `SS` dengan nama `screenshot_modul_11_home.png`, `screenshot_modul_11_email.png`, dan `screenshot_modul_11_dialog.png`)*

---

## 4. Source Code

### 4.1 `lib/main.dart` (Entry Point)

```dart
import 'package:flutter/material.dart';
import 'tutorial_11_1.dart';

void main() {
  runApp(const MyApp11_1());
}
```

---

### 4.2 `lib/tutorial_11_1.dart` (Project 2 — PageView & BottomNavigationBar)

```dart
import 'package:flutter/material.dart';
import 'layout_part1.dart';
import 'tutorial_11_2.dart';

class MyApp11_1 extends StatelessWidget {
  const MyApp11_1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABP Minggu 11',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7367F0),
        ),
      ),
      home: const MyHomePage(title: 'ABP Minggu 11'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  final PageController pc = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: pc,
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          children: [
            // ---- Page 1: Home ----
            Center(
              child: InkWell(
                child: Text(
                  'Go to Home page',
                  style: TextStyle(fontSize: 30, color: Color(0xFF7367F0)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LayoutPart1(),
                    ),
                  );
                },
              ),
            ),
            // ---- Page 2: Email (tutorial_11-2) ----
            const MyApp11_2(),
            // ---- Page 3: Profile ----
            Center(
              child: Text(
                'Profile page',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pc.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
```

---

### 4.3 `lib/tutorial_11_2.dart` (Project 3 — ListView + Dialog Form)

```dart
import 'package:flutter/material.dart';

class MyApp11_2 extends StatefulWidget {
  const MyApp11_2({super.key});

  @override
  State<MyApp11_2> createState() => _MyApp11_2State();
}

class _MyApp11_2State extends State<MyApp11_2> {
  final List<Map<String, String>> _data = [
    {"tgl": "02/03/2022", "nilai": "150"},
    {"tgl": "01/02/2022", "nilai": "140"},
    {"tgl": "12/01/2022", "nilai": "170"},
  ];

  final TextEditingController _tglController = TextEditingController();
  final TextEditingController _nilaiController = TextEditingController();

  @override
  void dispose() {
    _tglController.dispose();
    _nilaiController.dispose();
    super.dispose();
  }

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
              TextField(
                controller: _nilaiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nilai',
                  labelStyle: const TextStyle(color: Color(0xFF7367F0)),
                  prefixIcon:
                      const Icon(Icons.score, color: Color(0xFF7367F0)),
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
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
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
                                              color: Colors.grey, fontSize: 12),
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
```

---

### 4.4 `lib/layout_part1.dart` (Project 1 — Dashboard TOEFL)

```dart
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text('Listening\n    80',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          Text('Structure\n    80',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          Text('Reading\n    90',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
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
                                const Text('Tanggal tes',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                const SizedBox(height: 4),
                                Text(data[index]["tgl"]!,
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text('Nilai',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                const SizedBox(height: 4),
                                Text(data[index]["nilai"]!,
                                    style: const TextStyle(
                                        color: Color(0xFF7367F0),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
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
```

---

## 5. Cara Menjalankan Aplikasi di Visual Studio Code

1. Buka folder `project_3` di Visual Studio Code:
   ```
   File → Open Folder → pilih ABP/project_3
   ```

2. Pastikan perangkat/emulator sudah tersambung. Bisa dicek melalui terminal:
   ```bash
   flutter devices
   ```

3. Jalankan aplikasi melalui terminal VS Code:
   ```bash
   flutter run
   ```
   Atau klik tombol ▶ **Run** pada file `lib/main.dart`.

4. Hasilnya:
   - Aplikasi akan tampil dengan **3 tab** di bagian bawah: **Home**, **Email**, **Profile**.
   - Tab **Home** → Klik teks "Go to Home page" untuk membuka halaman Dashboard TOEFL (Project 1).
   - Tab **Email** → Menampilkan `ListView` berisi riwayat tes. Klik tombol **+** di pojok kanan bawah untuk membuka form tambah data.
   - Tab **Profile** → Menampilkan teks statis "Profile page".

</div>
