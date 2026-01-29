import 'package:court/struk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pembelian extends StatefulWidget {
  final String courtName;
  final int price;
  final String type;
  

  const Pembelian({Key? key, required this.courtName, required this.price, required this.type})
    : super(key: key);

  @override
  State<Pembelian> createState() => _PembelianState();
}

class _PembelianState extends State<Pembelian> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Package Duration",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            final hour = index + 1;
            final price = widget.price * hour;
            return GestureDetector(
              onTap: () {

                // pindah ke Struk setelah pilih paket
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Struk(
                      courtName: widget.courtName,
                      basePrice: widget.price,
                      packageTitle: widget.courtName,
                      packagePrice: price,
                      packageHour: hour,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color:  Colors.grey[300] ,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Judul & deskripsi
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${hour} Hour",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.type,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    // Harga
                    Text(
                      "Rp. ${price}/ per session",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
