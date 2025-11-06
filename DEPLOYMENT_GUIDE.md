# NeuroScribe - Desktop Deployment Guide

This guide explains how to deploy and run NeuroScribe as a production-ready application on your desktop **without Docker or GitHub Pages**.

## 🚀 Quick Start (Simplest Method)

### Option 1: Direct File Opening (Easiest)

1. **Download or clone this repository** to your desktop
2. **Double-click** `NEUROSCRIBE_SIMPLE_WORKING.html` to open it in your browser
3. **Configure your API key** (first time only) - see [API Key Setup](#api-key-setup) below
4. **Start using the app** immediately!

✅ **This is the simplest production deployment** - no server needed since the app is 100% client-side.

---

## 🖥️ Option 2: Local HTTP Server (Recommended for Production)

For better compatibility and to avoid browser security restrictions, run a local HTTP server:

### Using Python (Built-in on Mac/Linux)

```bash
# Navigate to the project folder
cd /path/to/neuroscribe-ai

# Python 3 (recommended)
python3 -m http.server 8080

# Python 2 (if Python 3 is not available)
python -m SimpleHTTPServer 8080
```

Then open: **http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html**

### Using Node.js

```bash
# Install http-server globally (one-time setup)
npm install -g http-server

# Navigate to the project folder
cd /path/to/neuroscribe-ai

# Start the server
http-server -p 8080

# Or use npx (no installation needed)
npx http-server -p 8080
```

Then open: **http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html**

### Using PHP (If installed)

```bash
cd /path/to/neuroscribe-ai
php -S localhost:8080
```

Then open: **http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html**

---

## 🔐 API Key Setup

### First Time Configuration

1. **Get your FREE Google Gemini API key:**
   - Visit: https://makersuite.google.com/app/apikey
   - Click "Create API Key"
   - Copy the key (starts with `AIza...`)

2. **Open the app** in your browser

3. **Configure the key:**
   - Open browser console:
     - **Mac:** `Cmd + Option + J`
     - **Windows/Linux:** `F12` or `Ctrl + Shift + J`
   
   - Paste this code (replace `YOUR_KEY_HERE` with your actual key):

   ```javascript
   const key = 'AIza...YOUR_KEY_HERE';
   const encrypted = btoa(key.split('').reverse().join(''));
   localStorage.setItem('neuroscribe_gemini_key', encrypted);
   localStorage.setItem('neuroscribe_provider', 'gemini');
   location.reload();
   ```

4. **The page will reload** and show: ✅ **API Key Loaded - Ready to Generate**

### Your API key is:
- ✅ Stored encrypted in browser localStorage
- ✅ Never sent to any server except Google Gemini API
- ✅ Persistent across browser sessions
- ✅ Only accessible from your browser on your machine

---

## 📦 Production Deployment Options

### Option A: Self-Contained Desktop App (Electron - Optional)

If you want a true desktop application with a window, install Electron:

```bash
# Install Electron
npm install -g electron

# Create a simple Electron wrapper (see electron-setup below)
```

### Option B: Desktop Shortcut to Browser

**Windows:**
1. Right-click desktop → New → Shortcut
2. Enter: `"C:\Program Files\Google\Chrome\Application\chrome.exe" --app=file:///C:/path/to/neuroscribe-ai/NEUROSCRIBE_SIMPLE_WORKING.html`
3. Name it "NeuroScribe"
4. Now you have a desktop app!

**Mac:**
1. Open Automator → New → Application
2. Add "Run Shell Script" action:
   ```bash
   open -a "Google Chrome" --args --app=file:///Users/yourname/path/to/neuroscribe-ai/NEUROSCRIBE_SIMPLE_WORKING.html
   ```
3. Save as "NeuroScribe.app"

**Linux:**
Create `neuroscribe.desktop`:
```
[Desktop Entry]
Name=NeuroScribe
Exec=google-chrome --app=file:///home/username/path/to/neuroscribe-ai/NEUROSCRIBE_SIMPLE_WORKING.html
Icon=/home/username/path/to/icon.png
Type=Application
```

---

## 🛠️ Advanced: Always-Running Server

### Using PM2 (Keeps server running in background)

```bash
# Install PM2
npm install -g pm2 http-server

# Start server and keep it running
pm2 start http-server --name neuroscribe -- /path/to/neuroscribe-ai -p 8080

# Configure to start on system boot
pm2 startup
pm2 save

# Check status
pm2 status

# Stop server
pm2 stop neuroscribe
```

Now you can access NeuroScribe anytime at: **http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html**

---

## 🔧 Troubleshooting

### "File not found" or CORS errors
- Use Option 2 (HTTP server) instead of opening file directly
- Ensure you're in the correct directory when starting the server

### API key not persisting
- Check browser localStorage settings (ensure cookies/storage is enabled)
- Try a different browser
- Clear browser cache and reconfigure

### Can't access from other devices on network
- When starting the server, bind to `0.0.0.0`:
  ```bash
  python3 -m http.server 8080 --bind 0.0.0.0
  http-server -p 8080 -a 0.0.0.0
  ```
- Find your local IP: `ipconfig` (Windows) or `ifconfig` (Mac/Linux)
- Access from other devices: `http://YOUR_IP:8080/NEUROSCRIBE_SIMPLE_WORKING.html`
- **Note:** Ensure your firewall allows connections on port 8080

---

## 🔒 Security Considerations

### For Personal Use:
- ✅ The simple file-based deployment is perfectly secure
- ✅ API key is stored encrypted in browser
- ✅ No external servers (except Google Gemini API)

### For Clinical/Production Use:
- ⚠️ **HIPAA Compliance:** Data is sent to Google Gemini API
- ⚠️ Consider institutional policies before clinical use
- ⚠️ Implement proper backend with secure key management for multi-user deployments
- ⚠️ Use HTTPS for network access (consider using a reverse proxy like nginx)

---

## 📋 System Requirements

- **Operating System:** Windows, Mac, or Linux
- **Browser:** Chrome, Edge, Safari, or Firefox (latest version)
- **Internet Connection:** Required for AI generation (API calls to Google Gemini)
- **Storage:** ~50 KB for the app files
- **RAM:** Minimal (~50 MB)

---

## 🎯 Which Deployment Method Should I Use?

| Method | Best For | Pros | Cons |
|--------|----------|------|------|
| **Direct File Opening** | Personal use, quick testing | Simplest, no setup | May have browser restrictions |
| **HTTP Server (Python)** | Production desktop use | Professional, reliable | Requires Python |
| **HTTP Server (Node)** | Developers with Node.js | Fast, feature-rich | Requires Node.js |
| **PM2 + HTTP Server** | Always-on desktop server | Auto-restart, background | More setup |
| **Desktop Shortcut** | Daily use, looks like app | Convenient, professional | Still needs browser |

---

## ✅ Recommended Production Setup

For the **best production experience** on your desktop:

1. **Use Python HTTP Server** (built-in, reliable)
2. **Configure API key** once
3. **Create desktop shortcut** to http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html
4. **Optional:** Use PM2 to keep server running in background

This gives you a professional, production-ready setup without Docker or cloud deployment!

---

## 📞 Support

If you encounter issues:
1. Check the browser console (F12) for errors
2. Verify API key is configured correctly
3. Ensure internet connection for API calls
4. Try a different browser

---

**🧠 NeuroScribe - Production Ready for Your Desktop!**
