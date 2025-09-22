import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  final String assetImage;
  final String name;
  final String specialization;
  final int date;
  final String month;
  final int reviews;
  final double rating;
  final double amount;
  final int time = DateTime.now().hour;
  final VoidCallback? onTap;

  DoctorCard({
    super.key,
    required this.assetImage,
    required this.name,
    required this.specialization,
    required this.date,
    required this.month,
    required this.reviews,
    required this.amount,
    required this.rating,
    required time,
    required this.onTap,
  });
  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Container(
        width: 400,
        height: 140,
        padding: EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xFF6295E2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/Eleanor Pena.png',
                      width: 60,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Text(
                            ('${widget.name}\n${widget.specialization}'),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(width: screenWidth * 0.20),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              (((widget.reviews)
                                  .toString())), // Still needs to work on this review

                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                            size: 24,
                          ),
                          Text(
                            (widget.rating).toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    (widget.date).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    (widget.month),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.access_time, size: 16, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    (widget.time.toString()),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    (widget.amount).toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
