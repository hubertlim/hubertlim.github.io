---
title: "[THM Walkthrough] MS Sentinel: Introduction"
description: This is a full walkthrough with answers and explanations for the TryHackMe room "MS Sentinel Introduction".
author: hubert_k
date: 2025-04-18 15:20:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/5efbaebdaaea011c857b438d-1718634714294
---

> Link to the room: <https://tryhackme.com/room/sentinelintroduction>.
{: .prompt-info }

## [Task 1] Microsoft Security Operations Analyst

#### What security unit is responsible for protecting the organization against security threats?
```text
Security Operations Center
```
{: .nolineno }
{: file="Answer:" }

> "A `Security Operations Center` (SOC) is a centralized security unit with team(s) responsible for protecting the organization against security threats."
{: .prompt-tip }

#### Generally, which level of SOC Analyst is responsible for responding to incidents?
```text
SOC Level 2 Analyst
```
{: .nolineno }
{: file="Answer:" }

> Incident response is a responsibilitie of `SOC Level 2 Analyst` based on the table in Task 1. 
{: .prompt-tip }

#### Besides monitoring, what else do SOC Level 1 Analysts spend the majority of their time with?
```text
triage
```
{: .nolineno }
{: file="Answer:" }

> Monitoring and `triage` are responsibilities of SOC Level 1 Analyst based on the table in Task 1. 
{: .prompt-tip }

---

## [Task 2] Introduction to Microsoft Sentinel
#### Microsoft Sentinel is a combination of two security concepts, namely SIEM and which other one?
```text
SOAR
```
{: .nolineno }
{: file="Answer:" }

> Microsoft Sentinel is a scalable, cloud-native solution that provides the functionality of Security Information and Event Management (SIEM) and Security Orchestration, Automation, and Response (`SOAR`).
{: .prompt-tip }

#### Creating security alerts and incidents is part of which security concept?
```text
SIEM
```
{: .nolineno }
{: file="Answer:" }

> `SIEM` functionalities are 
- Collecting and querying logs, 
- Doing correlation or anomaly detection 
- Creating alerts and incidents based on findings
{: .prompt-tip }

#### By means of how many pillars does Microsoft Sentinel help us to perform security operations?
```text
4
```
{: .nolineno }
{: file="Answer:" }

> Microsoft Sentinel performs the above actions and enables security operations by means of 4 main pillars:
- Collect
- Detect
- Investigate
- Respond
{: .prompt-tip }

---

## [Task 3] How Microsoft Sentinel Works
#### What is used to ingest data into Sentinel?
```text
data connectors
```
{: .nolineno }
{: file="Answer:" }

> The first step is to ingest data into Microsoft Sentinel. This is exactly what `data connectors` are for.
{: .prompt-tip }


#### Where are the ingested logs stored for further correlation and analysis?
```text
log analytics workspaces
```
{: .nolineno }
{: file="Answer:" }

> Once the data has been ingested into Microsoft Sentinel, it must be stored for further correlation and analysis. This log storage mechanism is called `Log Analytics workspaces`.
{: .prompt-tip }

#### Workbooks are essentially _______ used for visualization.
```text
dashboards
```
{: .nolineno }
{: file="Answer:" }

> Workbooks are essentially `dashboards` in Microsoft Sentinel used to visualize data.
{: .prompt-tip }

#### When SOC teams are flooded with security alerts and incidents, this is called?
```text
alert fatigue
```
{: .nolineno }
{: file="Answer:" }

> `Alert fatigue` occurs occurs when cyber security professionals are inundated with a high volume of security alerts, which leads to a diminished ability for SOC teams to react effectively to and investigate real threats.
{: .prompt-tip }

#### In Microsoft Sentinel, automation is done via automated workflows, known as?
```text
playbooks
```
{: .nolineno }
{: file="Answer:" }

> To overcome alert fatigue, automation in security operations is a must. This is done by automated workflows, also known as `playbooks`, in response to events.
{: .prompt-tip }

#### The output of running Analytics rules includes security alerts and?
```text
Incidents
```
{: .nolineno }
{: file="Answer:" }

> The output of running Analytics rules are security alerts and `incidents`.
{: .prompt-tip }

---

## [Task 4] When To Use Microsoft Sentinel

#### Organizations use Microsoft Sentinel mainly because they need to _______ their cloud infrastructure.
```text
monitor
```
{: .nolineno }
{: file="Answer:" }

> Organizations use Microsoft Sentinel when there is a necessity to `monitor` cloud and on-premises infrastructures for security.
{: .prompt-tip }

#### With Microsoft Sentinel, there is no need for server provisioning. This means it is?
```text
cloud-native
```
{: .nolineno }
{: file="Answer:" }

> `Cloud-native` SIEM - No need for server provisioning, facilitating seamless scalability
{: .prompt-tip }