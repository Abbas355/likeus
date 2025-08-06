# 🎉 LikeUs

A customizable Flutter animation button — perfect for likes, reactions, and more.  
Inspired by Twitter's heart animation, but **you can use any icon you want**.

![preview](https://development.mitprogrammer.com/likeus_package.gif)

---

## 🚀 Features

- Smooth animation on like/unlike
- Any icon can be used — not just heart!
- Toggle behavior with callback
- Customizable size, duration, and more

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  likeus: ^1.0.0

###  🚀 How to Use LikeUs
✅ Basic Usage (Default Behavior)
By default, the LikeButton uses the heart icon (Icons.favorite) with built-in animation:

dart
Copy
Edit
LikeButton()
This displays a heart animation similar to Twitter’s like button.

🎨 Custom Effects (Full Control)
You can fully customize the icon, colors, animations, and count behavior.

dart
Copy
Edit
LikeButton(
  size: 40,
  circleColor: CircleColor(
    start: Color(0xff00ddff),
    end: Color(0xff0099cc),
  ),
  bubblesColor: BubblesColor(
    dotPrimaryColor: Color(0xff33b5e5),
    dotSecondaryColor: Color(0xff0099cc),
  ),
  likeBuilder: (bool isLiked) {
    return Icon(
      Icons.home,
      color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
      size: 40,
    );
  },
  likeCount: 665,
  countBuilder: (int count, bool isLiked, String text) {
    final color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
    return Text(
      count == 0 ? "love" : text,
      style: TextStyle(color: color),
    );
  },
)
🔄 Handle Like Tap with Async Request
You can trigger server calls, updates, or analytics using the onTap callback:

dart
Copy
Edit
LikeButton(
  onTap: onLikeButtonTapped,
)

Future<bool> onLikeButtonTapped(bool isLiked) async {
  // Send your request to backend or handle locally
  // final bool success = await sendLikeStatusToServer();

  // return success ? !isLiked : isLiked;
  return !isLiked; // mock response
}
