---
title: "[THM] Osquery: The Basics"
description: This is a full walkthrough with answers and explanations for the TryHackMe room "Osquery The Basics".
author: hubert_k
date: 2025-11-06 13:00:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/2d1116d536a64d634647d6efa1f2acf0.png
---

> Link to the room: <https://tryhackme.com/room/osqueryf8>.
{: .prompt-info }

"Osquery is an open-source agent created by Facebook in 2014. It converts the operating system into a relational database. It allows us to ask questions from the tables using SQL queries, like returning the list of running processes, a user account created on the host, and the process of communicating with certain suspicious domains. It is widely used by Security Analysts, Incident Responders, Threat Hunters, etc. Osquery can be installed on multiple platforms: Windows, Linux, macOS, and FreeBSD."

## [Task 3] Osquery: Interactive Mode?

#### How many tables are returned when we query "table process" in the interactive mode of Osquery?

> .table process
{: .prompt-tip }

```text
3
```
{: .nolineno }
{: file="Answer:" }

---

#### Looking at the schema of the processes table, which column displays the process id for the particular process?

> .schema processes
{: .prompt-tip }

```text
pid
```
{: .nolineno }
{: file="Answer:" }

---

#### Examine the .help command, how many output display modes are available for the .mode command?

> .help
{: .prompt-tip }

```text
5
```
{: .nolineno }
{: file="Answer:" }

---

## [Task 4] Schema Documentation

Documentation: <https://osquery.io/schema/5.5.1>

#### In Osquery version 5.5.1, how many common tables are returned, when we select both Linux and Window Operating system?

```text
56
```
{: .nolineno }
{: file="Answer:" }| 

---

#### In Osquery version 5.5.1, how many tables for MAC OS are available?

```text
180
```
{: .nolineno }
{: file="Answer:" }

---

#### In the Windows Operating system, which table is used to display the installed programs?

```text
programs
```
{: .nolineno }
{: file="Answer:" }

---

#### In Windows Operating system, which column contains the registry value within the registry table?

```text
data
```
{: .nolineno }
{: file="Answer:" }

---

## [Task 5] Creating SQL queries

#### Using Osquery, how many programs are installed on this host?

> SELECT count(*) from programs;
{: .prompt-tip }

```text
19
```
{: .nolineno }
{: file="Answer:" }

---

#### Using Osquery, what is the description for the user James?

> select * from users where username = 'James';
{: .prompt-tip }

```text
Creative Artist
```
{: .nolineno }
{: file="Answer:" }

---

#### When we run the following search query, what is the full SID of the user with RID '1009'?

> select path, key, name from registry where key = 'HKEY_USERS' and name like '%1009';
{: .prompt-tip }

```text
S-1-5-21-1966530601-3185510712-10604624-1009
```
{: .nolineno }
{: file="Answer:" }

---

#### When we run the following search query, what is the Internet Explorer browser extension installed on this machine?

> select path from ie_extensions;
{: .prompt-tip }

```text
S-1-5-21-1966530601-3185510712-10604624-1009
```
{: .nolineno }
{: file="Answer:" }

---

#### After running the following query, what is the full name of the program returned?

> select name,install_location from programs where name LIKE '%wireshark%';
{: .prompt-tip }

```text
Wireshark 4.4.9 x64
```
{: .nolineno }
{: file="Answer:" }

---

## [Task 6] Challenge and Conclusion

#### Which table stores the evidence of process execution in Windows OS?

> Search documentation
{: .prompt-tip }

```text
userassist
```
{: .nolineno }
{: file="Answer:" }

---

#### One of the users seems to have executed a program to remove traces from the disk; what is the name of that program?

> select * from userassist
{: .prompt-tip }

```text
DiskWipe.exe
```
{: .nolineno }
{: file="Answer:" }

---

#### Create a search query to identify the VPN installed on this host. What is name of the software?

> select * from programs where name like '%VPN%';
{: .prompt-tip }

```text
ProtonVPN
```
{: .nolineno }
{: file="Answer:" }

---

#### How many services are running on this host?

> select count(*) from services;
{: .prompt-tip }

```text
215
```
{: .nolineno }
{: file="Answer:" }

---

#### A table autoexec contains the list of executables that are automatically executed on the target machine. There seems to be a batch file that runs automatically. What is the name of that batch file (with the extension .bat)?

> select * from autoexec where name like '%.bat';
{: .prompt-tip }

```text
batstartup.bat
```
{: .nolineno }
{: file="Answer:" }

---

#### What is the full path of the batch file found in the above question? (Last in the List)

> select path from autoexec where name like '%.bat';
{: .prompt-tip }

```text
C:\Users\James\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\batstartup.bat
```
{: .nolineno }
{: file="Answer:" }

---