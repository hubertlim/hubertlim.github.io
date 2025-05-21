---
title: "[THM] Android Analysis"
description: This is a full walkthrough with answers and explanations for the TryHackMe room "Android Analysis".
author: hubert_k
date: 2025-05-21 16:00:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/5e8dd9a4a45e18443162feab-1745489133886
---

> Link to the room: <https://tryhackme.com/room/androidanalysis>.
{: .prompt-info }

## [Task 3] Android Architecture - An Overview

#### Android Architecture

![Desktop View](https://tryhackme-images.s3.amazonaws.com/user-uploads/5e8dd9a4a45e18443162feab/room-content/5e8dd9a4a45e18443162feab-1747826237632.svg){: width="700" height="400" }

#### Android Filesystem

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/5e8dd9a4a45e18443162feab/room-content/5e8dd9a4a45e18443162feab-1747796686545.png)

#### Navigate the directories in FTK Imager. Examine the build.prop file found in the system folder. What is the device's serial number?
```text
ABC123456789
```
{: .nolineno }
{: file="Answer:" }

> 4th line in build.prop file located at system/build.prop
{: .prompt-tip }

---

## [Task 4] Android - Forensics Artifacts

#### Examine the artifact containing information about the device's installed apps. What is the last package installed on this device?

```text
com.sneakcam.capture
```
{: .nolineno }
{: file="Answer:" }

> check the package with firstInstallTime="1744812000000" 
{: .prompt-tip }

---

## [Task 6] Unboxing the Artifacts

#### What is the flag hidden inside SMS? 
```text
FLAG{MSG_HIDDEN_INTENT}
```
{: .nolineno }
{: file="Answer:" }

#### In the call logs, which number has the longest call duration?
```text
+14155550011
```
{: .nolineno }
{: file="Answer:" }

> `select * from calls order by duration;` in calllog.db
{: .prompt-tip }

#### What is the second-to-last suspicious contact name in the list?
```text
Encrypted User
```
{: .nolineno }
{: file="Answer:" }

> Contact nr 22
{: .prompt-tip }

#### Most Chrome searches indicate that the user was looking for sites to upload data. What is the last URL found in the list for a similar purpose?
```text
https://easyupload.io
```
{: .nolineno }
{: file="Answer:" }

> Look for `title = EasyUpload - Free Hosting`
{: .prompt-tip }

#### What is the name of the Bluetooth device found in the configuration?
```text
Pixel_6_User
```
{: .nolineno }
{: file="Answer:" }

> C:\Users\Administrator\Desktop\Evidence\suspicious_device\data\misc\bluedroid\bt_config.conf
{: .prompt-tip }

---

## [Task 7] Triaging with ALEAPP

#### What is the name of the package found that could be used for the data exfiltration?
```text
com.data.exfiltool
```
{: .nolineno }
{: file="Answer:" }

> ExifTool is a platform-independent Perl library plus a command-line application for reading, writing and editing meta information in a wide variety of files.
{: .prompt-tip }

#### One of the MMS message indicates the website used to send the sensitive file? What is the name of that site?
```text
MediaFire
```
{: .nolineno }
{: file="Answer:" }

> "I’ve sent the doc via `MediaFire`. Delete after review."
{: .prompt-tip }

#### In the contacts, what is the email address associated with the suspicious user named "Encrypted User"?
```text
ghost123@tutanota.com
```
{: .nolineno }
{: file="Answer:" }

> Use the search box to find the "Encrypted User"
{: .prompt-tip }

#### A sensitive PDF document was found on the device. Examine the document in the downloads folder. What is the flag hidden inside it?
```text
FLAG{INSIDER_ACCESS_42X9}
```
{: .nolineno }
{: file="Answer:" }

> sdcard/Download
{: .prompt-tip }