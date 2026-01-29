import 'dart:io';

import 'package:court/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class Receipt extends StatefulWidget {
  final String courtName;
  final int basePrice;
  final String packageTitle;
  final int packageHour;
  final int packagePrice;
  final String packagePayment;

  const Receipt({
    Key? key,
    required this.courtName,
    required this.basePrice,
    required this.packageTitle,
    required this.packageHour,
    required this.packagePrice,
    required this.packagePayment,
  }) : super(key: key);

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  /// ================== GENERATE PDF ==================
  Future<void> generateReceiptPDF() async {
    // REQUEST PERMISSION
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Storage permission denied")),
      );
      return;
    }

    final pdf = pw.Document();
    final total = widget.packagePrice + (widget.packagePrice * 0.1);

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "Booking Receipt",
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),
            pw.Text("Court : ${widget.courtName}"),
            pw.Text("Duration : ${widget.packageHour} hour"),
            pw.Text("Payment : ${widget.packagePayment}"),
            pw.SizedBox(height: 10),
            pw.Divider(),
            pw.Text(
              "Total : Rp. ${total.toInt()}",
              style: pw.TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );

    final directory = await getExternalStorageDirectory();
    final path = "${directory!.path}/receipt.pdf";
    final file = File(path);

    await file.writeAsBytes(await pdf.save());

    await OpenFile.open(path);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Receipt downloaded successfully")),
    );
  }

  /// ================== UI ==================
  @override
  Widget build(BuildContext context) {
    final total = widget.packagePrice + (widget.packagePrice * 0.1);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 100, color: Colors.green),
              const SizedBox(height: 20),
              Text(
                "Booking Successful",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Your court has been reserved successfully",
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              const SizedBox(height: 30),

              Container(
                width: 450,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Booking Details",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),

                    _row("Court Name", widget.courtName),
                    _row("Date", "01/02/2030"),
                    _row("Duration", "${widget.packageHour} hour"),
                    _row("Payment", widget.packagePayment),

                    const Divider(),
                    _row("Total", "Rp. ${total.toInt()}", isBold: true),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// DOWNLOAD BUTTON
              GestureDetector(
                onTap: () async {
                  await generateReceiptPDF();
                },
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Download Receipt",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// BACK HOME
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Back to Home",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
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

  Widget _row(String left, String right, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: GoogleFonts.poppins(fontSize: 14)),
          Text(
            right,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
