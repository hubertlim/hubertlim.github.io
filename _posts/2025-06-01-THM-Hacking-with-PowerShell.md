---
title: "[THM] Hacking with PowerShell"
description: This is a full walkthrough with answers and explanations for the TryHackMe room "Hacking with PowerShell".
author: hubert_k
date: 2025-06-05 16:00:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/ca3da5aa8e312b0316f06a25a03028a5.png
---

> Link to the room: <https://tryhackme.com/room/powershell>.
{: .prompt-info }

## [Task 2] What is Powershell?

Powershell is the Windows Scripting Language and shell environment built using the .NET framework.

> [Approved Verbs for PowerShell Commands](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands?view=powershell-7.5&viewFallbackFrom=powershell-7)
{: .prompt-tip }

#### What is the command to get a new object?

> The normal format of a cmdlet is represented using Verb-Noun.
{: .prompt-tip }

```text
Get-New
```
{: .nolineno }
{: file="Answer:" }

---

## [Task 3] Basic Powershell Commands

```powershell
Get-Help Get-Command -Examples
```
{: .nolineno }
{: file="Running the Get-Help cmdlet to explain a command" }

```powershell
Get-Command New-*
```
{: .nolineno }
{: file="Using the Get-Command to list all cmdlets installed" }

```powershell
Get-Command | Get-Member -MemberType Method
```
{: .nolineno }
{: file="Using pipe to pass output from one cmdlet to another" }

```powershell
Get-ChildItem | Select-Object -Property Mode, Name
```
{: .nolineno }
{: file="Listing the directories and filtering via mode and name" }

```powershell
Get-Service | Where-Object -Property Status -eq Stopped
```
{: .nolineno }
{: file="Demonstrating the use of operators only to show stopped services" }

```powershell
Get-ChildItem | Sort-Object
```
{: .nolineno }
{: file="Using the Sort-Object cmdlet to sort piped information" }

#### What is the location of the file "interesting-file.txt"

> Get-ChildItem -Path C:\ -Include *interesting-file.txt* -File -Recurse -ErrorAction SilentlyContinue
{: .prompt-tip }

```text
C:\Program Files
```
{: .nolineno }
{: file="Answer:" }

#### Specify the contents of this file

> Get-Content -Path "C:\Program Files\interesting-file.txt""
{: .prompt-tip }

```text
notsointerestingcontent
```
{: .nolineno }
{: file="Answer:" }

#### How many cmdlets are installed on the system(only cmdlets, not functions and aliases)?

> (Get-Command -CommandType cmdlet).Count
{: .prompt-tip }

```text
6638
```
{: .nolineno }
{: file="Answer:" }

#### Get the MD5 hash of interesting-file.txt

> Get-FileHash -Path "C:\Program Files\interesting-file.txt" -Algorithm MD5
{: .prompt-tip }

```text
49A586A2A9456226F8A1B4CEC6FAB329
```
{: .nolineno }
{: file="Answer:" }

#### What is the command to get the current working directory?

```text
Get-Location
```
{: .nolineno }
{: file="Answer:" }

#### Does the path "C:\Users\Administrator\Documents\Passwords" Exist (Y/N)?

> Test-Path -Path "C:\Users\Administrator\Documents\Passwords"
{: .prompt-tip }

```text
N
```
{: .nolineno }
{: file="Answer:" }

#### What command would you use to make a request to a web server?

```text
Invoke-WebRequest
```
{: .nolineno }
{: file="Answer:" }

#### Base64 decode the file b64.txt on Windows. 

> `[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String((Get-Content -Path "C:\Users\Administrator\Desktop\b64.txt" -Raw)))`
{: .prompt-tip }

```text
ihopeyoudidthisonwindows
```
{: .nolineno }
{: file="Answer:" }

---

## [Task 4] Enumeration

The first step when you have gained initial access to any machine would be to enumerate. 
We'll be enumerating the following:
- users
- basic networking information
- file permissions
- registry permissions
- scheduled and running tasks
- insecure files

#### How many users are there on the machine?

> (Get-LocalUser).Count
{: .prompt-tip }

```text
5
```
{: .nolineno }
{: file="Answer:" }

#### Which local user does this SID(S-1-5-21-1394777289-3961777894-1791813945-501) belong to?

> `Get-LocalUser | Where-Object { $_.SID -eq "S-1-5-21-1394777289-3961777894-1791813945-501" } | Select-Object -ExpandProperty Name`
{: .prompt-tip }

```text
Guest
```
{: .nolineno }
{: file="Answer:" }

#### How many users have their password required values set to False?

