$old_word = Read-Host "Введите слово, которое нужно заменить"
$new_word = Read-Host "Введите новое слово"
$directory = Read-Host "Введите путь к директории с текстовыми файлами"
New-Item -Path "ChangeLists.txt" -ItemType File

foreach ($file in Get-ChildItem -Path $directory -Filter *.txt) {
    if ((Get-Content $file.FullName) -match $old_word) {
        (Get-Content $file.FullName) | ForEach-Object { $_ -replace $old_word, $new_word } | Set-Content $file.FullName
        Add-Content -Path "ChangeLists.txt" -Value $file.FullName
    }
}

