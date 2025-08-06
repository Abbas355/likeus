# 🎉 LikeUs

A customizable Flutter animation button — perfect for likes, reactions, and more.  
Inspired by Twitter's heart animation — but **you can use any icon you want**.

![preview](https://development.mitprogrammer.com/likeus_package.gif)

---

## 🚀 Features

- Smooth animation on like/unlike
- Use **any icon** — not just heart!
- Toggle behavior with async callback
- Customizable size, animation duration, and colors

---

## 📦 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  likeus: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🚀 How to Use

### ✅ Basic Usage (Default Heart Button)

By default, `LikeButton()` uses the heart icon (`Icons.favorite`) with a smooth animation:

```dart
LikeButton()
```

---

### 🎨 Custom Effects (Full Control)

You can customize the icon, animation colors, and like count using additional parameters:

```dart
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
```

---

### 🔄 Handle Like Tap with Async Request

You can manage like state with a server/API call or local logic using `onTap`:

```dart
LikeButton(
  onTap: onLikeButtonTapped,
)

Future<bool> onLikeButtonTapped(bool isLiked) async {
  // Example of sending request to server
  // final success = await sendLikeStatusToServer();

  // return success ? !isLiked : isLiked;
  return !isLiked; // mock toggle
}
```

---

## ⚙️ Parameters

| **Parameter**                | **Type**                | **Description**                                                                            | **Default**                        |
|-----------------------------|-------------------------|--------------------------------------------------------------------------------------------|------------------------------------|
| `size`                      | `double`                | Size of the like widget                                                                    | `30.0`                             |
| `animationDuration`         | `Duration`              | Duration of the like animation                                                             | `Duration(milliseconds: 1000)`     |
| `bubblesSize`               | `double`                | Total size of the bubbles (animated dots)                                                  | `size * 2.0`                       |
| `bubblesColor`              | `BubblesColor`          | Customize the color of animated bubbles                                                    | Default colors                     |
| `circleSize`                | `double`                | Final size of the animated circle                                                          | `size * 0.8`                       |
| `circleColor`               | `CircleColor`           | Starting and ending colors of the circle animation                                         | Default colors                     |
| `onTap`                     | `Future<bool> Function` | Callback triggered on tap (supports async operations)                                      | `null`                             |
| `isLiked`                   | `bool`                  | Current liked state (if `null`, always shows animation)                                    | `false`                            |
| `likeCount`                 | `int`                   | Like count to display beside the button                                                    | `null`                             |
| `likeBuilder`              | `WidgetBuilder`         | Builder to create the like icon                                                            | `null`                             |
| `countBuilder`             | `WidgetBuilder`         | Builder to customize the like count text widget                                            | `null`                             |
| `mainAxisAlignment`         | `MainAxisAlignment`     | Layout alignment inside the container                                                      | `MainAxisAlignment.center`         |
| `likeCountAnimationDuration`| `Duration`              | Duration to animate like count                                                             | `Duration(milliseconds: 500)`      |
| `likeCountAnimationType`    | `LikeCountAnimationType`| Animation style for count (`none`, `part`, `all`)                                          | `LikeCountAnimationType.part`      |
| `likeCountPadding`          | `EdgeInsets`            | Padding around the like count widget                                                       | `EdgeInsets.only(left: 3.0)`       |
| `countPosition`             | `CountPosition`         | Position of the count relative to the icon (`top`, `right`, `bottom`, `left`)              | `CountPosition.right`              |
| `countDecoration`           | `Decoration`            | Custom decoration (background, border, etc.) for the count widget                          | `null`                             |
| `postFrameCallback`         | `Function(LikeButtonState)` | Called on first frame render, gives access to the internal `LikeButtonState`         | `null`                             |