> `(Get-LocalUser | Where-Object { $_.PasswordRequired -eq $false }).Count`
{: .prompt-tip }

```text
4
```
{: .nolineno }
{: file="Answer:" }

#### How many local groups exist?

> (Get-LocalGroup).Count
{: .prompt-tip }

```text
24
```
{: .nolineno }
{: file="Answer:" }

#### What command did you use to get the IP address info?

```text
Get-NetIPAddress
```
{: .nolineno }
{: file="Answer:" }

#### How many ports are listed as listening?

> (Get-NetTCPConnection -State Listen).Count
{: .prompt-tip }

```text
20
```
{: .nolineno }
{: file="Answer:" }

#### What is the remote address of the local port listening on port 445?

> Get-NetTCPConnection -LocalPort 445 -State Listen
{: .prompt-tip }

```text
::
```
{: .nolineno }
{: file="Answer:" }

#### How many patches have been applied?

> (Get-WmiObject -Class Win32_QuickFixEngineering).Count
{: .prompt-tip }

```text
20
```
{: .nolineno }
{: file="Answer:" }

#### When was the patch with ID KB4023834 installed?

> `Get-Hotfix -Id KB4023834 | Select-Object -Property InstalledOn`
{: .prompt-tip }

```text
6/15/2017 12:00:00 AM
```
{: .nolineno }
{: file="Answer:" }

#### Find the contents of a backup file.

> Get-ChildItem -Path C:\ -Include *.bak* -File -Recurse -ErrorAction SilentlyContinue
{: .prompt-tip }
> Get-Content "C:\Program Files (x86)\Internet Explorer\passwords.bak.txt"
{: .prompt-tip }

```text
backpassflag
```
{: .nolineno }
{: file="Answer:" }

#### Search for all files containing API_KEY

> `Get-ChildItem C:\* -Recurse | Select-String -pattern API_KEY`
{: .prompt-tip }

```text
fakekey123
```
{: .nolineno }
{: file="Answer:" }

#### What command do you do to list all the running processes?

```text
Get-Process
```
{: .nolineno }
{: file="Answer:" }

#### What is the path of the scheduled task called new-sched-task?

> Get-ScheduleTask -TaskName new-sched-task
{: .prompt-tip }

```text
/
```
{: .nolineno }
{: file="Answer:" }

#### Who is the owner of the C:\

> Get-Acl c:/
{: .prompt-tip }

```text
NT SERVICE\TrustedInstaller
```
{: .nolineno }
{: file="Answer:" }

---

## [Task 5] Basic Scripting Challenge

> Scripting may be a bit difficult, but here is a good resource to use: [Learn X in Y minutes](https://learnxinyminutes.com/powershell/)
{: .prompt-tip }

#### What file contains the password?

```powershell
# Define the path to the folder and the text to search for
$folderPath = "C:\Users\Administrator\Desktop\emails\*"
$searchText = "password"

# Get all files in the folder and subfolders
$files = Get-ChildItem -Path $folderPath -Recurse -File
$answer = $files | Select-String -Pattern $searchText

# Loop through each file
foreach ($file in $files) {
    try {
        # Read file content
        $content = Get-Content -Path $file.FullName -ErrorAction Stop

        # Search for the text
        if ($content -match $searchText) {
            Write-Host "Found '$searchText' in file: $($file.FullName)" -ForegroundColor Green
            Write-Host $answer
        }
    } catch {
        Write-Warning "Failed to read file: $($file.FullName). Error: $_"
    }
}
```
{: file="Question #1 an #2" }

```text
Doc3M
```
{: .nolineno }
{: file="Answer:" }

#### What file contains the password?

```text
johnisalegend99
```
{: .nolineno }
{: file="Answer:" }

#### What files contains an HTTPS link?

> search for "https://"
{: .prompt-tip }

```text
Doc2Mary
```
{: .nolineno }
{: file="Answer:" }

---

## Intermediate Scripting

#### How many open ports did you find between 130 and 140(inclusive of those two)?

```powershell
$target = "localhost"   # Change this to the IP or hostname if scanning remote system
$startPort = 130
$endPort = 140

for ($port = $startPort; $port -le $endPort; $port++) {
    $result = Test-NetConnection -ComputerName $target -Port $port -WarningAction SilentlyContinue
    if ($result.TcpTestSucceeded) {
        Write-Host "Port $port is OPEN on $target" -ForegroundColor Green
    } else {
        Write-Host "Port $port is CLOSED on $target" -ForegroundColor Red
    }
}
```
{: file="Question #1" }

```text
11
```
{: .nolineno }
{: file="Answer:" }