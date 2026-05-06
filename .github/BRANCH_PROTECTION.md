# Branch Protection Rules

Questo file documenta le regole di protezione del branch `main`.

## Configurazione Consigliata

### Su GitHub Repository Settings

1. **Repository > Settings > Branches**

2. **Add Rule per `main` branch:**
   - ✅ Require a pull request before merging
   - ✅ Require approvals: 1
   - ✅ Dismiss stale pull request approvals when new commits are pushed
   - ✅ Require status checks to pass before merging
     - Status checks required:
       - `CI/CD Pipeline / Lint & Format`
       - `CI/CD Pipeline / Tests`
       - `CI/CD Pipeline / Build`
   - ✅ Require branches to be up to date before merging
   - ✅ Require code reviews before merging
   - ✅ Require conversation resolution before merging
   - ✅ Include administrators

3. **GitHub Actions Settings**
   - ✅ Require workflow runs to pass before merging

## Branching Strategy

**Main**: Produzione (stabile, protetto)
**Develop**: Development (più liberale)

```
develop (riceve PR)
  ↓
feature/xyz (da develop)
  ↓
fix/bug-name (da develop)
  ↓
PR → develop → PR → main
```

## Commit Messages

Usa **Conventional Commits**:

```
feat: add new feature
fix: fix bug
docs: update documentation
refactor: improve code quality
test: add tests
chore: update dependencies
ci: update CI/CD
```

## Code Review Checklist

Prima di approvare una PR:

- [ ] Code quality OK
- [ ] Tests passano
- [ ] No breaking changes
- [ ] Documentation updated
- [ ] No security issues

---

**Setup**: Vai su Settings > Branches e configura manualmente (GitHub non permette automazione via API per questo).
