# GitHub Actions & Automazioni

> Documentazione dei workflow automatici configurati

## 📋 Workflow Disponibili

### 1. **CI/CD Pipeline** (`ci.yml`)

Esegue automaticamente su ogni push/PR:

```
✓ Lint & Format Check
✓ Tests
✓ Build
✓ Security Scan
```

**Trigger**: Push su `main` o `develop`, PR su qualsiasi branch

**Cosa fa**:
- Installa dipendenze
- Linting (ESLint)
- Format check (Prettier)
- Run tests
- Build artifact
- Security audit

**Fallisce se**: Lint error, test fail, build fail

---

### 2. **Release & Versioning** (`release.yml`)

Crea release automatiche con semantic versioning:

```
main push → Semantic Release → npm publish (optional)
```

**Trigger**: Push su `main` (ignora doc-only changes)

**Cosa fa**:
- Analizza commit (conventional commits)
- Bumpa versione (patch/minor/major)
- Crea GitHub Release
- Genera CHANGELOG

**Richiede**: Semantic Release configurato in `package.json`

---

### 3. **Dependabot** (`dependabot.yml`)

Aggiorna automaticamente dipendenze:

```
weekly → Crea PR per update → Auto-merge (patch/minor)
```

**Trigger**: Ogni lunedì mattina

**Cosa fa**:
- Controlla aggiornamenti npm
- Controlla aggiornamenti GitHub Actions
- Crea PR automatiche
- Auto-merge per patch/minor
- Richiede review per major

**Configurazione**: `.github/dependabot.yml`

---

### 4. **Deploy** (`deploy.yml`)

Deploy automatico in produzione:

```
main push → Build → Deploy → Notify
```

**Trigger**: Push su `main` o manual (`workflow_dispatch`)

**Cosa fa**:
- Build progetto
- Deploy a piattaforma (configurable)
- Notifica Slack (optional)
- Crea GitHub Deployment

**TODO**: Configura per Vercel, AWS, Heroku, etc.

---

## 🔧 Come Configurare

### Step 1: Configura Scripts in `package.json`

```json
{
  "scripts": {
    "lint": "eslint src/",
    "test": "jest",
    "build": "webpack",
    "format": "prettier --write ."
  }
}
```

### Step 2: Abilita Dependabot

1. Repository > Settings > Code Security and Analysis
2. Enable: "Dependabot alerts"
3. Enable: "Dependabot security updates"

### Step 3: Configura Branch Protection

1. Repository > Settings > Branches
2. Add rule per `main`
3. Richiedi status checks
4. Richiedi PR review

### Step 4: (Optional) Configura Deploy

Modifica `.github/workflows/deploy.yml`:

```yaml
# Per Vercel:
- uses: amondnet/vercel-action@v25
  with:
    vercel-token: ${{ secrets.VERCEL_TOKEN }}
    vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
    vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}

# Per AWS:
- name: Deploy to AWS
  uses: aws-actions/configure-aws-credentials@v4
  with:
    aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
    aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

---

## 🔐 Secrets Richiesti

Alcuni workflow richiedono secrets. Aggiungi in Repository > Settings > Secrets:

| Secret | Uso |
|--------|-----|
| `VERCEL_TOKEN` | Deploy Vercel |
| `AWS_ACCESS_KEY_ID` | Deploy AWS |
| `AWS_SECRET_ACCESS_KEY` | Deploy AWS |
| `SLACK_WEBHOOK` | Notifiche Slack |
| `GITHUB_TOKEN` | Auto-generato (non aggiungere) |

---

## 📊 Status Badge

Aggiungi al README:

```markdown
![CI/CD](https://github.com/robnumbaone/TEST_Vibe_v1/actions/workflows/ci.yml/badge.svg)
![Release](https://github.com/robnumbaone/TEST_Vibe_v1/actions/workflows/release.yml/badge.svg)
```

---

## 🧪 Test Locally

```bash
# Installa act per testare workflow localmente
brew install act

# Esegui workflow
act push -j lint
act push -j test
```

---

## ⚡ Ottimizzazioni

### Caching

I workflow usano npm cache per velocizzare install:

```yaml
- uses: actions/setup-node@v4
  with:
    cache: 'npm'  # ← Cache automatico
```

### Conditional Steps

Esegui step solo quando necessario:

```yaml
- if: github.event_name == 'pull_request'
  run: npm test
```

### Parallel Jobs

Jobs eseguono in parallelo:

```
lint, test, security (in parallelo)
    ↓
  build (after all pass)
```

---

## 🐛 Troubleshooting

**Workflow non esegue?**
- Controlla Actions tab per errori
- Verifica trigger condition
- Controlla permissions

**Build fallisce?**
- Vedi log nel tab Actions
- Test localmente: `npm test`

**Deploy fallisce?**
- Controlla secrets sono impostati
- Verifica credentials sono validi
- Testa deploy manualmente

---

Vedi `.github/workflows/` per dettagli su ogni workflow.
