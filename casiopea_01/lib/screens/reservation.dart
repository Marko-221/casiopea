import 'package:flutter/material.dart';

class ResScreen extends StatefulWidget {
  const ResScreen({super.key});

  @override
  _ResScreenState createState() => _ResScreenState();
}

class _ResScreenState extends State<ResScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  int selectedPeople = 2;
  final List<String> availableTimes = [
    "7:00 pm",
    "7:30 pm",
    "7:45 pm",
    "8:00 pm",
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isReserved = false;
  String? reservedName;
  String? reservedEmail;
  String? reservedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  String getFormattedDate(DateTime date) {
    return "${date.year}/${date.month}/${date.day}";
  }

  void _bookReservation() {
    setState(() {
      isReserved = true;
      reservedName = _nameController.text;
      reservedEmail = _emailController.text;
      reservedTime = selectedTime.format(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Reservation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isReserved ? _buildReservationDetails() : _buildReservationForm(),
      ),
    );
  }

  Widget _buildReservationForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Don't want to wait?\nBook a seat now!",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => _selectDate(context),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 8),
                  Text(getFormattedDate(selectedDate)),
                ],
              ),
            ),
            InkWell(
              onTap: () => _selectTime(context),
              child: Row(
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 8),
                  Text(selectedTime.format(context)),
                ],
              ),
            ),
            DropdownButton<int>(
              value: selectedPeople,
              onChanged: (int? newValue) {
                setState(() {
                  selectedPeople = newValue!;
                });
              },
              items: <int>[1, 2, 3, 4, 5, 6].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text("$value people"),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: "Name",
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: "Email",
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Available Times",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: availableTimes.map((time) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: const Size(90, 20),
              ),
              onPressed: () {
                setState(() {
                  reservedTime = time;
                });
              },
              child: Text(time),
            );
          }).toList(),
        ),
        const SizedBox(height: 55),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, 
              fixedSize: const Size(250, 30),
            ),
            onPressed: _bookReservation,
            child: const Text("Book"),
          ),
        ),
      ],
    );
  }

  Widget _buildReservationDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Reservation Details",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          "Name: $reservedName",
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          "Email: $reservedEmail",
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          "Date: ${getFormattedDate(selectedDate)}",
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          "Time: $reservedTime",
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          "People: $selectedPeople",
          style: const TextStyle(fontSize: 22),
        ),
      ],
    );
  }
}
