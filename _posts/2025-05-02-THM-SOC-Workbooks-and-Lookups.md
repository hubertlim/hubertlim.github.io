---
title: "[THM] SOC Workbooks and Lookups"
description: This is a full walkthrough with answers and explanations for the TryHackMe room "SOC Workbooks and Lookups".
author: hubert_k
date: 2025-05-02 16:00:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/678ecc92c80aa206339f0f23-1743518808955
---

> Link to the room: <https://tryhackme.com/room/socworkbookslookups>.
{: .prompt-info }

## [Task 2] Assets & Identities

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/61306d87a330ed00419e22e7/room-content/61306d87a330ed00419e22e7-1732457620979.png)

#### Looking at the identity inventory, what is the role of R.Lund at the company?
```text
US Financial Adviser
```
{: .nolineno }
{: file="Answer:" }

> Check the "Role" column in the identity inventory table for R.Lund.
{: .prompt-tip }

#### Checking the asset inventory, what data does the HQ-FINFS-02 server store?
```text
Financial records
```
{: .nolineno }
{: file="Answer:" }

> Check the "Purpose" column in the asset inventory table for HQ-FINFS-02.
{: .prompt-tip }


#### Finally, does the file sharing from the scenario look legitimate and expected? (Yea/Nay)
```text
Yea
```
{: .nolineno }
{: file="Answer:" }

---

## [Task 3] Network Diagrams

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/678ecc92c80aa206339f0f23/room-content/678ecc92c80aa206339f0f23-1742848063212.png)
_network diagram_

#### According to the network diagram, which service is exposed on the TCP/10443 port?
```text
VPN
```
{: .nolineno }
{: file="Answer:" }

#### Now, which subnet would the server behind 172.16.15.99 IP belong to?
```text
Database subnet
```
{: .nolineno }
{: file="Answer:" }


#### Finally, does the scenario look like a True Positive (TP) or False Positive (FP)?
```text
TP
```
{: .nolineno }
{: file="Answer:" }

> VPN brute force, DB scan, switching subnets is something that can turn on your inner SOC radar.
{: .prompt-tip }

---

## [Task 4] Workbooks Theory

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/678ecc92c80aa206339f0f23/room-content/678ecc92c80aa206339f0f23-1743455620681.svg)
_Unusual Login Location Workbook_

#### Which SOC role would use workbooks the most (e.g. SOC Manager)?
```text
SOC L1 Analyst
```
{: .nolineno }
{: file="Answer:" }

#### What is the process of gathering user, host, or IP context using TI and lookups?
```text
Enrichment
```
{: .nolineno }
{: file="Answer:" }

> `Enrichment`: Use Threat Intelligence and identity inventory to get information about the affected user
{: .prompt-tip }


#### Looking at the workbook example, what platform is used as an identity inventory source?
```text
BambooHR
```
{: .nolineno }
{: file="Answer:" }

> Review the enrichment stage in the workbook. 
{: .prompt-tip }

---

## [Task 5] Workbooks Practice

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/678ecc92c80aa206339f0f23/room-content/678ecc92c80aa206339f0f23-1744813015011.gif)

#### What flag did you receive after completing the first workbook?
```text
THM{the_most_common_soc_workbook}
```
{: .nolineno }
{: file="Answer:" }

#### What flag did you receive after completing the second workbook?
```text
THM{be_vigilant_with_powershell}
```
{: .nolineno }
{: file="Answer:" }

#### What flag did you receive after completing the third workbook?
```text
THM{asset_inventory_is_essential}
```
{: .nolineno }
{: file="Answer:" }