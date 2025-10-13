import 'package:court/pembayaran.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

// formatter global
final currencyFormatter = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp ',
  decimalDigits: 0,
);

class Struk extends StatefulWidget {
  final String courtName;
  final int basePrice;
  final String packageTitle;
  final int packagePrice;
  final int packageHour;

  const Struk({
    Key? key,
    required this.courtName,
    required this.basePrice,
    required this.packageTitle,
    required this.packagePrice,
    required this.packageHour,
  }) : super(key: key);

  @override
  State<Struk> createState() => _StrukState();
}

class _StrukState extends State<Struk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Center(
          child: Text(
            "Order Summary",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card utama struk
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Text(
                      widget.courtName,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        Text(
                          " Jalan Cibalok, Blok 31b",
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Divider(thickness: 1, color: Colors.grey[300]),

                    // Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.date_range),
                            Text(
                              " Date: ",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        ),
                        Text(
                          "01/02/2030",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.hourglass_empty),
                            Text(
                              " Duration: ",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        ),
                        Text(
                          "${widget.packageHour} hours",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Divider(thickness: 1, color: Colors.grey[300]),

                    // Price per hour
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.attach_money),
                            Text(
                              " Price per Hour: ",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        ),
                        Text(
                          currencyFormatter.format(widget.basePrice),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Divider(thickness: 1, color: Colors.grey[300]),

                    // Subtotal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Subtotal (${widget.packageHour} hours): ",
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        Text(
                          currencyFormatter.format(widget.packagePrice),
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    // Service Fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Services Fee (10%): ",
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        Text(
                          currencyFormatter.format(widget.packagePrice * 0.1),
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Divider(thickness: 1.2, color: Colors.black),

                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          currencyFormatter.format(
                            widget.packagePrice + (widget.packagePrice * 0.1),
                          ),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Booking Policy Container
            Container(
              width: 440,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                " Booking Policy:\n"
                " Free cancellation up to 5 hours before your\n booking time. Equipment rental available on-\n site.",
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ),

            const SizedBox(height: 80), // biar tidak ketutup tombol
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Pembayaran(
                  courtName: widget.courtName,
                  basePrice: widget.basePrice,
                  packageTitle: widget.packageTitle,
                  packagePrice: widget.packagePrice,
                  packageHour: widget.packageHour,
                ),
              ),
            );
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose Payment Method ",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(Icons.arrow_right, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
