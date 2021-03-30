@echo off
rd /S /Q build
mkdir build\bin
xcopy /Y cspkg build\bin\
xcopy /Y cspkg.bat build\bin\