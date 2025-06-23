# �ll�tsuk le az SQL LocalDB p�ld�nyt
sqllocaldb stop MSSQLLocalDB

# Projekted el�r�si �tja (v�laszd a saj�t el�r�si utad)
$serverPath = "C:\Users\Kitti\source\repos\lovarda-nyilvantartas-angular\lovarda-nyilvantartas-angular.Server"
$clientPath = "C:\Users\Kitti\source\repos\lovarda-nyilvantartas-angular\lovarda-nyilvantartas-angular.Client"

# Meg�l minden dotnet.exe folyamatot, ami a projekted backend mapp�j�b�l fut
Get-WmiObject Win32_Process -Filter "name = 'dotnet.exe'" | ForEach-Object {
    if ($_.CommandLine -like "*$serverPath*") {
        Write-Host "Le�ll�tom a dotnet folyamatot PID=$($_.ProcessId)"
        Stop-Process -Id $_.ProcessId -Force
    }
}

# Meg�l minden node.exe folyamatot, ami a projekted frontend mapp�j�b�l fut
Get-WmiObject Win32_Process -Filter "name = 'node.exe'" | ForEach-Object {
    if ($_.CommandLine -like "*$clientPath*") {
        Write-Host "Le�ll�tom a node folyamatot PID=$($_.ProcessId)"
        Stop-Process -Id $_.ProcessId -Force
    }
}

Write-Host "Le�ll�t�sok k�sz."
Pause
