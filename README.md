# homebrew-krust

Homebrew tap repository for [`krust`](https://github.com/ErfanY/krust).

## Repo layout

- `Formula/krust.rb`: active Homebrew formula.
- `scripts/generate_formula.sh`: generates a release-binary formula from `SHA256SUMS`.
- `.github/workflows/sync-formula.yml`: optional one-click workflow to refresh formula from a release tag.

## Bootstrap

1. Create this as its own repository named `homebrew-krust`.
2. Push current contents.
3. Keep the initial `Formula/krust.rb` as a `HEAD` fallback until the first release assets are available.

## Update formula from a release (local)

```bash
# In homebrew-krust repo
TAG=v0.1.0
SOURCE_REPO=ErfanY/krust

mkdir -p dist
gh release download "$TAG" --repo "$SOURCE_REPO" --pattern SHA256SUMS --dir dist

./scripts/generate_formula.sh \
  --version "${TAG#v}" \
  --repo "$SOURCE_REPO" \
  --checksums dist/SHA256SUMS \
  --output Formula/krust.rb

git add Formula/krust.rb
git commit -m "krust ${TAG#v}"
git push
```

## Update formula from GitHub Actions

Run workflow `Sync krust formula` with:
- `tag`: release tag in source repo, for example `v0.1.0`
- `source_repo`: defaults to `ErfanY/krust`

The workflow downloads `SHA256SUMS`, regenerates `Formula/krust.rb`, and commits it.

## User install

```bash
brew tap ErfanY/krust https://github.com/ErfanY/homebrew-krust
brew install krust
```
