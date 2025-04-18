---
title: "[THM Walkthrough] SOC L1 Alert Reporting"
description: This is a full walkthrough with answers and explanations for the TryHackMe room "SOC L1 Alert Reporting".
author: hubert_k
date: 2025-04-18 16:00:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/678ecc92c80aa206339f0f23-1743518414935
---

> Link to the room: <https://tryhackme.com/room/socl1alertreporting>.
{: .prompt-info }

## [Task 2] Alert Funnel

#### What is the process of passing suspicious alerts to an L2 analyst for review?
```text
Alert Escalation
```
{: .nolineno }
{: file="Answer:" }

> `Alert Escalation`: If the True Positive alert requires additional actions or deeper investigation, escalate it to the L2 analyst for further review following the agreed procedures.
{: .prompt-tip }

#### What is the process of formally describing alert details and findings?
```text
Alert Reporting
```
{: .nolineno }
{: file="Answer:" }

> `Alert Reporting`: Before closing or passing the alert to L2, you might have to report it. Depending on team standards and alert severity, instead of a short alert comment, you can be required to document your investigation in detail, ensuring all relevant evidence is included.
{: .prompt-tip }

---

## [Task 3] Reporting Guide

#### According to the SOC dashboard, which user email leaked the sensitive document?
```text
m.boslan@tryhackme.thm
```
{: .nolineno }
{: file="Answer:" }

> Check the details of the alert "Sensitive Document Share to External" in the SOC dashboard.
{: .prompt-tip }

#### Looking at the new alerts, who is the "sender" of the suspicious, likely phishing email?
```text
support@microsoft.com
```
{: .nolineno }
{: file="Answer:" }

> Check the details of the alert "Email Marked as Phishing after Delivery" in the SOC dashboard.
{: .prompt-tip }

#### Open the phishing alert, read its details, and try to understand the activity. Using the Five Ws template, what flag did you receive after writing a good report?
```text
THM{nice_attempt_faking_microsoft_support}
```
{: .nolineno }
{: file="Answer:" }

> Check the details of the alert "Email Marked as Phishing after Delivery" in the SOC dashboard, and fill the report.
{: .prompt-tip }

---

## [Task 4] Escalation Guide

#### Who is your current L2 in the SOC dashboard that you can assign (escalate) the alerts to?
```text
E.Fleming
```
{: .nolineno }
{: file="Answer:" }

> Check the "Assignee" column in the SOC dashboard.
{: .prompt-tip }

#### What flag did you receive after correctly escalating the alert from the previous task to L2? Note: If you correctly escalated the alert earlier, just edit the alert and click "Save" again
```text
THM{good_job_escalating_your_first_alert}
```
{: .nolineno }
{: file="Answer:" }

> Change the "Assignee" column value to E.Fleming and keep the alert "in progress".
{: .prompt-tip }

#### Now, investigate the second new alert in the queue and provide a detailed alert comment. Then, decide if you need to escalate this alert and move on according to the process. After you finish your triage, you should receive a flag, which is your answer!
```text
THM{looks_like_webshell_via_old_exchange}
```
{: .nolineno }
{: file="Answer:" }

> Write the report for the alert "Spike of Domain Discovery Commands". Remember about the 5W.
{: .prompt-tip }

---

## [Task 5] SOC Communication

#### Should you first try to contact your manager in case of a critical threat (Yea/Nay)?
```text
Nay
```
{: .nolineno }
{: file="Answer:" }

> At first contact L2.
{: .prompt-tip }

#### Should you immediately contact your L2 if you think you missed the attack (Yea/Nay)?
```text
Yea
```
{: .nolineno }
{: file="Answer:" }

> Prioritise the alerts according to the workflow, but inform your L2 on shift about the situation.
{: .prompt-tip }