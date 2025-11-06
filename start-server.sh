#!/bin/bash

# NeuroScribe Server Launcher
# Automatically detects and starts the best available HTTP server

echo "🧠 NeuroScribe - Starting Production Server..."
echo ""

PORT=8080

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Try Python 3
if command_exists python3; then
    echo "✅ Found Python 3"
    echo "🚀 Starting server on http://localhost:$PORT"
    echo ""
    echo "📝 Open this URL in your browser:"
    echo "   http://localhost:$PORT/NEUROSCRIBE_SIMPLE_WORKING.html"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    python3 -m http.server $PORT
    exit 0
fi

# Try Python 2
if command_exists python; then
    echo "✅ Found Python 2"
    echo "🚀 Starting server on http://localhost:$PORT"
    echo ""
    echo "📝 Open this URL in your browser:"
    echo "   http://localhost:$PORT/NEUROSCRIBE_SIMPLE_WORKING.html"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    python -m SimpleHTTPServer $PORT
    exit 0
fi

# Try PHP
if command_exists php; then
    echo "✅ Found PHP"
    echo "🚀 Starting server on http://localhost:$PORT"
    echo ""
    echo "📝 Open this URL in your browser:"
    echo "   http://localhost:$PORT/NEUROSCRIBE_SIMPLE_WORKING.html"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    php -S localhost:$PORT
    exit 0
fi

# Try Node.js with http-server
if command_exists npx; then
    echo "✅ Found Node.js (npx)"
    echo "🚀 Starting server on http://localhost:$PORT"
    echo ""
    echo "📝 Open this URL in your browser:"
    echo "   http://localhost:$PORT/NEUROSCRIBE_SIMPLE_WORKING.html"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    npx http-server -p $PORT
    exit 0
fi

# No server found
echo "❌ No HTTP server found!"
echo ""
echo "Please install one of the following:"
echo "  • Python 3: https://www.python.org/downloads/"
echo "  • Python 2: https://www.python.org/downloads/"
echo "  • Node.js: https://nodejs.org/"
echo "  • PHP: https://www.php.net/"
echo ""
echo "Or simply open NEUROSCRIBE_SIMPLE_WORKING.html directly in your browser!"
exit 1
