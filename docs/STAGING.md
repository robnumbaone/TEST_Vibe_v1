# Staging Branch Guide

## Panoramica

La branch `staging` è l'ambiente di pre-produzione dove il codice è testato prima di andare in produzione.

## Workflow

```
Feature Branch → Development → Staging → Production
    ↓             ↓              ↓           ↓
  (feat/*)   (main/develop)   (staging)   (release)
```

## Come Usare la Staging Branch

### 1. Creare Feature Branch
```bash
git checkout -b feat/my-feature
# Sviluppa e fai commit
git push -u origin feat/my-feature
```

### 2. Merge su Development
```bash
git checkout develop
git pull origin develop
git merge feat/my-feature
git push origin develop
```

### 3. Preparare per Staging
```bash
git checkout staging
git pull origin staging
git merge develop
git push origin staging
```

### 4. Deploy e Testing
- La staging branch è automaticamente deployata dai GitHub Actions
- Esegui test manuali e automatici
- Verifica stabilità e performance

### 5. Deploy a Produzione
Una volta validato in staging:
```bash
git checkout main
git pull origin main
git merge staging
git tag v1.0.0
git push origin main --tags
```

## Branch Protection Rules

La branch `staging` dovrebbe avere:
- ✅ Require pull request reviews
- ✅ Require status checks to pass
- ✅ Require branches to be up to date before merging
- ✅ Dismiss stale PR approvals
- ✅ Require code owner reviews (opzionale)

## Environments

| Branch | Environment | Auto-Deploy | Testing |
|--------|-------------|------------|---------|
| `feat/*` | Local | No | Manual |
| `develop` | Dev | No | Automated |
| `staging` | Staging | Yes | Full Suite |
| `main` | Production | Manual | Production |

## Configurazione GitHub Actions

La staging branch ha workflow specifici:
- Build, lint, test automatici
- Deploy a staging environment
- Health checks e monitoring
- Notifiche su fallimenti

Vedi [GITHUB_ACTIONS.md](./GITHUB_ACTIONS.md) per dettagli.

## Troubleshooting

### "Staging è dietro a develop"
```bash
git checkout staging
git pull origin staging
git merge origin/develop
git push origin staging
```

### "Hotfix urgente in staging"
```bash
git checkout -b hotfix/critical-bug staging
# Fix e test
git checkout staging
git merge hotfix/critical-bug
git push origin staging
```

### "Rollback a versione precedente"
```bash
git checkout staging
git reset --hard v1.0.0  # o commit specifico
git push origin staging --force-with-lease
```

---

**Status**: Active  
**Last Updated**: 2026-05-06
