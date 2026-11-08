# Publishes Lantern to GitHub Pages. Run in this folder: .\deploy.ps1
# Copies a new lantern.html from Downloads (if there is one) over index.html, then commits and pushes.
param([string]$Source = "$HOME\Downloads\lantern.html", [string]$Message = "Update Lantern")
Set-Location $PSScriptRoot
if (Test-Path $Source) { Copy-Item $Source .\index.html -Force; Write-Host "Copied $Source" }
git add .
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) { Write-Host "Nothing changed."; exit 0 }
git commit -m $Message
git push
Write-Host "Pushed. Live in about a minute:" (gh api "repos/{owner}/lantern/pages" --jq .html_url)
