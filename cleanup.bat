@echo off

rem Temporary Files Cleanup
echo Cleaning temporary files...
rd /s /q %TEMP%
md %TEMP%
del /f /q /s C:\Windows\Temp\*.*

rem Windows Update Cleanup
echo Cleaning Windows update files...
del /f /q /s C:\Windows\SoftwareDistribution\Download\*.*

rem Recycle Bin Cleanup
echo Emptying recycle bin...
echo Y|PowerShell.exe -Command "& {Add-Type -TypeDefinition '[DllImport(\"Shell32.dll\")]public static extern int SHEmptyRecycleBin(IntPtr hwnd, string pszRootPath, int dwFlags); } [Shell32.RecycleBin]::SHEmptyRecycleBin($null, $null, 0x1); }"

echo Cleanup complete.
pause
