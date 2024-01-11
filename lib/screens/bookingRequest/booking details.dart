import 'package:flutter/material.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final String patientName;
  final String date;
  final String time;
  final String doctorName;
  final String doctorLocation;
  final String appointmentType;
  final double amount;

  AppointmentDetailsScreen({
    required this.patientName,
    required this.date,
    required this.time,
    required this.doctorName,
    required this.doctorLocation,
    required this.appointmentType,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Appointment Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppointmentCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Patient Name', patientName),
            _buildDivider(),
            _buildDetailRow('Date', date),
            _buildDivider(),
            _buildDetailRow('Time', time),
            _buildDivider(),
            _buildDetailRow('Doctor Name', doctorName),
            _buildDivider(),
            _buildDetailRow('Doctor Location', doctorLocation),
            _buildDivider(),
            _buildDetailRow('Appointment Type', appointmentType),
            _buildDivider(),
            _buildDetailRow('Amount', '\$$amount'),
            _buildButtonsRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[300],
      height: 16.0,
      thickness: 1.0,
    );
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))),
            onPressed: () {
              // Handle cancel action
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))),
            onPressed: () {
              // Handle confirm action
            },
            child: Text(
              'Confirm',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
