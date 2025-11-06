#!/bin/bash

# NeuroScribe Production Launcher
# Starts server and opens browser automatically

echo "🧠 NeuroScribe - Production Launcher"
echo "===================================="
echo ""

PORT=8080
URL="http://localhost:$PORT/NEUROSCRIBE_SIMPLE_WORKING.html"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to open browser
open_browser() {
    local url="$1"
    
    if command_exists open; then
        # macOS
        open -a "Google Chrome" --args --app="$url" 2>/dev/null || \
        open -a "Safari" "$url" 2>/dev/null || \
        open "$url"
    elif command_exists xdg-open; then
        # Linux
        google-chrome --app="$url" 2>/dev/null || \
        chromium --app="$url" 2>/dev/null || \
        firefox "$url" 2>/dev/null || \
        xdg-open "$url"
    else
        echo "⚠️  Could not auto-open browser. Please manually open:"
        echo "   $url"
    fi
}

# Check for Python 3
if command_exists python3; then
    echo "✅ Found Python 3"
    echo "🚀 Starting server on http://localhost:$PORT"
    echo ""
    
    # Start server in background
    python3 -m http.server $PORT > /tmp/neuroscribe-server.log 2>&1 &
    SERVER_PID=$!
    
    # Save PID for cleanup
    echo $SERVER_PID > /tmp/neuroscribe-server.pid
    
    echo "⏳ Waiting for server to start..."
    sleep 2
    
    # Check if server is running
    if ps -p "$SERVER_PID" > /dev/null; then
        echo "✅ Server started (PID: $SERVER_PID)"
        echo ""
        echo "🌐 Opening NeuroScribe..."
        echo ""
        
        # Open browser
        open_browser "$URL"
        
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "✅ NeuroScribe is running!"
        echo ""
        echo "📝 URL: $URL"
        echo "🔌 Server PID: $SERVER_PID"
        echo ""
        echo "To stop the server:"
        echo "  kill $SERVER_PID"
        echo "  or run: ./stop-server.sh"
        echo ""
        echo "Server logs: /tmp/neuroscribe-server.log"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "Press Ctrl+C to stop server and exit..."
        
        # Wait for user interrupt
        trap "echo ''; echo '🛑 Stopping server...'; kill \"$SERVER_PID\" 2>/dev/null; rm -f /tmp/neuroscribe-server.pid; echo '✅ Server stopped'; exit 0" INT TERM
        
        # Keep script running
        wait "$SERVER_PID"
    else
        echo "❌ Server failed to start"
        exit 1
    fi
    
elif command_exists python; then
    echo "✅ Found Python 2"
    echo "🚀 Starting server on http://localhost:$PORT"
    echo ""
    
    # Start server in background
    python -m SimpleHTTPServer $PORT > /tmp/neuroscribe-server.log 2>&1 &
    SERVER_PID=$!
    
    echo $SERVER_PID > /tmp/neuroscribe-server.pid
    
    echo "⏳ Waiting for server to start..."
    sleep 2
    
    if ps -p "$SERVER_PID" > /dev/null; then
        echo "✅ Server started (PID: $SERVER_PID)"
        echo ""
        echo "🌐 Opening NeuroScribe..."
        echo ""
        
        open_browser "$URL"
        
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "✅ NeuroScribe is running!"
        echo ""
        echo "📝 URL: $URL"
        echo "🔌 Server PID: $SERVER_PID"
        echo ""
        echo "To stop: kill $SERVER_PID or ./stop-server.sh"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "Press Ctrl+C to stop server and exit..."
        
        trap "echo ''; echo '🛑 Stopping server...'; kill \"$SERVER_PID\" 2>/dev/null; rm -f /tmp/neuroscribe-server.pid; echo '✅ Server stopped'; exit 0" INT TERM
        
        wait "$SERVER_PID"
    else
        echo "❌ Server failed to start"
        exit 1
    fi
    
else
    echo "❌ No Python found!"
    echo ""
    echo "Please install Python from: https://www.python.org/"
    echo ""
    echo "Or simply open NEUROSCRIBE_SIMPLE_WORKING.html directly in your browser!"
    exit 1
fi
