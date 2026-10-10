import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const AjifujiApp());
}

class AjifujiApp extends StatelessWidget {
  const AjifujiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '味ふじ チャーシュー直販',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('味ふじ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.store),
            tooltip: '店舗情報・アクセス',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StoreInfoScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '自慢の自家製チャーシューをご家庭へお届けします。\n'
              '店舗での受け渡しも可能です。\n\n'
              'ご希望の金額をお選びください。',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.orange[800],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                _navigateToPrivacy(context, '1,500円分（税込）');
              },
              child: const Text('チャーシュー 1,500円分（税込）', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.red[700],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                _navigateToPrivacy(context, '2,000円分（税込）');
              },
              child: const Text('チャーシュー 2,000円分（税込）', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.amber[600],
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                _navigateToPrivacy(context, '3,000円分（税込）');
              },
              child: const Text('チャーシュー 3,000円分（税込）', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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

// 店舗情報・アクセス画面
class StoreInfoScreen extends StatelessWidget {
  const StoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('店舗情報・アクセス'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '味ふじ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildInfoRow('住所', '三重県鈴鹿市十宮4-10-15'),
              const Divider(height: 24),
              _buildInfoRow('電話番号', '059-382-6405'),
              const Divider(height: 24),
              _buildInfoRow('営業時間', '店舗へお問い合わせください'),
              const Divider(height: 24),
              _buildInfoRow('定休日', '毎週木曜日'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey),
          ),
        ),
        Expanded(
          child: Text(
            content,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}

class PrivacyScreen extends StatelessWidget {
  final String selectedItem;

  const PrivacyScreen({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('個人情報保護方針の確認'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '選択商品: $selectedItem',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 10),
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '【プライバシーポリシー（個人情報保護方針）】\n\n'
                  '「味ふじ」（以下、「当店」といいます。）は、お客様の個人情報保護の重要性を認識し、個人情報保護法に基づき、以下の通りプライバシーポリシーを定めます。\n\n'
                  '1. 取得する個人情報\n'
                  '当店は、チャーシューの注文および配達・お渡しに必要な以下の個人情報を取得します。\n'
                  '・お名前\n'
                  '・ご住所（配達の場合）またはお電話番号\n\n'
                  '2. 利用目的\n'
                  '取得した個人情報は、ご注文いただいたチャーシューの配達、または店頭受け取りのご連絡の目的以外には利用いたしません。\n\n'
                  '3. 安全管理\n'
                  'お客様の個人情報は厳重に管理し、不正アクセスや漏えいの防止に努めます。\n\n'
                  '管理者：辻本孝大（三重県鈴鹿市十宮4-10-15 電話番号 059-382-6405）',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('同意しない'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FulfillmentChoiceScreen(selectedItem: selectedItem),
                        ),
                      );
                    },
                    child: const Text('同意する'),
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

class FulfillmentChoiceScreen extends StatelessWidget {
  final String selectedItem;

  const FulfillmentChoiceScreen({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('受け取り方法の選択'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'ご選択内容: $selectedItem',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 20),
            const Text(
              '商品の受け取り方法をお選びください。',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.orange[800],
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.delivery_dining, size: 28),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryOrStoreScreen(selectedItem: selectedItem),
                  ),
                );
              },
              label: const Text(
                '本日、自宅への配達(21:00以降) or お店(味ふじ)での受け取り(20:00以降)を希望する（鈴鹿市内）',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.red[700],
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.store, size: 28),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdvanceReservationScreen(selectedItem: selectedItem),
                  ),
                );
              },
              label: const Text(
                'お勧め! お店（味ふじ）で受け取り 事前予約（日付-時間指定）',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeliveryOrStoreScreen extends StatelessWidget {
  final String selectedItem;

  const DeliveryOrStoreScreen({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('配達または店舗受取の選択'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'ご選択内容: $selectedItem',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 20),
            const Text(
              '以下から受取方法をお選びください。',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(18),
                backgroundColor: Colors.orange[800],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryAddressScreen(selectedItem: selectedItem),
                  ),
                );
              },
              child: const Text(
                '① 自宅への配達（21:00以降）',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(18),
                backgroundColor: Colors.red[700],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StorePickupScreen(selectedItem: selectedItem),
                  ),
                );
              },
              child: const Text(
                '② お店（味ふじ）での受け取り（20:00以降）',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    '14:00〜14:30',
    '17:30〜18:00',
    '18:00〜18:30',
    '18:30〜19:00',
    '19:00〜19:30',
    '19:30〜20:00',
    '20:00〜20:30',
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
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('店舗受取 事前予約'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ご選択内容: ${widget.selectedItem}（事前予約）',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(height: 20),
              const Text(
                '① 受取希望日をお選びください',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(
                    color: selectedDate != null ? Colors.red : Colors.grey,
                    width: selectedDate != null ? 2 : 1,
                  ),
                ),
                icon: const Icon(Icons.calendar_today, color: Colors.red),
                onPressed: () => _selectDate(context),
                label: Text(
                  selectedDate == null
                      ? '日付を選択してください'
                      : '受取日: ${selectedDate!.year}年${selectedDate!.month}月${selectedDate!.day}日',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedDate != null ? Colors.red[800] : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                '② 受取希望時間をお選びください',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: timeSlots.map((slot) {
                  final isSelected = selectedTimeSlot == slot;
                  return ChoiceChip(
                    label: Text(slot),
                    selected: isSelected,
                    selectedColor: Colors.red.shade100,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.red[900] : Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        selectedTimeSlot = selected ? slot : null;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 25),
              const Text(
                '③ お客様情報の入力',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'お名前',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: '電話番号',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
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
                  if (_nameController.text.trim().isEmpty || _phoneController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('お名前と電話番号を入力してください。')),
                    );
                    return;
                  }

                  final dateStr = '${selectedDate!.year}年${selectedDate!.month}月${selectedDate!.day}日';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodScreen(
                        selectedContent: '${widget.selectedItem} (店舗受取・事前予約)',
                        selectedDateTime: '$dateStr $selectedTimeSlot',
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

class StorePickupScreen extends StatefulWidget {
  final String selectedItem;

  const StorePickupScreen({super.key, required this.selectedItem});

  @override
  State<StorePickupScreen> createState() => _StorePickupScreenState();
}

class _StorePickupScreenState extends State<StorePickupScreen> {
  String? selectedTimeSlot;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final List<String> timeSlots = [
    '20:00〜20:15',
    '20:15〜20:30',
    '20:30〜20:45',
    '20:45〜21:00',
    '21:00〜21:15',
    '21:15〜21:30',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('店舗受取（今夜）の時間・連絡先入力'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ご選択内容: ${widget.selectedItem}（店舗受取・今夜）',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(height: 20),
              const Text(
                '■ 受取予定時刻をお選びください',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...timeSlots.map((slot) {
                final isSelected = selectedTimeSlot == slot;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(
                        color: isSelected ? Colors.red : Colors.grey,
                        width: isSelected ? 2 : 1,
                      ),
                      backgroundColor: isSelected ? Colors.red.shade50 : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedTimeSlot = slot;
                      });
                    },
                    child: Text(
                      slot,
                      style: TextStyle(
                        fontSize: 15,
                        color: isSelected ? Colors.red[800] : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              const Text(
                '■ お客様情報の入力',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'お名前',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: '電話番号',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.red[700],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (selectedTimeSlot == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('受取予定時刻を選択してください。')),
                    );
                    return;
                  }
                  if (_nameController.text.trim().isEmpty || _phoneController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('お名前と電話番号を入力してください。')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodScreen(
                        selectedContent: '${widget.selectedItem} (店舗受取・今夜)',
                        selectedDateTime: '本日 $selectedTimeSlot',
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

class DeliveryAddressScreen extends StatefulWidget {
  final String selectedItem;

  const DeliveryAddressScreen({super.key, required this.selectedItem});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  final TextEditingController _postalController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _postalController.dispose();
    _addressController.dispose();
    _buildingController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お届け先住所の入力'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ご選択内容: ${widget.selectedItem}（自宅配達 21:00以降）',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _postalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '郵便番号',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: '住所（都道府県・市区町村・番地）',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _buildingController,
                decoration: const InputDecoration(
                  labelText: '建物名・部屋番号',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: '連絡先電話番号',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.orange[800],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_addressController.text.trim().isEmpty || _phoneController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('住所と電話番号を入力してください。')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodScreen(
                        selectedContent: '${widget.selectedItem} (自宅への配達（鈴鹿市内）)',
                        selectedDateTime: '本日 21:00以降',
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

class PaymentMethodScreen extends StatefulWidget {
  final String selectedContent;
  final String selectedDateTime;

  const PaymentMethodScreen({
    super.key,
    required this.selectedContent,
    required this.selectedDateTime,
  });

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _onSelectPayment(String paymentMethod) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ご注文・ご予約の確認'),
        content: Text(
          '【内容】${widget.selectedContent}\n'
          '【日時】${widget.selectedDateTime}\n'
          '【備考】${_noteController.text.isEmpty ? "なし" : _noteController.text}\n'
          '【支払方法】$paymentMethod\n\n'
          'この内容でご注文を送信しますか？',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('キャンセル'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              _showSmsSendScreen(paymentMethod);
            },
            child: const Text('送信方法の選択へ'),
          ),
        ],
      ),
    );
  }

  // ショートメール（SMS）アプリを起動する関数
  Future<void> _launchSms(String paymentMethod) async {
    final String body = '【WEB注文】\n'
        '内容: ${widget.selectedContent}\n'
        '日時: ${widget.selectedDateTime}\n'
        '支払: $paymentMethod\n'
        '備考: ${_noteController.text.isEmpty ? "なし" : _noteController.text}';

    final Uri smsUri = Uri(
      scheme: 'sms',
      path: '07055952555',
      queryParameters: <String, String>{
        'body': body,
      },
    );

    try {
      if (await canLaunchUrl(smsUri)) {
        await launchUrl(smsUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ショートメールアプリを起動できませんでした。')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('エラーが発生しました: $e')),
      );
    }
  }

  void _showSmsSendScreen(String paymentMethod) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('ショートメールで注文送信'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('下のボタンを押すと、お使いのスマートフォンのショートメール（SMS）アプリが起動し、注文内容が自動で入力されます。'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(14),
              ),
              icon: const Icon(Icons.sms),
              label: const Text('ショートメール（SMS）で送信する', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pop(context);
                _launchSms(paymentMethod);
              },
            ),
            const SizedBox(height: 16),
            const Text(
              '【ご注文送信に関するご案内】\n'
              '※ボタンを押すと、スマホのメッセージアプリが開き、注文内容が自動入力されます。そのまま「送信」ボタンを押して完了させてください。\n'
              '※お店の携帯電話（070-5595-2555）へ直接届くため、通信エラー等でフリーズすることなく確実にご予約いただけます。',
              style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.4),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('閉じる'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お支払い方法の選択'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '【内容】${widget.selectedContent}',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(height: 4),
              Text(
                '【日時】${widget.selectedDateTime}',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '■ 備考欄（ご要望など・30文字以内）',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _noteController,
                      maxLength: 30,
                      decoration: InputDecoration(
                        hintText: 'こちらに ご記入ください',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'お支払い方法をお選びください：',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildPaymentButton(
                text: '1. 現金（お受け取り時にお支払い）',
                color: const Color(0xFF2E7D32),
                onTap: () => _onSelectPayment('1. 現金（お受け取り時にお支払い）'),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: const Text(
                  '※現在のお支払い方法は「現金のみ」となっております（店舗受取・配達時ともにお受取り時にお支払いください）。\n\n'
                  '※クレジットカードや電子マネー（PayPay等）の各種キャッシュレス決済につきましては、順次導入を予定しております。対応可能となりましたら改めてご案内いたしますので、今しばらくお待ちください。',
                  style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 2,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}