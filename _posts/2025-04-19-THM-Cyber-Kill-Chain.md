---
title: "[THM Walkthrough] Cyber Kill Chain "
description: This is a full walkthrough with answers and explanations for the TryHackMe room "Cyber Kill Chain".
author: hubert_k
date: 2025-04-19 11:00:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/66704dd0e54a1f39bff7b1a1-1735573085552
---

> Link to the room: <https://tryhackme.com/room/cyberkillchainzmt>.
{: .prompt-info }

## [Task 2] Reconnaissance

#### What is the name of the Intel Gathering Tool that is a web-based interface to the common tools and resources for open-source intelligence?
```text
OSINT Framework
```
{: .nolineno }
{: file="Answer:" }

> Open source intelligence (OSINT) is the act of gathering and analyzing publicly available data for intelligence purposes. `OSINT Framework` - OSINT Framework provides the collection of OSINT tools based on various categories
{: .prompt-tip }

#### What is the definition for the email gathering process during the stage of reconnaissance?
```text
email harvesting
```
{: .nolineno }
{: file="Answer:" }

> `Email harvesting` is the process of obtaining email addresses from public, paid, or free services. 
{: .prompt-tip }

---

## [Task 3] Weaponization

#### This term is referred to as a group of commands that perform a specific task. You can think of them as subroutines or functions that contain the code that most users use to automate routine tasks. But malicious actors tend to use them for malicious purposes and include them in Microsoft Office documents. Can you provide the term for it? 
```text
Macro
```
{: .nolineno }
{: file="Answer:" }

> `Macros` are really just procedures. They are a group of commands that perform a specific task. You can think of them as functions or subroutines.
{: .prompt-tip }

---

## [Task 4] Delivery

#### This term is referred to as a group of commands that perform a specific task. You can think of them as subroutines or functions that contain the code that most users use to automate routine tasks. But malicious actors tend to use them for malicious purposes and include them in Microsoft Office documents. Can you provide the term for it? 
```text
Watering hole attack
```
{: .nolineno }
{: file="Answer:" }

> A `watering hole attack` is a targeted attack designed to aim at a specific group of people by compromising the website they are usually visiting and then redirecting them to the malicious website of an attacker's choice.
{: .prompt-tip }

---

## [Task 5] Exploitation

#### Can you provide the name for a cyberattack targeting a software vulnerability that is unknown to the antivirus or software vendors?
```text
Zero-day
```
{: .nolineno }
{: file="Answer:" }

> According to FireEye, "the `zero-day` exploit or a zero-day vulnerability is an unknown exploit in the wild that exposes a vulnerability in software or hardware and can create complicated problems well before anyone realizes something is wrong. A `zero-day` exploit leaves NO opportunity for detection at the beginning."
{: .prompt-tip }

---

## [Task 6] Installation

#### Can you provide the technique used to modify file time attributes to hide new or changes to existing files?
```text
Timestomping
```
{: .nolineno }
{: file="Answer:" }

> The `Timestomping` technique lets an attacker modify the file's timestamps, including the modify, access, create and change times. 
{: .prompt-tip }

#### Can you name the malicious script planted by an attacker on the webserver to maintain access to the compromised system and enables the webserver to be accessed remotely?
```text
Web shell
```
{: .nolineno }
{: file="Answer:" }

>  A `web shell` is a malicious script written in web development programming languages such as ASP, PHP, or JSP used by an attacker to maintain access to the compromised system. Because of the `web shell` simplicity and file formatting (.php, .asp, .aspx, .jsp, etc.) can be difficult to detect and might be classified as benign.
{: .prompt-tip }

---

## [Task 7] Command & Control

#### What is the C2 communication where the victim makes regular DNS requests to a DNS server and domain which belong to an attacker. 
```text
DNS Tunneling
```
{: .nolineno }
{: file="Answer:" }

> The infected machine makes constant DNS requests to the DNS server that belongs to an attacker, this type of C2 communication is also known as `DNS Tunneling`.
{: .prompt-tip }

---

## [Task 8] Actions on Objectives (Exfiltration)

#### Can you provide a technology included in Microsoft Windows that can create backup copies or snapshots of files or volumes on the computer, even when they are in use?  
```text
Shadow Copy
```
{: .nolineno }
{: file="Answer:" }

> `Shadow Copy` is a Microsoft technology that can create backup copies, snapshots of computer files, or volumes. 
{: .prompt-tip }

---

## [Task 9] Practice Analysis

#### What is the flag after you complete the static site?
```text
THM{7HR347_1N73L_12_4w35om3}
```
{: .nolineno }
{: file="Answer:" }

> Complete the cyber kill chain.
{: .prompt-tip }