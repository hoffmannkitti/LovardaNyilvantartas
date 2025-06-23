# Állítsuk le az SQL LocalDB példányt
sqllocaldb stop MSSQLLocalDB

# Projekted elérési útja (válaszd a saját elérési utad)
$serverPath = "C:\Users\Kitti\source\repos\lovarda-nyilvantartas-angular\lovarda-nyilvantartas-angular.Server"
$clientPath = "C:\Users\Kitti\source\repos\lovarda-nyilvantartas-angular\lovarda-nyilvantartas-angular.Client"

# Megöl minden dotnet.exe folyamatot, ami a projekted backend mappájából fut
Get-WmiObject Win32_Process -Filter "name = 'dotnet.exe'" | ForEach-Object {
    if ($_.CommandLine -like "*$serverPath*") {
        Write-Host "Leállítom a dotnet folyamatot PID=$($_.ProcessId)"
        Stop-Process -Id $_.ProcessId -Force
    }
}

# Megöl minden node.exe folyamatot, ami a projekted frontend mappájából fut
Get-WmiObject Win32_Process -Filter "name = 'node.exe'" | ForEach-Object {
    if ($_.CommandLine -like "*$clientPath*") {
        Write-Host "Leállítom a node folyamatot PID=$($_.ProcessId)"
        Stop-Process -Id $_.ProcessId -Force
    }
}

Write-Host "Leállítások kész."
Pause
