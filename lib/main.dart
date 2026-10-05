import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =========================
              // THẺ SỐ DƯ
              // =========================

              Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff2F80ED),
                      Color(0xff2875E5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(15),
                ),

                child: Stack(
                  children: [

                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        // Tiêu đề
                        Row(
                          children: const [
                            Text(
                              'SỐ DƯ HIỆN TẠI',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(width: 5),

                            Icon(
                              Icons.visibility_outlined,
                              color: Colors.white,
                              size: 13,
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // Số tiền
                        const Text(
                          '6.930.000 đ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // ICON VÍ
                    Positioned(
                      right: 0,
                      top: 25,

                      child: Container(
                        width: 55,
                        height: 55,

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          borderRadius:
                          BorderRadius.circular(12),
                        ),

                        child: const Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),

                    // Dấu gạch + chấm
                    Positioned(
                      bottom: 0,
                      left: 0,

                      child: Row(
                        children: [
                          Container(
                            width: 22,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(5),
                            ),
                          ),

                          const SizedBox(width: 6),

                          const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // =========================
              // THU NHẬP + CHI TIÊU
              // =========================

              Row(
                children: [

                  // THU NHẬP
                  Expanded(
                    child: _moneyCard(
                      icon: Icons.arrow_downward,
                      iconColor: Colors.green,
                      backgroundColor:
                      const Color(0xffEAF8EE),
                      title: 'TỔNG THU NHẬP',
                      amount: '8.000.000 đ',
                    ),
                  ),

                  const SizedBox(width: 8),

                  // CHI TIÊU
                  Expanded(
                    child: _moneyCard(
                      icon: Icons.arrow_upward,
                      iconColor: Colors.red,
                      backgroundColor:
                      const Color(0xffffeeee),
                      title: 'TỔNG CHI TIÊU',
                      amount: '1.070.000 đ',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // =========================
              // GIAO DỊCH GẦN ĐÂY
              // =========================

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  const Text(
                    'Giao dịch gần đây',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Xem tất cả',
                      style: TextStyle(
                        color: Color(0xff2875E5),
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              // =========================
              // GIAO DỊCH 1
              // =========================

              _transactionItem(
                icon: Icons.directions_car,
                iconBackground:
                const Color(0xffE8F4FF),
                title: 'Taxi',
                subtitle: 'Di chuyển',
                date: '27/09/2026',
                amount: '-120.000 đ',
                amountColor: Colors.red,
              ),

              // =========================
              // GIAO DỊCH 2
              // =========================

              _transactionItem(
                icon: Icons.restaurant,
                iconBackground:
                const Color(0xfffff1e8),
                title: 'Ăn uống',
                subtitle: 'Ăn trưa',
                date: '26/09/2026',
                amount: '-80.000 đ',
                amountColor: Colors.red,
              ),

              // =========================
              // GIAO DỊCH 3
              // =========================

              _transactionItem(
                icon: Icons.shopping_bag,
                iconBackground:
                const Color(0xfff0eaff),
                title: 'Mua sắm',
                subtitle: 'Mua quần áo',
                date: '25/09/2026',
                amount: '-350.000 đ',
                amountColor: Colors.red,
              ),

              // =========================
              // GIAO DỊCH 4
              // =========================

              _transactionItem(
                icon: Icons.payments,
                iconBackground:
                const Color(0xffe8f8ed),
                title: 'Tiền lương',
                subtitle: 'Thu nhập',
                date: '25/09/2026',
                amount: '+8.000.000 đ',
                amountColor: Colors.green,
              ),
            ],
          ),
        ),
      ),

      // =========================
      // NÚT +
      // =========================

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTransaction();
        },

        backgroundColor: const Color(0xff0878E8),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),

        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      // =========================
      // BOTTOM NAVIGATION
      // =========================

      bottomNavigationBar: BottomAppBar(
        height: 65,
        color: Colors.white,

        shape: const CircularNotchedRectangle(),

        notchMargin: 7,

        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,

          children: [

            _bottomItem(
              icon: Icons.home_outlined,
              title: 'Trang chủ',
              index: 0,
            ),

            _bottomItem(
              icon: Icons.receipt_long_outlined,
              title: 'Giao dịch',
              index: 1,
            ),

            const SizedBox(width: 45),

            _bottomItem(
              icon: Icons.bar_chart_outlined,
              title: 'Thống kê',
              index: 2,
            ),
          ],
        ),
      ),
    );
  }

  // =================================================
  // CARD THU NHẬP / CHI TIÊU
  // =================================================

  Widget _moneyCard({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required String amount,
  }) {
    return Container(
      height: 72,
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              Container(
                width: 21,
                height: 21,

                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  icon,
                  color: iconColor,
                  size: 14,
                ),
              ),

              const SizedBox(width: 5),

              Text(
                title,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 7,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Text(
            amount,
            style: TextStyle(
              color: iconColor,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // =================================================
  // GIAO DỊCH
  // =================================================

  Widget _transactionItem({
    required IconData icon,
    required Color iconBackground,
    required String title,
    required String subtitle,
    required String date,
    required String amount,
    required Color amountColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),

      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [

          // ICON
          Container(
            width: 38,
            height: 38,

            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              color: const Color(0xff1683E8),
              size: 19,
            ),
          ),

          const SizedBox(width: 10),

          // THÔNG TIN
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 2),

                Row(
                  children: [

                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.grey.shade500,
                      ),
                    ),

                    const SizedBox(width: 5),

                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 7,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // SỐ TIỀN
          Text(
            amount,
            style: TextStyle(
              color: amountColor,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // =================================================
  // BOTTOM NAVIGATION ITEM
  // =================================================

  Widget _bottomItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    final bool selected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      child: SizedBox(
        width: 70,

        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              size: 21,
              color: selected
                  ? const Color(0xff0878E8)
                  : Colors.grey,
            ),

            const SizedBox(height: 2),

            Text(
              title,
              style: TextStyle(
                fontSize: 8,
                color: selected
                    ? const Color(0xff0878E8)
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =================================================
  // THÊM GIAO DỊCH
  // =================================================

  void _showAddTransaction() {
    showModalBottomSheet(
      context: context,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),

      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              const Text(
                'Thêm giao dịch',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                leading: const CircleAvatar(
                  backgroundColor:
                  Color(0xffE8F8ED),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.green,
                  ),
                ),

                title: const Text('Thêm khoản thu'),

                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  backgroundColor:
                  Color(0xffffeeee),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.red,
                  ),
                ),

                title: const Text('Thêm khoản chi'),

                onTap: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}