# NeuroScribe - AI-Powered Clinical Documentation

A web-based application for generating structured neurosurgical clinical notes using AI (Google Gemini 2.5 Flash).

## Features

✅ **AI-Powered Documentation Generation**
- Converts clinical transcripts into structured consultation notes
- Includes all standard sections: Chief Complaint, HPI, PMH, Physical Exam, Assessment, Plan, ICD-10 codes

✅ **Medical Terminology Support**
- 505+ neurosurgical terms with auto-correction
- Optimized for spine and brain surgery documentation

✅ **Simple & Secure**
- Client-side only (no server required)
- API key stored encrypted in browser localStorage
- No data sent to external servers except Google Gemini API

✅ **Export Options**
- Copy to clipboard
- Download as TXT file

## 🚀 Quick Start

**Get started in under 5 minutes!** See **[QUICKSTART.md](QUICKSTART.md)** for the fastest setup.

### Desktop Deployment (No Docker/GitHub Pages Required)

NeuroScribe is a **100% client-side application** that runs entirely in your browser. Deploy it on your desktop in seconds:

#### Option 1: One-Click Launch (Easiest!)
**Windows:** Double-click `launch-neuroscribe.bat`  
**Mac/Linux:** Double-click `launch-neuroscribe.sh` (or run `./launch-neuroscribe.sh`)

✨ **Automatically starts server AND opens browser!**

#### Option 2: Manual Server Start
**Windows:** Double-click `start-server.bat`  
**Mac/Linux:** Run `./start-server.sh`  

Then manually open: http://localhost:8080/

#### Option 3: Direct File (No Server)
1. Download/clone this repository
2. Double-click `NEUROSCRIBE_SIMPLE_WORKING.html`
3. Done! ✅

📖 **Full deployment guide:** [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)  
🖥️ **Desktop shortcuts:** [DESKTOP_SHORTCUTS.md](DESKTOP_SHORTCUTS.md)

---

### API Key Setup (First Time Only)

1. **Get FREE API key:** https://makersuite.google.com/app/apikey
2. **Open browser console:** `Cmd+Option+J` (Mac) or `F12` (Windows)
3. **Paste this code** (replace with your key):

```javascript
const key = 'AIza...YOUR_KEY_HERE';
const encrypted = btoa(key.split('').reverse().join(''));
localStorage.setItem('neuroscribe_gemini_key', encrypted);
localStorage.setItem('neuroscribe_provider', 'gemini');
location.reload();
```

4. **Page reloads** → ✅ API Key Loaded - Ready to Generate

---

### Using the App

1. **Enter clinical transcript** in the left panel
2. **Click "⚡ Generate Clinical Note"**
3. **Review AI-generated documentation** in the right panel
4. **Copy or download** the result

## 📁 File Structure

### Main Application
- `NEUROSCRIBE_SIMPLE_WORKING.html` - Primary working app (standalone, all-in-one file)

### Advanced Versions
- `NEUROSCRIBE_V3_TABS.html` - Tabbed interface version
- `NEUROSCRIBE_V4_CLINICAL.html` - Clinical features version
- `NEUROSCRIBE_V5_EXPERT.html` - Expert analysis engine

### Deployment Files
- `start-server.sh` - Auto-start script for Mac/Linux
- `start-server.bat` - Auto-start script for Windows
- `QUICKSTART.md` - Fast 5-minute setup guide
- `DEPLOYMENT_GUIDE.md` - Complete deployment documentation

### Supporting Files
- `enhanced-medical-dictionary.js` - 505+ medical terms database

## Technology Stack

- **Frontend:** Pure HTML/CSS/JavaScript (no frameworks)
- **AI Model:** Google Gemini 2.5 Flash
- **Storage:** Browser localStorage (encrypted)
- **Medical Terms:** Custom 505-term neurosurgical dictionary

## Security Notes

⚠️ **IMPORTANT:**
- Your API key is stored encrypted in browser localStorage
- Keys are encrypted using base64 + character reversal (basic obfuscation)
- This is a **client-side tool** - suitable for personal use
- For production/clinical use, implement proper backend with secure key management
- **HIPAA Compliance:** This tool sends data to Google Gemini API - ensure compliance with your institution's policies

## Medical Disclaimer

⚠️ **This tool is for documentation assistance only.**
- Always review AI-generated content for accuracy
- Verify all clinical information before use in patient care
- The AI may make errors or omissions
- Healthcare providers are solely responsible for final documentation

## Browser Compatibility

✅ Tested on:
- Chrome/Edge (recommended)
- Safari
- Firefox

## License

This project is provided as-is for educational and personal use.

---

**🧠 NeuroScribe - Simplifying Clinical Documentation**
