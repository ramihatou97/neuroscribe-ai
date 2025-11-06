# Desktop Shortcut Examples

These examples show how to create a desktop shortcut that makes NeuroScribe feel like a native desktop application.

---

## 🪟 Windows

### Method 1: Chrome App Mode (Recommended)

1. **Right-click on Desktop** → **New** → **Shortcut**
2. **Location/Target:**
   ```
   "C:\Program Files\Google\Chrome\Application\chrome.exe" --app=http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html
   ```
3. **Name:** `NeuroScribe`
4. **Click Finish**

### Method 2: Direct File (No Server)

1. **Right-click on Desktop** → **New** → **Shortcut**
2. **Location/Target:**
   ```
   "C:\Users\YourName\path\to\neuroscribe-ai\NEUROSCRIBE_SIMPLE_WORKING.html"
   ```
3. **Name:** `NeuroScribe`
4. **Click Finish**

### Method 3: Edge App Mode

```
"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --app=http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html
```

---

## 🍎 macOS

### Method 1: Automator Application (Recommended)

1. **Open Automator** (in Applications)
2. **New Document** → **Application**
3. **Add "Run Shell Script"** action (search for it)
4. **Paste this script:**
   ```bash
   #!/bin/bash
   open -a "Google Chrome" --args --app=http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html
   ```
5. **Save as:** `NeuroScribe.app` (to Desktop or Applications folder)
6. **Done!** Double-click to launch

### Method 2: Alfred/Spotlight Command

Create a shell script: `~/bin/neuroscribe.sh`
```bash
#!/bin/bash
open -a "Google Chrome" --args --app=http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html
```

Make executable:
```bash
chmod +x ~/bin/neuroscribe.sh
```

Now type `neuroscribe` in Spotlight or Alfred!

### Method 3: Dock Shortcut

Drag your `NeuroScribe.app` (from Method 1) to the Dock for quick access.

---

## 🐧 Linux

### Method 1: Desktop Entry File

Create: `~/.local/share/applications/neuroscribe.desktop`

```ini
[Desktop Entry]
Version=1.0
Type=Application
Name=NeuroScribe
Comment=AI-Powered Clinical Documentation
Exec=google-chrome --app=http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html
Icon=/home/username/path/to/neuroscribe-ai/icon.png
Terminal=false
Categories=Office;Medical;
```

Make executable:
```bash
chmod +x ~/.local/share/applications/neuroscribe.desktop
```

### Method 2: Shell Script

Create: `~/bin/neuroscribe`
```bash
#!/bin/bash
google-chrome --app=http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html &
```

Make executable:
```bash
chmod +x ~/bin/neuroscribe
```

---

## 🎨 Custom Icon (Optional)

You can add a custom icon to make it look even more professional:

1. **Create or download** a `.ico` (Windows), `.icns` (Mac), or `.png` (Linux) icon
2. **For Windows:** Right-click shortcut → Properties → Change Icon → Browse
3. **For Mac:** Get Info on the app → Drag icon to the top-left icon area
4. **For Linux:** Specify the icon path in the `.desktop` file

### Quick Icon Sources:
- Create custom: https://favicon.io/
- Free icons: https://www.flaticon.com/
- Material icons: https://fonts.google.com/icons

---

## 🚀 Advanced: Auto-Start Server + Launch App

### Windows Batch Script: `launch-neuroscribe.bat`

```batch
@echo off
REM Start server in background
start /min "NeuroScribe Server" cmd /c "cd /d C:\path\to\neuroscribe-ai && python -m http.server 8080"

REM Wait for server to start
timeout /t 3 /nobreak >nul

REM Launch browser in app mode
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --app=http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html
```

### Mac/Linux Shell Script: `launch-neuroscribe.sh`

```bash
#!/bin/bash

# Start server in background
cd /path/to/neuroscribe-ai
python3 -m http.server 8080 > /dev/null 2>&1 &
SERVER_PID=$!

# Wait for server
sleep 2

# Launch browser in app mode
open -a "Google Chrome" --args --app=http://localhost:8080/NEUROSCRIBE_SIMPLE_WORKING.html

# Optional: Keep script running to manage server
# Press Ctrl+C to stop both browser and server
wait $SERVER_PID
```

Make executable:
```bash
chmod +x launch-neuroscribe.sh
```

---

## 💡 Tips

1. **Always-On Server:** Use PM2 (see DEPLOYMENT_GUIDE.md) to keep the server running 24/7
2. **Startup Launch:** Add shortcut to Windows Startup folder or Mac Login Items
3. **Keyboard Shortcut:** Assign a global keyboard shortcut in your OS settings
4. **Bookmarks Bar:** Add to browser bookmarks bar for quick access
5. **Multiple Versions:** Create separate shortcuts for different versions (V3, V4, V5)

---

## 🎯 Result

After creating a desktop shortcut:
- ✅ Launches like a native application
- ✅ No browser UI (no address bar, tabs, etc.)
- ✅ Appears as separate app in taskbar/dock
- ✅ Professional appearance
- ✅ Quick access from desktop

---

**🧠 NeuroScribe - Your Desktop Medical Documentation Assistant!**
