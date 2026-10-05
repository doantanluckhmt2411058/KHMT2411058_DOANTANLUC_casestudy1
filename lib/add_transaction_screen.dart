import 'package:flutter/material.dart';
import 'edit_transaction_screen.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState
    extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  bool isExpense = true;

  String selectedCategory = 'Ăn uống';

  DateTime selectedDate = DateTime(2025, 4, 12);

  final List<String> categories = [
    'Ăn uống',
    'Di chuyển',
    'Mua sắm',
    'Học tập',
    'Khác',
  ];

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _saveTransaction() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lưu giao dịch thành công'),
          duration: Duration(seconds: 1),
        ),
      );

      Future.delayed(
        const Duration(milliseconds: 600),
            () {
          if (mounted) {
            Navigator.pop(context);
          }
        },
      );
    }
  }

  void _goToEdit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
        const EditTransactionScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  InputDecoration inputDecoration({
    String? hintText,
    String? suffixText,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      suffixText: suffixText,
      prefixIcon: prefixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 15,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Color(0xffDDE2EC),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Color(0xffDDE2EC),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Color(0xff1769FF),
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: Center(
        child: Container(
          width: 420,
          constraints: const BoxConstraints(
            maxHeight: 850,
          ),
          color: const Color(0xffF8F9FD),
          child: Column(
            children: [
              AppBar(
                backgroundColor: const Color(0xffF8F9FD),
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: const Text(
                  'Thêm giao dịch',
                  style: TextStyle(
                    color: Color(0xff17223B),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    tooltip: 'Mở màn hình sửa',
                    onPressed: _goToEdit,
                    icon: const Icon(
                      Icons.edit_outlined,
                    ),
                  ),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    10,
                    20,
                    25,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        // Chi tiêu / Thu nhập
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(9),
                            border: Border.all(
                              color: const Color(
                                0xffE0E4EE,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isExpense = true;
                                    });
                                  },
                                  child: Container(
                                    alignment:
                                    Alignment.center,
                                    decoration:
                                    BoxDecoration(
                                      color: isExpense
                                          ? const Color(
                                        0xffFF5E67,
                                      )
                                          : Colors
                                          .transparent,
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                        8,
                                      ),
                                    ),
                                    child: Text(
                                      'Chi tiêu',
                                      style: TextStyle(
                                        color: isExpense
                                            ? Colors.white
                                            : const Color(
                                          0xff17223B,
                                        ),
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isExpense = false;
                                    });
                                  },
                                  child: Container(
                                    alignment:
                                    Alignment.center,
                                    decoration:
                                    BoxDecoration(
                                      color: !isExpense
                                          ? const Color(
                                        0xffFF5E67,
                                      )
                                          : Colors
                                          .transparent,
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                        8,
                                      ),
                                    ),
                                    child: Text(
                                      'Thu nhập',
                                      style: TextStyle(
                                        color: !isExpense
                                            ? Colors.white
                                            : const Color(
                                          0xff17223B,
                                        ),
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 22),

                        const Text(
                          'Danh mục',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff17223B),
                          ),
                        ),

                        const SizedBox(height: 8),

                        DropdownButtonFormField<String>(
                          value: selectedCategory,
                          decoration: inputDecoration(
                            prefixIcon: const Icon(
                              Icons.restaurant,
                              color: Color(0xffFF5E67),
                            ),
                          ),
                          items:
                          categories.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedCategory = value;
                              });
                            }
                          },
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Số tiền',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff17223B),
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          controller: _amountController,
                          keyboardType:
                          TextInputType.number,
                          decoration: inputDecoration(
                            hintText: 'Nhập số tiền',
                            suffixText: 'đ',
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty) {
                              return 'Vui lòng nhập số tiền';
                            }

                            final amount =
                            double.tryParse(
                              value.replaceAll(',', ''),
                            );

                            if (amount == null ||
                                amount <= 0) {
                              return 'Số tiền không hợp lệ';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Ngày giao dịch',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff17223B),
                          ),
                        ),

                        const SizedBox(height: 8),

                        InkWell(
                          onTap: _selectDate,
                          borderRadius:
                          BorderRadius.circular(9),
                          child: Container(
                            height: 52,
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(9),
                              border: Border.all(
                                color: const Color(
                                  0xffDDE2EC,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  formatDate(
                                    selectedDate,
                                  ),
                                  style: const TextStyle(
                                    fontWeight:
                                    FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons
                                      .calendar_month_outlined,
                                  color:
                                  Color(0xff74809A),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Ghi chú',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff17223B),
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          controller: _noteController,
                          maxLines: 3,
                          decoration: inputDecoration(
                            hintText:
                            'Nhập ghi chú (tùy chọn)',
                          ),
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed:
                            _saveTransaction,
                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color(
                                0xff1769FF,
                              ),
                              foregroundColor:
                              Colors.white,
                              elevation: 0,
                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                  9,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Lưu',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}