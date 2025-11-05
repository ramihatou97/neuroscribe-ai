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

## Quick Start

### 1. Get Your API Key

Get a FREE Google Gemini API key:
1. Visit https://makersuite.google.com/app/apikey
2. Click "Create API Key"
3. Copy the key (starts with `AIza...`)

### 2. Open the App

Simply open `NEUROSCRIBE_SIMPLE_WORKING.html` in your web browser.

### 3. Configure API Key (First Time Only)

When you first open the app, if no API key is configured:

1. Open browser console (Cmd+Option+J on Mac, F12 on Windows)
2. Paste this command (replace with your actual key):

```javascript
const key = 'AIza...YOUR_KEY_HERE';
const encrypted = btoa(key.split('').reverse().join(''));
localStorage.setItem('neuroscribe_gemini_key', encrypted);
localStorage.setItem('neuroscribe_provider', 'gemini');
location.reload();
```

3. The page will reload and show green "✅ API Key Loaded - Ready to Generate"

### 4. Use the App

1. **Enter your clinical transcript** in the left panel
2. **Click "⚡ Generate Clinical Note"**
3. **Review the AI-generated documentation** in the right panel
4. **Copy or download** the result

## File Structure

### Main Application
- `NEUROSCRIBE_SIMPLE_WORKING.html` - Primary working app (standalone, all-in-one file)

### Supporting Files
- `enhanced-medical-dictionary.js` - 505+ medical terms database
- `neuroscribe.js` - Core application logic

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
