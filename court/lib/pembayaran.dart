import 'package:court/qris.dart';
import 'package:court/receipt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pembayaran extends StatefulWidget {
  final String courtName;
  final int basePrice;
  final String packageTitle;
  final int packageHour;
  final int packagePrice;

  const Pembayaran({
    Key? key,
    required this.courtName,
    required this.basePrice,
    required this.packageTitle,
    required this.packageHour,
    required this.packagePrice,
  }) : super(key: key);

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Text(
          "Payment Method",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose Payment",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Select your preferred payment method",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),

            const SizedBox(height: 20),

            // Card - Pay on Location
            GestureDetector(
              onTap: () {
                // Aksi kalau dipilih
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Receipt(
                      courtName: widget.courtName,
                      basePrice: widget.basePrice,
                      packageTitle: widget.packageTitle,
                      packageHour: widget.packageHour,
                      packagePrice: widget.packagePrice,
                      packagePayment: "Pay on Location",
                    ),
                  ),
                );
              },
              child: Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.wallet, color: Colors.black, size: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pay on Location",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Cash payment",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(color: Colors.black54, thickness: 0.8),
                          const SizedBox(height: 8),
                          Text(
                            "Pay with cash when you arrive at the location",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Card - Pay via QRIS
            GestureDetector(
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=> Qris(
                  courtName: widget.courtName,
                  basePrice: widget.basePrice,
                  packageTitle: widget.packageTitle,
                  packageHour: widget.packageHour,
                  packagePrice: widget.packagePrice,
                  packagePayment: "Pay via QRIS"
                ))
                );
              },
              child: Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.qr_code, color: Colors.black87, size: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pay via QRIS",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Digital Payment",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(color: Colors.black54, thickness: 0.8),
                          const SizedBox(height: 8),
                          Text(
                            "Scan QR code to pay instantly with your e-wallet",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Booking Policy
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info, color: Colors.black54),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Booking Policy\nYour payment method can't be changed after completing the order.",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
