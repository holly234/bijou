# Bijou Restaurant & Lounge | Mobile-First Menu Portal

A custom, high-converting, mobile-first landing page crafted for upscale dual-concept venues (Fine Dining & Lounge / Nightlife). Designed specifically for low-light, ambient venue environments where guests scan table QR codes and need instant, zero-friction menu access without vertical scrolling.

---

## 🌟 Key UX & Design Features

1. **Strict Zero-Scroll / 100dvh Lock**:
   - Engineered using CSS dynamic viewport units (`100dvh`) with `-webkit-fill-available` fallback to eliminate browser address-bar jump, bouncing, or accidental scrolling on iOS Safari and Android Chrome.
   - Fully safe-area-inset compliant (`env(safe-area-inset-top)` / `env(safe-area-inset-bottom)`).

2. **Low-Glare, Dim-Light Visual Ergonomics**:
   - Deep matte charcoal (`#121212`) and obsidian base to prevent blinding guests in ambient candlelit and mood-lit lounge spaces.
   - Ultra-high-contrast metallic gold gradient typography and surfaces exceeding WCAG AAA contrast guidelines.
   - Ambient warm amber lighting accents mirroring venue pendant lights.

3. **Thumb-Zone Dominance & Anti-Mis-Tap Architecture**:
   - Two vertically stacked hero buttons (`88px` tap height each, `100%` width) positioned dead-center in the natural arc of one-handed thumb reach.
   - Generous **22px separation gap** to eliminate mis-taps when guests are socializing.
   - **Button 1**: `RESTAURANT MENU` (Solid Gold gradient with obsidian dark text and subtle cutlery icon).
   - **Button 2**: `LOUNGE & DRINKS` (Luminous 24k gold border with rich dark card surface and cocktail coupe icon).

4. **One-Tap Guest Wi-Fi Connectivity**:
   - Centered minimalist footer with one-tap Wi-Fi modal and instant "Copy Password" clipboard action with haptic confirmation.

5. **Integrated Tactile Micro-Interactions**:
   - Haptic vibration feedback (`navigator.vibrate`) on modern smartphones.
   - Soft velvet audio click feedback via Web Audio API.
   - Smooth animated bottom-sheet drawers displaying real menu selections (Special Platters, Firewood Jollof, Gourmet Soups, Cognacs & Cocktails).
   - Style preset switcher (top right) allowing instant toggling between Hybrid Duo, All Solid Gold, and All Gold Border styles.

---

## 📁 Project Structure

```text
bijou-lounge-landing/
├── index.html           # Semantic, accessible HTML5 structure with SVG icons
├── styles.css           # Vanilla CSS design system (tokens, 100dvh, animations)
├── app.js               # Micro-interactions, haptics, bottom sheets & clipboard
├── assets/
│   └── bg.jpg           # Moody ambient lounge background
└── README.md            # Documentation & setup guide
```

---

## 🚀 Quick Start / Local Preview

To preview the landing page locally:

```bash
# Using Python
python -m http.server 8080

# Or using Node.js npx serve
npx serve .
```

Open `http://localhost:8080` in your mobile browser or toggle Device Mode in Chrome DevTools (`Cmd + Option + I` or `Ctrl + Shift + I`, then `Ctrl + Shift + M`).

---

## 🎨 Customization Guide

### 1. Changing the Venue Name & Subtitle
In `index.html`:
```html
<!-- Line 57: Brand Heading -->
<h1 class="brand-title" id="venueNameHeading">YOUR VENUE</h1>
<p class="brand-descriptor">LOUNGE & RESTAURANT</p>

<!-- Line 61: Subheadline -->
<p class="hero-subheadline">
  Welcome to <strong>Your Venue</strong>. Choose your menu to begin.
</p>
```

### 2. Updating Wi-Fi Credentials
In `app.js`:
```javascript
const WIFI_SSID = 'Your_Venue_Guest_WiFi';
const WIFI_PASS = 'YourSecretPassword2026';
```
And in `index.html`:
```html
<span class="wifi-text-label">Connect to Wi-Fi: <strong class="wifi-network-name">Your_Venue_Guest_WiFi</strong></span>
```

### 3. Pointing Buttons to External Links or PDF Menus
If you prefer direct links instead of the built-in interactive bottom-sheet modal:
Change the `<button>` tags in `index.html` to `<a>` tags:
```html
<a href="https://yourvenue.com/dining-menu.pdf" class="menu-btn menu-btn-solid-gold">
  ...
</a>
<a href="https://yourvenue.com/drinks-menu.pdf" class="menu-btn menu-btn-gold-border">
  ...
</a>
```
