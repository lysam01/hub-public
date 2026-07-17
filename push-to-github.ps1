param(
  [string]$Owner = 'lysam01',
  [string]$Repo = 'hub-public'
)

$secureToken = Read-Host -Prompt "请输入 GitHub Classic PAT（以 ghp_ 开头，输入时不会显示）" -AsSecureString
$token = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
  [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureToken)
)

$repoPath = "C:\Users\lysam\.openclaw\workspace\period-tracker"
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

Write-Host ""
Write-Host "推送完成。如果上面显示错误，说明 token 无效或权限不足。" -ForegroundColor Cyan
