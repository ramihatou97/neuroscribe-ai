#!/bin/bash

# NeuroScribe Server Stopper
# Stops the server started by launch-neuroscribe.sh

echo "🛑 NeuroScribe - Server Stopper"
echo "==============================="
echo ""

PID_FILE="/tmp/neuroscribe-server.pid"

if [ -f "$PID_FILE" ]; then
    SERVER_PID=$(cat "$PID_FILE")
    
    if ps -p "$SERVER_PID" > /dev/null 2>&1; then
        echo "Found running server (PID: $SERVER_PID)"
        echo "Stopping server..."
        kill "$SERVER_PID"
        
        # Wait a moment and verify
        sleep 1
        
        if ps -p "$SERVER_PID" > /dev/null 2>&1; then
            echo "⚠️  Server still running, forcing stop..."
            kill -9 "$SERVER_PID" 2>/dev/null
        fi
        
        rm -f "$PID_FILE"
        echo "✅ Server stopped successfully"
    else
        echo "⚠️  Server (PID: $SERVER_PID) is not running"
        rm -f "$PID_FILE"
    fi
else
    echo "⚠️  No PID file found"
    echo ""
    echo "Looking for Python HTTP servers..."
    
    # Try to find and stop any Python HTTP servers on port 8080
    if command -v lsof >/dev/null 2>&1; then
        PIDS=$(lsof -ti:8080 2>/dev/null)
        if [ -n "$PIDS" ]; then
            echo "Found servers on port 8080: $PIDS"
            echo "Stopping..."
            echo "$PIDS" | xargs kill 2>/dev/null
            echo "✅ Stopped"
        else
            echo "No servers found on port 8080"
        fi
    else
        echo "Install 'lsof' to auto-detect servers"
        echo "Or manually kill the server process"
    fi
fi

echo ""
echo "Done!"
