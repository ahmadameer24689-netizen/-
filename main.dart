import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'sahaba_data.dart'; // استيراد ملف البيانات الذي أنشأناه للتو

void main() {
  runApp(SahabaApp());
}

class SahabaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'قصص الصحابة',
      debugShowCheckedModeBanner: false,
      locale: Locale('ar', 'AE'),
      supportedLocales: [
        Locale('ar', 'AE'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Cairo',
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قصص الصحابة رضي الله عنهم (20 صحابياً)'),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
      ),
      body: ListView.builder(
        itemCount: arabicSahabaList.length,
        itemBuilder: (context, index) {
          final sahabi = arabicSahabaList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 3,
            child: ListTile(
              title: Text(
                sahabi.arabicName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              subtitle: Text(sahabi.title),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(sahabi: sahabi),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final SahabiModel sahabi;

  DetailScreen({required this.sahabi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sahabi.arabicName),
        backgroundColor: Colors.teal[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              sahabi.arabicName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal[900],
              ),
            ),
            SizedBox(height: 5),
            Text(
              sahabi.title,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey[700],
              ),
            ),
            Divider(height: 30, thickness: 2),
            _buildSectionTitle('📌 الميلاد والنشأة والسيرة:'),
            _buildSectionContent(sahabi.birthAndLife),
            SizedBox(height: 15),
            _buildSectionTitle('🕊️ الوفاة:'),
            _buildSectionContent(sahabi.death),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.teal[700],
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
      ),
    );
  }
}

