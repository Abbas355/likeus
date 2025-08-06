import 'package:flutter/material.dart';
import 'package:likeus/likeus.dart'; // Assuming 'like_button' is the correct package name for 'LikeUs'

const double buttonSize = 40.0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media Post',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter', // Assuming Inter font is available or linked
      ),
      home: const SocialMediaPostScreen(),
    );
  }
}

class SocialMediaPostScreen extends StatefulWidget {
  const SocialMediaPostScreen({Key? key}) : super(key: key);

  @override
  _SocialMediaPostScreenState createState() => _SocialMediaPostScreenState();
}

class _SocialMediaPostScreenState extends State<SocialMediaPostScreen> {
  // Initial state for the like button
  bool _isLiked = false;
  int _likeCount = 999;

  // This method handles the tap on the LikeButton
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    // Simulate an async operation like sending data to a server
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      _isLiked = !isLiked;
      _likeCount = _isLiked ? _likeCount + 1 : _likeCount - 1;
    });
    return _isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media Post'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          constraints: const BoxConstraints(maxWidth: 400), // Max width for the post card
          child: Column(
            mainAxisSize: MainAxisSize.min, // Make column take minimum space
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSkRJwOyPZKXHdIz6m9Vq_lPX5pO5OcNjE0w&s', // Placeholder for user avatar
                      ),
                      onBackgroundImageError: (exception, stackTrace) {
                        // Fallback for image loading error
                        debugPrint('Error loading avatar: $exception');
                      },
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'TravelExplorer',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '2 hours ago',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Post Image
              Container(
                width: double.infinity,
                height: 250,
                color: Colors.grey[200],
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/5/5b/India_Gate_600x400.jpg', // Placeholder for post image
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback for image loading error
                    return Center(
                      child: Text(
                        'Image Error',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    );
                  },
                ),
              ),

              // Post Actions
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Like Button
                        LikeButton(
                          size: buttonSize,
                          isLiked: _isLiked,
                          likeCount: _likeCount,
                          onTap: onLikeButtonTapped,
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color: isLiked ? Colors.pinkAccent : Colors.grey,
                              size: buttonSize * 0.6, // Adjust icon size within button
                            );
                          },
                          countBuilder: (int? count, bool isLiked, String text) {
                            final Color color = isLiked ? Colors.pinkAccent : Colors.grey;
                            Widget result;
                            if (count == 0) {
                              result = Text(
                                'love',
                                style: TextStyle(color: color, fontSize: 14),
                              );
                            } else {
                              result = Text(
                                count! >= 1000
                                    ? '${(count / 1000.0).toStringAsFixed(1)}k'
                                    : text,
                                style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w500),
                              );
                            }
                            return result;
                          },
                          likeCountAnimationType: _likeCount < 1000
                              ? LikeCountAnimationType.part
                              : LikeCountAnimationType.none,
                          likeCountPadding: const EdgeInsets.only(left: 8.0), // Reduced padding for Flutter
                        ),
                        const SizedBox(width: 24), // Space between buttons

                        // Comment Button
                        Row(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.grey[600],
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '123',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 24),

                        // Share Button
                        Row(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.grey[600],
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Share',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Bookmark Button
                    Icon(
                      Icons.bookmark_border,
                      color: Colors.grey[600],
                      size: 24,
                    ),
                  ],
                ),
              ),

              // Post Caption
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                    children: [
                      const TextSpan(
                        text: 'TravelExplorer ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const TextSpan(
                        text: 'Soaking up the incredible views on this adventure! Every corner holds a new surprise. ',
                      ),
                      TextSpan(
                        text: '#Travel #Adventure #Nature #Wanderlust',
                        style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
