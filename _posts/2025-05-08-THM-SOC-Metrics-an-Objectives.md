---
title: "[THM] SOC Metrics and Objectives"
description: This is a full walkthrough with answers and explanations for the TryHackMe room "SOC Metrics and Objectives".
author: hubert_k
date: 2025-05-08 20:00:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/678ecc92c80aa206339f0f23-1743519663017
---

> Link to the room: <https://tryhackme.com/room/socmetricsobjectives>.
{: .prompt-info }

## [Task 2] Core Metrics

| Metric                | Formula                                  | Measures                     | 
| --------------------- | ---------------------------------------- | ---------------------------- |
| Alerts Count          | `AC = Total Count of Alerts Received`    | Overall load of SOC analysts | 
| False Positive Rate   | `FPR = False Positives / Total Alerts`   | Level of noise in the alerts |
| Alert Escalation Rate | `AER = Escalated Alerts / Total Alerts`  | Experience of L1 analysts    |
| Threat Detection Rate | `TDR = Detected Threats / Total Threats` | Reliability of the SOC team  |

#### Is zero alerts for one month a good sign for your SOC team? (Yea/Nay)
```text
Nay
```
{: .nolineno }
{: file="Answer:" }

> Too low count of alerts may indicate an issue in the SIEM or lack of visibility, leading to undetected breaches.
{: .prompt-tip }

#### What is the False Positive Rate if only 10 out of 50 alerts appear to be real threats?
```text
80%
```
{: .nolineno }
{: file="Answer:" }

> TDR = Detected Threats / Total Threats 
- 50 Total Threats where 10 are real threats, so we have 40 false positives.
- TDR = 40 Detected Threats / 50 Total Threats = `80%`
{: .prompt-tip }

---

## [Task 3] Triage Metrics

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/678ecc92c80aa206339f0f23/room-content/678ecc92c80aa206339f0f23-1746642255233.svg)

| Metric                          | Common SLA | Description                                                              |  
| ------------------------------- | ---------- | ------------------------------------------------------------------------ |
| SOC Team Availability           | 24/7       | Working schedule of the SOC team, often Monday-Friday (8/5) or 24/7 mode | 
| Mean Time to Detect (MTTD)      | 5 minutes  | Average time between the attack and its detection by SOC tools           |
| Mean Time to Acknowledge (MTTA) | 10 minutes | Average time for L1 analysts to start triage of the new alert            |
| Mean Time to Respond (MTTR)     | 60 minutes | Average time taken by SOC to actually stop the breach from spreading     |

#### Imagine a scenario where the SOC team receives a critical alert on Saturday. If the team works 8/5, on which day of the week will they acknowledge the alert?
```text
Monday
```
{: .nolineno }
{: file="Answer:" }

> Monday will be the first day after Saturday in 8/5 work time.
{: .prompt-tip }

#### Imagine a scenario where an employee was lured into running data stealer malware.

  1. The SOC team received the "Connection to Redline Stealer C2" alert after 12 minutes.
  2. One of the L1 analysts on shift moved the alert to In Progress 10 minutes later.
  3. After 6 minutes, the alert was escalated to L2, who spent 35 minutes cleaning the malware.

Provide the MTTD, MTTA, and MTTR via comma as your answer (e.g. 10,20,30).
```text
12,10,51
```
{: .nolineno }
{: file="Answer:" }

> MTTD = 12 min, MTTA = 10 min, MTTR = 10 min + 6 min + 35 min = 51 min
{: .prompt-tip }

## [Task 4] Improving Metrics

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/678ecc92c80aa206339f0f23/room-content/678ecc92c80aa206339f0f23-1746186772909.svg)

| Issue                                | Recommendations |
| ------------------------------------ | ---------- | 
| False Positive Rate over 80%         | Your team receives too much noise in the alerts. Try to:  |
|        | 1. Exclude trusted activities like system updates from your EDR or SIEM detection rules |  
|        | 2. Consider automating alert triage for most common alerts using SOAR or custom scripts |  
| Mean Time to Detect over 30 min      | Your team detects a threat with a high delay. Try to:     |
|        | 1. Contact SOC engineers to make the detection rules run faster or with a higher rate   |  
|        | 2. Check if SIEM logs are collected in real-time, without a 10-minute delay             | 
| Mean Time to Acknowledge over 30 min | L1 analysts start alert triage with a high delay. Try to: |
|        | 1. Ensure the analysts are notified in real-time when a new alert appears               |  
|        | 2. Try to evenly distribute alerts in the queue between the analysts on shift           |
| Mean Time to Respondover 4 hours     | SOC team can't stop the breach in time. Try to:           |
|        | 1. As L1, make everything possible to quickly escalate the threats to L2                |  
|        | 2. Ensure your team has documented what to do during different attack scenarios         | 

#### What is the False Positive Rate limit you should aim not to reach?
```text
80%
```
{: .nolineno }
{: file="Answer:" }

> When false positive rate hits over 80% you should consider to try automating alert triage, or exclude trusted activities from your EDR or SIEM detection rules.
{: .prompt-tip }

#### Should all SOC roles work together to keep metrics improving? (Yea/Nay)
```text
Yea
```
{: .nolineno }
{: file="Answer:" }

> Metrics are often used to evaluate your performance, and good results lead to career growth and a raise to more senior positions like L2 analyst.
{: .prompt-tip }

## [Task 5] Practice Scenarios

#### What flag did you get after completing the first scenario?
```text
THM{mttr:quick_start_but_slow_response}
```
{: .nolineno }
{: file="Answer:" }

> MTTR to high, documentation, send the docs to L2
{: .prompt-tip }

#### What flag did you get after completing the second scenario?
```text
THM{mttd:time_between_attack_and_alert}
```
{: .nolineno }
{: file="Answer:" }

> delayed alert triage, tune to 5 min, SOC review
{: .prompt-tip }

#### What flag did you get after completing the third scenario?
```text
THM{fpr:the_main_cause_of_l1_burnout}
```
{: .nolineno }
{: file="Answer:" }

> FPR to high, FP remediation process, assign SOC to exclude noise from the rules 
{: .prompt-tip }