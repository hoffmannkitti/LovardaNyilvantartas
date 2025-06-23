@echo off
@echo off
sqllocaldb start MSSQLLocalDB
start cmd /k "cd C:\Users\Kitti\source\repos\lovarda-nyilvantartas-angular\lovarda-nyilvantartas-angular.Server && dotnet run"
start cmd /k "cd C:\Users\Kitti\source\repos\lovarda-nyilvantartas-angular\lovarda-nyilvantartas-angular.Client && ng serve --port 4200 --proxy-config proxy.conf.json"
pause
