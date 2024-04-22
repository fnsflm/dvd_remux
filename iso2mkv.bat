@echo off
@setlocal enabledelayedexpansion
chcp 65001
if not exist mkv mkdir mkv
:get

"C:\Program Files (x86)\MakeMKV\makemkvcon64.exe" mkv iso:%1 all .\mkv
set "mkv_name=%~n1.mkv"

for %%i in (mkv\*) do (
    echo "%mkv_name%"
    move "%%i" ".\%mkv_name%"
)
"C:\Program Files\MKVToolNix\mkvextract.exe" chapters ".\%mkv_name%" -s > "%mkv_name%.chapter.txt"
echo "spliting %mkv_name% ..."
for /F %%j in ('type "%mkv_name%.chapter.txt" ^| find /v /c ""') do (set chapter_f_line=%%j)
if %chapter_f_line% == 40 (
    "C:\Program Files\MKVToolNix\mkvmerge.exe" "%mkv_name%" --split chapters:6,11,16 -o "%mkv_name%-split.mkv"
)

shift
if (%1) neq () goto :get
pause