import 'package:court/receipt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Qris extends StatefulWidget {
  final String courtName;
  final int basePrice;
  final String packageTitle;
  final int packageHour;
  final int packagePrice;
  final String packagePayment;

  const Qris({
    Key? key,
    required this.courtName,
    required this.basePrice,
    required this.packageTitle,
    required this.packageHour,
    required this.packagePrice, 
    required this.packagePayment,
  }) : super(key: key);

  @override
  State<Qris> createState() => _QrisState();
}

class _QrisState extends State<Qris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "QRIS Payment",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Payment Amount",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Rp. ${widget.packagePrice + (widget.packagePrice * 0.1)}",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // QRIS Container (centered)
              Center(
                child: Container(
                  width: 220,
                  height: 220,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/Qr.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 24),
              Text(
                "Scan to Pay",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Point your camera at the QR code",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Open your mobile banking or e-wallet app\nand scan the QR code above to complete your payment",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 28),

              // Confirm Button
              GestureDetector(
                onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => Receipt(
                       courtName: widget.courtName,
                       basePrice: widget.basePrice,
                       packageTitle: widget.packageTitle,
                       packageHour: widget.packageHour,
                       packagePrice: widget.packagePrice,
                       packagePayment: widget.packagePayment,
                     ),
                   ),
                 );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "I Have Paid",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Share & Save Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share, size: 20, color: Colors.grey[600]),
                  const SizedBox(width: 6),
                  Text(
                    "Share",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Icon(Icons.save_alt, size: 20, color: Colors.grey[600]),
                  const SizedBox(width: 6),
                  Text(
                    "Save",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
