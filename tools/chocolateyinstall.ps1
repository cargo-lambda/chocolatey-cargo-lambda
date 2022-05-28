
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
if (![System.IO.Directory]::Exists($toolsDir)) {[System.IO.Directory]::CreateDirectory($toolsDir)}

$url = 'https://github.com/cargo-lambda/cargo-lambda/releases/download/v0.8.2/cargo-lambda-v0.8.2.windows-x86.zip'
$sha = 'F6E5ACC431DC83FD0A14A0F95F06EE6E0D9820C7EBB12B5B44788CC0488F1120'

$url64 = 'https://github.com/cargo-lambda/cargo-lambda/releases/download/v0.8.2/cargo-lambda-v0.8.2.windows-x64.zip'
$sha64 = '632C673D45DF513113665C1174430FF178A15069BA1CCADFAE9F0263313812EE'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'cargo-lambda*'

  checksum      = $sha
  checksumType  = 'sha256'
  checksum64    = $sha64
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
