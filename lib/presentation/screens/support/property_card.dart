import 'package:flutter/material.dart';

import '../../../domain/models/property_model.dart';

class PropertyCard extends StatefulWidget {
  final PropertyModel property;
  final VoidCallback? onTap;
  final VoidCallback? onShare;
  final VoidCallback? onChatWithOwner;

  const PropertyCard({
    super.key,
    required this.property,
    this.onTap,
    this.onShare,
    this.onChatWithOwner,
  });

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  final PageController _pageController = PageController();
  int _currentImageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[800]!, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleAndLocation(),
                    SizedBox(height: 6),
                    _buildPropertyDetails(),
                    SizedBox(height: 8),
                    _buildTags(),
                    Spacer(),
                    _buildPriceAndActions(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentImageIndex = index;
              });
            },
            itemCount: widget.property.imageUrls.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  widget.property.imageUrls[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[800],
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[600],
                        size: 30,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.grey[800],
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.yellow,
                          strokeWidth: 2,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.property.badges.take(2).map((badge) {
                // Limit badges
                return Container(
                  margin: EdgeInsets.only(bottom: 2),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: badge == 'ZERO DEPOSIT'
                        ? Colors.purple
                        : Colors.blue,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    badge,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          if (widget.property.isVerified)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified, size: 10, color: Colors.black),
                    SizedBox(width: 2),
                    Text(
                      'VERIFIED',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (widget.property.imageUrls.length > 1)
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${_currentImageIndex + 1}/${widget.property.imageUrls.length}',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          Positioned(
            top: 8,
            right:
                8 +
                (widget.property.isVerified
                    ? 65
                    : 0), // adjust for verified badge
            child: GestureDetector(
              onTap: widget.onShare,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.property.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 2),
        Text(
          widget.property.location,
          style: TextStyle(color: Colors.grey[400], fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildPropertyDetails() {
    return Row(
      children: [
        Icon(Icons.square_foot, size: 14, color: Colors.grey[400]),
        SizedBox(width: 2),
        Text(
          '${widget.property.sqft}',
          style: TextStyle(color: Colors.grey[400], fontSize: 11),
        ),
        SizedBox(width: 8),
        Icon(Icons.bed, size: 14, color: Colors.grey[400]),
        SizedBox(width: 2),
        Text(
          '${widget.property.bedrooms}',
          style: TextStyle(color: Colors.grey[400], fontSize: 11),
        ),
        SizedBox(width: 8),
        Icon(Icons.bathroom, size: 14, color: Colors.grey[400]),
        SizedBox(width: 2),
        Text(
          '${widget.property.bathrooms}',
          style: TextStyle(color: Colors.grey[400], fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildTags() {
    if (widget.property.tags.isEmpty) return SizedBox.shrink();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey[600]!, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        widget.property.tags.first,
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }

  Widget _buildPriceAndActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RM ${widget.property.price.toInt()}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 32,
          child: ElevatedButton(
            onPressed: widget.onChatWithOwner,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
            child: Text(
              'Chat with Owner',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
