param(
    [int]$Minutes = 30,
    [string]$Sortie = "tests/evenements-4625.json"
)

$evenements = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625; StartTime=(Get-Date).AddMinutes(-$Minutes)} -MaxEvents 200 -ErrorAction SilentlyContinue

if (-not $evenements) {
    Write-Host "ECHEC : aucun evenement 4625 dans les $Minutes dernieres minutes."
    exit 1
}

$liste = foreach ($e in $evenements) {
    $xml = [xml]$e.ToXml()
    $champs = @{}
    foreach ($donnee in $xml.Event.EventData.Data) {
        $champs[$donnee.Name] = $donnee.'#text'
    }
    [pscustomobject]@{
        horodatage     = $e.TimeCreated.ToUniversalTime().ToString("o")
        code           = $e.Id
        compte         = $champs['TargetUserName']
        type_connexion = $champs['LogonType']
        ip_source      = $champs['IpAddress']
        port           = $champs['IpPort']
        station        = $champs['WorkstationName']
        statut         = $champs['Status']
        sous_statut    = $champs['SubStatus']
        processus      = $champs['ProcessName']
    }
}

$dossier = Split-Path $Sortie -Parent
if ($dossier -and -not (Test-Path $dossier)) {
    New-Item -ItemType Directory -Path $dossier | Out-Null
}

ConvertTo-Json -InputObject @($liste) -Depth 3 | Out-File -FilePath $Sortie -Encoding utf8
Write-Host "OK : $(@($liste).Count) evenement(s) exporte(s) vers $Sortie"