import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const AjifujiApp());
}

// ==========================================
// アプリ全体の設定
// ==========================================
class AjifujiApp extends StatelessWidget {
  const AjifujiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '味ふじ 注文システム',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const WelcomeScreen(),
    );
  }
}

// ==========================================
// 1ページ目：ウェルカム画面（デザインそのまま、ご指定の文章に修正）
// ==========================================
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color indigoColor = Color(0xFF003366); 
    const Color palePurpleColor = Color(0xFF9370DB); 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('味ふじ 注文システム', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: indigoColor, 
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.ramen_dining,
                  size: 72,
                  color: Colors.orange, 
                ),
                const SizedBox(height: 20),
                const Text(
                  '味ふじ チャーシューご注文窓口',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'いつもご利用ありがとうございます。こちらからご注文いただけます。',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: palePurpleColor, width: 1.5), 
                  ),
                  child: const Text(
                    'お客様のLINEネームとして\n注文画面（入力）にお進みください',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange, 
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                    backgroundColor: Colors.orange.shade800,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductSelectScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    '発注画面を開く',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 2ページ目：商品・金額選択画面（そのまま維持）[cite: 5]
// ==========================================
class ProductSelectScreen extends StatelessWidget {
  const ProductSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color indigoColor = Color(0xFF003366);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9FA),
      appBar: AppBar(
        title: const Text('味ふじ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: indigoColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Text(
              '味ふじ創業者の両親から受け継いだ、自慢の自家製チャーシューをお店にてお受け取りいただけます。\n\n'
              'まずは【店頭でのお渡し】からスタートさせていただきます。\n'
              'いずれご自宅への配達や配送も準備が整い次第ご案内いたしますので、楽しみにお待ちいただけますと幸いです。',
              style: TextStyle(fontSize: 14, height: 1.6, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'ご希望のメニューをお選びください。',
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF003366),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                backgroundColor: Colors.orange[800],
                foregroundColor: Colors.white,
              ),
              onPressed: () => _navigateToPrivacy(context, 'チャーシュー 1,500円分（税込）'),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('チャーシュー 1,500円分（税込）', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                backgroundColor: Colors.red[700],
                foregroundColor: Colors.white,
              ),
              onPressed: () => _navigateToPrivacy(context, 'チャーシュー 2,000円分（税込）'),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('チャーシュー 2,000円分（税込）', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                backgroundColor: Colors.teal[700],
                foregroundColor: Colors.white,
              ),
              onPressed: () => _navigateToPrivacy(context, '【初めての方限定】無料サンプル'),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('【初めての方限定】無料サンプル', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                backgroundColor: Colors.blueGrey[700],
                foregroundColor: Colors.white,
              ),
              onPressed: () => _navigateToPrivacy(context, 'その他（ご希望の金額）'),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('その他', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 2),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('（ご希望の金額で心を込めてお作りします）', style: TextStyle(fontSize: 12, color: Colors.white70)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade300),
              ),
              child: const Column(
                children: [
                  Text(
                    '💡 その他の金額をご希望の場合',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '「800円分」「1,200円分」など、お好みの金額でのご注文も承ります。ご注文最後の「備考欄」にご希望の金額をご入力ください。',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPrivacy(BuildContext context, String selectedItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrivacyScreen(selectedItem: selectedItem),
      ),
    );
  }
}

// ==========================================
// 3ページ目：個人情報保護方針確認画面（そのまま維持）[cite: 5]
// ==========================================
class PrivacyScreen extends StatelessWidget {
  final String selectedItem;

  const PrivacyScreen({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    const Color indigoColor = Color(0xFF003366);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9FA),
      appBar: AppBar(
        title: const Text('個人情報保護方針の確認', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: indigoColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade300),
              ),
              child: Text(
                '選択メニュー：$selectedItem',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: const SingleChildScrollView(
                  child: Text(
                    '【プライバシーポリシー（個人情報保護方針）】\n\n'
                    '「味ふじ」（以下、「当店」といいます。）は、お客様の個人情報保護の重要性を認識し、個人情報保護法に基づき、以下の通りプライバシーポリシーを定めます。\n\n'
                    '1. 取得する個人情報\n'
                    '当店は、チャーシューの注文およびお渡しに必要な以下の個人情報を取得します。\n'
                    '・お名前（ニックネーム可）\n'
                    '・お電話番号（任意）\n\n'
                    '2. 利用目的\n'
                    '取得した個人情報は、ご注文いただいたチャーシューの店頭受け取りのご連絡の目的以外には利用いたしません。\n\n'
                    '3. 安全管理\n'
                    'お客様の個人情報は厳重に管理し、不正アクセスや漏えいの防止に努めます。\n\n'
                    '管理者：辻本孝大 (ツジモト タカヒロ) 〒513-0037 三重県鈴鹿市十宮4-10-15 . 電話番号 059-382-6405 .',
                    style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('同意しない', style: TextStyle(fontSize: 15, color: Colors.black87)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.red[700],
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdvanceReservationScreen(selectedItem: selectedItem),
                        ),
                      );
                    },
                    child: const Text('同意する', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 4ページ目：店舗受取 事前予約画面（カレンダー機能などのボタンをそのまま維持）[cite: 5]
// ==========================================
class AdvanceReservationScreen extends StatefulWidget {
  final String selectedItem;

  const AdvanceReservationScreen({super.key, required this.selectedItem});

  @override
  State<AdvanceReservationScreen> createState() => _AdvanceReservationScreenState();
}

class _AdvanceReservationScreenState extends State<AdvanceReservationScreen> {
  DateTime? selectedDate;
  String? selectedTimeSlot;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final List<String> timeSlots = [
    '11:30〜12:00',
    '12:00〜12:30',
    '12:30〜13:00',
    '13:00〜13:30',
    '13:30〜14:00',
    '14:00〜14:15',
    '18:00〜18:30',
    '18:30〜19:00',
    '19:00〜19:30',
    '19:30〜20:00',
    '20:00〜20:15',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime initialDate = DateTime.now().add(const Duration(days: 1));
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
      locale: const Locale('ja', 'JP'),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color indigoColor = Color(0xFF003366);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9FA),
      appBar: AppBar(
        title: const Text('店舗受取 事前予約', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: indigoColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ご選択内容: ${widget.selectedItem}（事前予約）',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(height: 16),
              const Text(
                '① 受取希望日をお選びください',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  backgroundColor: selectedDate != null ? Colors.green.shade100 : Colors.green.shade50,
                  foregroundColor: Colors.green.shade900,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: selectedDate != null ? Colors.green.shade700 : Colors.green.shade300,
                      width: selectedDate != null ? 2 : 1,
                    ),
                  ),
                ),
                icon: Icon(Icons.calendar_today, color: Colors.green.shade800, size: 24),
                onPressed: () => _selectDate(context),
                label: Text(
                  selectedDate == null
                      ? '日付を選択してください\n（カレンダーをご利用ください）'
                      : '受取日: ${selectedDate!.year}年${selectedDate!.month}月${selectedDate!.day}日',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '② 受取希望時間をお選びください',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(timeSlots.length, (index) {
                  final slot = timeSlots[index];
                  final isSelected = selectedTimeSlot == slot;
                  final isLunch = index < 6;
                  final baseColor = isLunch ? Colors.orange : Colors.deepPurple;

                  return ChoiceChip(
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                      child: Text(slot),
                    ),
                    selected: isSelected,
                    backgroundColor: baseColor.shade100,
                    selectedColor: baseColor.shade400,
                    labelStyle: TextStyle(
                      fontSize: 13,
                      color: isSelected ? Colors.white : baseColor.shade900,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        selectedTimeSlot = selected ? slot : null;
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: 20),
              const Text(
                '③ お客様情報の入力',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'お名前（ニックネーム可）',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: '電話番号（任意）',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(14),
                  backgroundColor: Colors.red[700],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (selectedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('受取希望日を選択してください。')),
                    );
                    return;
                  }
                  if (selectedTimeSlot == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('受取希望時間を選択してください。')),
                    );
                    return;
                  }
                  if (_nameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('お名前（ニックネーム可）を入力してください。')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodPage(
                        selectedItem: widget.selectedItem,
                        selectedDate: selectedDate!,
                        selectedTime: selectedTimeSlot!,
                        customerName: _nameController.text.trim(),
                        customerPhone: _phoneController.text.trim(),
                      ),
                    ),
                  );
                },
                child: const Text('お支払い方法の選択へ', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 5ページ目：お支払い方法画面（内容・日時・備考欄を倍の大きさに拡大 ＆ 現金のみ注記）[cite: 5]
// ==========================================
class PaymentMethodPage extends StatefulWidget {
  final String selectedItem;
  final DateTime selectedDate;
  final String selectedTime;
  final String customerName;
  final String customerPhone;

  const PaymentMethodPage({
    super.key,
    required this.selectedItem,
    required this.selectedDate,
    required this.selectedTime,
    required this.customerName,
    required this.customerPhone,
  });

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  final TextEditingController _noteController = TextEditingController();
  final int _maxLength = 50;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _sendOrderEmail(String dateStr) async {
    final String subject = '【味ふじ チャーシュー注文】';
    final String body = '味ふじチャーシューの注文予約をします。\n\n'
        '■ ご注文内容：${widget.selectedItem}\n'
        '■ 受取日時：$dateStr ${widget.selectedTime}\n'
        '■ お名前：${widget.customerName}様\n'
        '■ 電話番号：${widget.customerPhone.isNotEmpty ? widget.customerPhone : "未記入"}\n'
        '■ 備考欄：${_noteController.text.trim().isNotEmpty ? _noteController.text.trim() : "なし"}\n\n'
        'よろしくお願いいたします。';

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'ajifuji@ajifuji.com',
      query: 'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      }
    } catch (e) {
      // エラー時のフォールバック
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('メールアプリを起動しました。'), duration: Duration(seconds: 3)),
    );
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = '${widget.selectedDate.year}年${widget.selectedDate.month}月${widget.selectedDate.day}日';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'お支払い方法',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 【内容】を倍の大きさに拡大 (fontSize: 26〜28程度)
            Text(
              '【内容】 ${widget.selectedItem}（店舗受取・事前予約）',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),
            // 【日時】を倍の大きさに拡大
            Text(
              '【日時】 $dateStr ${widget.selectedTime}',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 備考欄の見出しを倍の大きさに拡大
                  const Text(
                    '■ 備考欄（ご要望など・50文字以内）',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _noteController,
                    maxLength: _maxLength,
                    maxLines: 3,
                    style: const TextStyle(fontSize: 22), // 入力文字も大きく
                    decoration: InputDecoration(
                      hintText: 'ご希望の金額や受取時のご要望がございましたらご記入ください',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      contentPadding: const EdgeInsets.all(16),
                      counterText: '',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${_noteController.text.length}/$_maxLength',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF5350),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  elevation: 3,
                ),
                onPressed: () {
                  _sendOrderEmail(dateStr);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, size: 22),
                    SizedBox(width: 8),
                    Text(
                      '現金お支払い・メールで注文する',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // 現金のみのお断り＆キャッシュレス導入予定の注釈文章
            const Text(
              '※ボタンを押すとメールアプリが立ち上がり、ご注文内容が自動で入力されます。\n\n'
              '※現在、お支払い方法は「現金のみ」となります。クレジットカードや電子マネー（PayPay等）の各種キャッシュレス決済につきましては、来年以降に順次導入を予定しております。何卒ご了承ください。',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}