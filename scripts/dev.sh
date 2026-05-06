#!/bin/bash

echo "👨‍💻 Starting VibeV1 Development Server"
echo "======================================"

# Check if .env exists
if [ ! -f .env ]; then
    echo "⚠️  .env not found. Run: ./scripts/setup.sh"
    exit 1
fi

# Check if node_modules exists
if [ ! -d node_modules ]; then
    echo "⚠️  Dependencies not installed. Run: npm install"
    exit 1
fi

echo "Starting dev server..."
echo ""

# Run dev
npm run dev
