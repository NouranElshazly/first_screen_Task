import 'package:flutter/material.dart';

class MyFirstScreen extends StatelessWidget {
  const MyFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.food_bank_outlined),
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              'Food Delivery App',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Deliver To', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Greeting ──────────────────────────
            const Text.rich(
              TextSpan(
                text: 'Hey Halal, ',
                style: TextStyle(fontSize: 18),
                children: [
                  TextSpan(
                    text: 'Good Afternoon!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Search Bar ─────────────────────────
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Search dishes, restaurants',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ── All Categories ─────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'All Categories',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('See All', style: TextStyle(color: Colors.grey)),
                    Icon(Icons.chevron_right, color: Colors.grey, size: 18),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _chip('🔥', 'All', selected: true),
                  _chip('🌭', 'Hot Dog'),
                  _chip('🍔', 'Burger'),
                  _chip('🍕', 'Pizza'),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ── Open Restaurants ───────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Open Restaurants',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('See All', style: TextStyle(color: Colors.grey)),
                    Icon(Icons.chevron_right, color: Colors.grey, size: 18),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            _restaurantCard(
              'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800',
              'Rose Garden Restaurant',
              'Burger · Chicken · Wings',
              '4.7',
              'Free',
              '20 min',
            ),

            const SizedBox(height: 14),

            _restaurantCard(
              'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=800',
              'The Grill House',
              'Grill · BBQ · Steak',
              '4.5',
              '\$1.99',
              '30 min',
            ),
          ],
        ),
      ),
    );
  }

  // ── Category Chip ──────────────────────────
  Widget _chip(String emoji, String label, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFFFA726) : Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // ── Restaurant Card ────────────────────────
  Widget _restaurantCard(
    String imageUrl,
    String name,
    String tags,
    String rating,
    String fee,
    String time,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // الصورة
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            imageUrl,
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
            // لو الصورة اتأخرت تحمل
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: double.infinity,
                height: 180,
                color: Colors.grey.shade200,
                child: const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ),

        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(tags, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),

        Row(
          children: [
            const Icon(Icons.star_border, color: Color(0xFFFFA726), size: 18),
            const SizedBox(width: 4),
            Text(rating),
            const SizedBox(width: 16),
            const Icon(Icons.delivery_dining, color: Colors.grey, size: 18),
            const SizedBox(width: 4),
            Text(fee, style: const TextStyle(color: Colors.grey)),
            const SizedBox(width: 16),
            const Icon(Icons.access_time, color: Colors.grey, size: 18),
            const SizedBox(width: 4),
            Text(time, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
