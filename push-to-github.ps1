param(
  [string]$Owner = 'lysam01',
  [string]$Repo = 'hub-public'
)

$secureToken = Read-Host -Prompt 'Enter GitHub Classic PAT (starts with ghp_)' -AsSecureString
$token = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
  [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureToken)
)

$repoPath = 'C:\Users\lysam\.openclaw\workspace\period-tracker'
$tempUrl = "https://$token:x-oauth-basic@github.com/$Owner/$Repo.git"
$cleanUrl = "https://github.com/$Owner/$Repo.git"

Set-Location -Path $repoPath

try {
  git remote set-url origin $tempUrl
  git push origin main
} finally {
  git remote set-url origin $cleanUrl
  Clear-Variable token -ErrorAction SilentlyContinue
}

Write-Host ''
Write-Host 'Done. If errors are shown above, the token is invalid or lacks repo permission.' -ForegroundColor Cyan
