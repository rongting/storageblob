Param (
    [string]$HostPoolName,
    [string]$RegistrationInfoToken
)

$FileURL = "https://raw.githubusercontent.com/rongting/storageblob/master/Configuration.zip"
$FileName = "Configuration.zip"
$FilePath = "$Env:SystemRoot\Temp"
$WorkingFolder = "$FilePath\Configuration"

Invoke-WebRequest $FileURL -OutFile $FilePath\$FileName

Expand-Archive $FilePath\$FileName -DestinationPath "$WorkingFolder"

& "$WorkingFolder\Script-AddRdshServer.ps1" -HostPoolName $HostPoolName -RegistrationInfoToken $RegistrationInfoToken