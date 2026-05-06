# VibeV1 - Project Guide

## 📋 Struttura del Progetto

```
VibeV1/
├── .claude/                    # Configurazione Claude Code
│   ├── settings.json          # Permessi e configurazioni
│   ├── MEMORY.md              # Index delle memorie del progetto
│   └── scheduled-tasks/       # Task schedulati (auto-generato)
├── docs/                      # Documentazione
│   ├── ARCHITECTURE.md        # Architettura generale
│   ├── API.md                 # Documentazione API
│   ├── SETUP.md               # Istruzioni setup
│   └── DECISIONS.md           # Decisioni architetturali
├── src/                       # Codice sorgente
│   ├── components/            # React components (se web)
│   ├── pages/                 # Pages/routes
│   ├── services/              # Logica di business
│   ├── utils/                 # Utility functions
│   └── types/                 # TypeScript types
├── config/                    # Configurazioni
│   ├── .env.example           # Template variabili env
│   └── constants.ts           # Costanti globali
├── scripts/                   # Script di utility
│   ├── setup.sh               # Setup iniziale
│   └── dev.sh                 # Start dev server
├── package.json               # Dipendenze
├── README.md                  # Intro al progetto
└── .gitignore                 # File da ignorare

```

## 🎯 Come Usarlo

### **File Principali**

| File | Scopo |
|------|-------|
| **CLAUDE.md** | Tu sei qui! Linee guida per Claude Code + regole del progetto |
| **README.md** | Intro tecnica, come installare e avviare |
| **docs/** | Tutta la documentazione in markdown |
| **.claude/settings.json** | Configurazioni di Claude Code (permessi, hook, env) |
| **.claude/MEMORY.md** | Index delle memorie che Claude ricorda tra sessioni |

### **Cartelle Principali**

**`.claude/`** → Configurazione Claude Code
- Qui metti settings, memorie, task schedulati
- Claude legge/scrive automaticamente

**`docs/`** → Documentazione
- ARCHITECTURE.md: come è fatto il progetto
- API.md: endpoint, formato risposta
- DECISIONS.md: perché hai scelto tecnologia X
- SETUP.md: step-by-step per iniziare

**`src/`** → Codice
- Organizzato per tipo di file (components, pages, services, etc.)
- Ogni feature isolata possibilmente in sua cartella

**`config/`** → Configurazioni
- Variabili d'ambiente, costanti, setup database, etc.

**`scripts/`** → Automazioni
- Setup.sh per primo avvio
- Dev.sh per lanciare dev server
- Build.sh per produzione

## 🛡️ Regole Base

1. **Prima di iniziare**: Usa CLAUDE.md per comunicare il contesto
2. **Documentazione**: Tieni docs/ aggiornato
3. **Decisioni**: Registra le scelte importanti in DECISIONS.md
4. **Memoria**: Claude ricorda continuità tra sessioni grazie a .claude/MEMORY.md
5. **Configurazione**: Usa config/ per centralizzare costanti

## 🔄 Workflow

```
1. User: "Crea feature X"
   ↓
2. Claude legge CLAUDE.md + MEMORY.md (contesto)
   ↓
3. Claude legge docs/ (capisce architettura)
   ↓
4. Claude modifica src/ + aggiorna docs/
   ↓
5. Claude salva decision/insight in MEMORY.md
```

## ✅ Checklist Primo Progetto

- [ ] Compila README.md
- [ ] Scrivi ARCHITECTURE.md in docs/
- [ ] Aggiungi .env.example in config/
- [ ] Crea primo script in scripts/
- [ ] Documenta decisioni importanti

## 🚀 Comandi Utili

```bash
# Setup progetto
./scripts/setup.sh

# Avvia development
./scripts/dev.sh

# Vedi struttura
tree -L 2 -I 'node_modules'
```

---

**Questo file è il tuo punto di riferimento**: aggiornalo man mano che il progetto evolve.
