import 'package:flutter/material.dart';

import '../../domain/models/property_model.dart';
import 'support/property_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<PropertyModel> get sampleProperties => [
    PropertyModel(
      id: '1',
      title: 'Trion, Kuala Lumpur',
      location: 'KL City, Kuala Lumpur',
      imageUrls: [
        'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      ],
      price: 2600,
      sqft: 690,
      bedrooms: 2,
      bathrooms: 1,
      tags: ['Move-in Now'],
      badges: ['ZERO DEPOSIT', 'COOKING READY'],
      isVerified: false,
    ),
    PropertyModel(
      id: '2',
      title: 'Casa Mutiara Bukit Bintang, Kuala Lumpur',
      location: 'Bukit Bintang, Kuala Lumpur',
      imageUrls: [
        'https://images.unsplash.com/photo-1484154218962-a197022b5858?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80',
      ],
      price: 2000,
      sqft: 420,
      bedrooms: 0,
      bathrooms: 1,
      tags: ['Video Call Viewing', 'Move-in Now'],
      badges: ['ZERO DEPOSIT', 'COOKING READY'],
      isVerified: false,
    ),
    PropertyModel(
      id: '3',
      title: 'Majestic Maxim, Kuala Lumpur',
      location: 'Cheras, Kuala Lumpur',
      imageUrls: [
        'https://images.unsplash.com/photo-1571863533956-01c88e79957e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1976&q=80',
      ],
      price: 1800,
      sqft: 650,
      bedrooms: 2,
      bathrooms: 2,
      tags: ['Move-in Now'],
      badges: ['ZERO DEPOSIT'],
      isVerified: true,
    ),
    PropertyModel(
      id: '4',
      title: 'Sunway Velocity 2, Kuala Lumpur',
      location: 'Cheras, Kuala Lumpur',
      imageUrls: [
        'https://images.unsplash.com/photo-1555636222-cae831e670b3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2077&q=80',
      ],
      price: 2200,
      sqft: 850,
      bedrooms: 3,
      bathrooms: 2,
      tags: ['Video Call Viewing', 'Move-in Now'],
      badges: ['ZERO DEPOSIT'],
      isVerified: true,
    ),
    PropertyModel(
      id: '5',
      title: 'Arte Cheras, Kuala Lumpur',
      location: 'Cheras, Kuala Lumpur',
      imageUrls: [
        'https://images.unsplash.com/photo-1493809842364-78817add7ffb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      ],
      price: 1900,
      sqft: 750,
      bedrooms: 2,
      bathrooms: 2,
      tags: ['Move-in 3 Weeks'],
      badges: ['ZERO DEPOSIT'],
      isVerified: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search by area/property name',
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.grey[900],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.white70),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.grey[600]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.yellow),
            ),
            suffixIcon: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.yellow,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.black, size: 20),
              ),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.grid_view_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location and Filter Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildLocationChip('KL', true),
                  SizedBox(width: 8),
                  _buildLocationChip('PJ', false),
                  SizedBox(width: 8),
                  _buildLocationChip('Cyberjaya', false),
                  SizedBox(width: 8),
                  _buildLocationChip('Puchong', false),
                  SizedBox(width: 8),
                  _buildLocationChip('Cheras', false),
                  SizedBox(width: 8),
                  _buildLocationChip('Bangsar', false),
                  SizedBox(width: 8),
                  _buildLocationChip('Kajang', false),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Filter buttons row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterButton('Price', Icons.keyboard_arrow_down),
                  SizedBox(width: 12),
                  _buildFilterButton('Type', Icons.keyboard_arrow_down),
                  SizedBox(width: 12),
                  _buildFilterButton('Furnish', Icons.keyboard_arrow_down),
                  SizedBox(width: 12),
                  _buildIconButton(Icons.tune),
                  SizedBox(width: 12),
                  _buildIconButton(Icons.sort),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: sampleProperties.length,
                itemBuilder: (context, index) {
                  final property = sampleProperties[index];
                  return PropertyCard(
                    property: property,
                    onTap: () {
                      debugPrint('Tapped on ${property.title}');
                    },
                    onShare: () {
                      debugPrint('Share ${property.title}');
                    },
                    onChatWithOwner: () {
                      debugPrint('Chat with owner for ${property.title}');
                    },
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.55,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationChip(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.yellow : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.yellow : Colors.grey[600]!,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey[600]!, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(width: 8),
          Icon(icon, color: Colors.white, size: 16),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey[600]!, width: 1),
      ),
      child: Icon(icon, color: Colors.white, size: 16),
    );
  }
}
