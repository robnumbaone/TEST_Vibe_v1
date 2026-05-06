#!/bin/bash
set -e

echo "🚀 VibeV1 Setup"
echo "==============="

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Install it first."
    exit 1
fi

echo "✅ Node.js $(node -v)"

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install

# Setup environment
echo ""
echo "⚙️  Setting up environment..."
if [ ! -f .env ]; then
    cp config/.env.example .env
    echo "✅ Created .env (RICORDATI DI AGGIORNARE I VALORI!)"
else
    echo "✅ .env già esiste"
fi

# Done
echo ""
echo "🎉 Setup completo!"
echo ""
echo "Prossimo step: npm run dev"
