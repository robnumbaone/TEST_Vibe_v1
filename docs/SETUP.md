# Setup VibeV1

## Prerequisiti

- Node.js 18+
- npm o pnpm
- [Aggiungere altri prerequisiti]

## Installation

```bash
# 1. Clone / naviga nella cartella
cd VibeV1

# 2. Installa dipendenze
npm install

# 3. Configura environment
cp config/.env.example .env
# Edita .env con le tue variabili
```

## Development

```bash
# Avvia dev server
npm run dev

# Esegui test
npm run test

# Build per produzione
npm run build
```

## Environment Variables

Vedi `config/.env.example` per la lista completa. Copioni in `.env` locale e configura.

---

**Problema durante setup?** Vedi [docs/ARCHITECTURE.md](./ARCHITECTURE.md) per capire i componenti.
