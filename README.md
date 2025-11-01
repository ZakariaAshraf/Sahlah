# 🛒 Sahlah – Grocery Price Tracker

**Sahlah** is a Flutter-based mobile app that helps users compare grocery prices across supermarkets in their area.  
Users can browse categories, check recent prices, and contribute by updating price information — making shopping smarter and more transparent.

---

## 🚀 Features

✅ Browse products by category (Bakery, Dairy, Fruits, etc.)  
✅ Compare product prices across supermarkets  
✅ See “last updated” timestamps for better accuracy  
✅ Add or update product prices easily  
✅ Localized support (English / Arabic)  
✅ Firebase Firestore backend for real-time updates

---

## 📱 Screens & Flow

**1. Home Screen** – 8 main grocery categories  
**2. Subcategory Screen** – items grouped by type (e.g., Milk → Full Cream, Skimmed)  
**3. Product List Screen** – product brands + prices  
**4. Price Comparison Screen** – shows supermarket prices + last update  
**5. Update Price Form** – users can add or edit prices

---

## 🧱 Tech Stack

- **Flutter** – UI framework
- **Firebase Firestore** – cloud database
- **Firebase Authentication** – (optional for next version)
- **Localization (intl)** – English & Arabic support
- **Cubit / Riverpod** – state management (based on your choice)

---

## ⚙️ Setup Instructions

1. **Clone the repo**
   ```bash
   git clone https://github.com/ZakariaAshraf/Sahlah.git 
2. **Install dependencies**

```bash
flutter pub get
```
3. **Connect Firebase**

Create a new Firebase project.

Add your google-services.json file (for Android) in android/app/.

Enable Firestore in Firebase Console.

Run the app

```bash
flutter run
```
## 🧪 Testing & Feedback
Internal testing phase includes:

10–20 users via Firebase App Distribution

Collecting usability and feature feedback

Adjusting UI and performance based on feedback

## 🎯 Roadmap
Add product search

Add user authentication

Enable location-based supermarket filtering

Add push notifications for price drops

Admin panel for verifying price submissions

## 🎨 Design
Primary Color: #F24296

Logo: Minimal vector logo

Icons represent categories visually for both English & Arabic users.

## 💡 Inspiration
Inspired by daily price changes in groceries and the lack of a simple, transparent tool for comparing prices locally — especially for users looking to save time and money.

## 👨‍💻 Developer
Developed by: Zakaria Ashraf
Location: Egypt 🇪🇬
Built with: Flutter + Firebase
Contact: za1494800@gamil.com
