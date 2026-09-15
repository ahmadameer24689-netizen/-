import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(SahabaApp());
}

class SahabaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'قصص الصحابة',
      debugShowCheckedModeBanner: false,
      // دعم اللغة العربية وتوجيه التطبيق من اليمين لليسر
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
        primarySwatch: Colors.green,
        fontFamily: 'Cairo', // يمكنك إضافة خط عربي لاحقاً
      ),
      home: HomeScreen(),
    );
  }
}

// نموذج البيانات للصحابي
class Sahabi {
  final String name;
  final String title;
  final String birth;
  final String death;
  final String story;

  Sahabi({
    required this.name,
    required this.title,
    required this.birth,
    required this.death,
    required this.story,
  });
}

class HomeScreen extends StatelessWidget {
  // قائمة قصص الصحابة (من مولدهم حتى مماتهم)
  final List<Sahabi> sahabaList = [
    Sahabi(
      name: 'أبو بكر الصديق',
      title: 'خليفة رسول الله صلى الله عليه وسلم (الصديق)',
      birth: 'ولد بمكة بعد عام الفيل بحوالي سنتين ونصف (سنة 573 م).',
      death: 'توفي في جمادى الآخرة سنة 13 هجرياً عن عمر يناهز 63 عاماً.',
      story: 'هو أول الخلفاء الراشدين، وأول من أسلم من الرجال الأحرار. صاحب النبي صلى الله عليه وسلم في الغار، وأنفق ماله كله في سبيل الله. وقف بحزم أمام مرتدين الزكاة في حروب الردة، وكان نعم الصاحب والسند للنبي في الدعوة وبعد وفاته.',
    ),
    Sahabi(
      name: 'عمر بن الخطاب',
      title: 'أمير المؤمنين (الفاروق)',
      birth: 'ولد بمكة قبل الهجرة بحوالي 40 سنة (سنة 584 م).',
      death: 'استشهد في ذي الحجة سنة 23 هجرياً طعناً على يد أبي لؤلؤة المجوسي.',
      story: 'إسلامه كان فتحاً للمسلمين، لقبه النبي بالفاروق لأنه فرق به بين الحق والباطل. تولى الخلافة بعد أبي بكر، واتسعت في عهده فتوحات الإسلام، وعُرف بعدله الشديد، وزهده، وتواضع، ووضع التاريخ الهجري.',
    ),
    Sahabi(
      name: 'عثمان بن عفان',
      title: 'ذو النورين',
      birth: 'ولد بمكة سنة 576 م (بعد عام الفيل بست سنوات).',
      death: 'استشهد مظلوماً في دارة في ذي الحجة سنة 35 هجرياً.',
      story: 'ثالث الخلفاء الراشدين، سُمي بذي النورين لأنه تزوج رقية ثم أم كلثوم بنات النبي صلى الله عليه وسلم. عُرف بحطيم الحياء والكثرة من الصدقات، حيث تجهيز جيش العسرة، وجمع القرآن الكريم في مصحف واحد.',
    ),
    Sahabi(
      name: 'علي بن أبي طالب',
      title: 'أمير المؤمنين (أبو الحسن والباسل)',
      birth: 'ولد بمكة قبل البعثة النبوية بنحو 10 سنوات (سنة 599 م).',
      death: 'استشهد في رمضان سنة 40 هجرياً على يد عبدالرحمن بن ملجم.',
      story: 'ابن عم النبي وزوج فاطمة الزهراء، وأول من أسلم من الصبيان. بات في فراش النبي ليلة الهجرة ليحفظه. عُرف بشجاعته الفائقة في غزوات الإسلام وعلمه الواسع وقضائه الحكيم، وتولى الخلافة رابع الخلفاء الراشدين.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قصص الصحابة رضي الله عنهم'),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
      ),
      body: ListView.builder(
        itemCount: sahabaList.length,
        itemBuilder: (context, index) {
          final sahabi = sahabaList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 3,
            child: ListTile(
              title: Text(
                sahabi.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(sahabi.title),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // الانتقال لصفحة تفاصيل الصحابي
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

// صفحة تفاصيل الصحابي
class DetailScreen extends StatelessWidget {
  final Sahabi sahabi;

  DetailScreen({required this.sahabi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sahabi.name),
        backgroundColor: Colors.teal[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              sahabi.name,
              style: TextStyle(
                fontSize: 24,
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
            _buildSectionTitle('📌 الميلاد والنشأة:'),
            _buildSectionContent(sahabi.birth),
            SizedBox(height: 15),
            _buildSectionTitle('📖 سيرته العطرة وقصته مع الرسول:'),
            _buildSectionContent(sahabi.story),
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
        style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
      ),
    );
  }
}

