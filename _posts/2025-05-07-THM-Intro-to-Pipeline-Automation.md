---
title: "[THM] Intro to Pipeline Automation"
description: This is a full walkthrough with answers and explanations for the TryHackMe room "Intro to Pipeline Automation".
author: hubert_k
date: 2025-05-07 19:00:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/66704dd0e54a1f39bff7b1a1-1735574672403
---

> Link to the room: <https://tryhackme.com/room/introtopipelineautomation>.
{: .prompt-info }

## [Task 2] DevOps Pipelines Explained

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/6093e17fa004d20049b6933e/room-content/5bf9574f4b8f6bc202123c9476650e58.png)

#### Where in the pipeline is our end product deployed?
```text
Environments
```
{: .nolineno }
{: file="Answer:" }

---

## [Task 3] Source Code and Version Control

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/6093e17fa004d20049b6933e/room-content/3804e1b22987fc90c27d19e511ead12e.png)

#### Who is the largest online provider of Git?
```text
Github
```
{: .nolineno }
{: file="Answer:" }

> GitHub is by far the largest provider of Internet hosting for software development and version control using Git.
{: .prompt-tip }

#### What popular Git product is used to host your own Git server?
```text
Gitlab
```
{: .nolineno }
{: file="Answer:" }

> You could also host your own git server using software such as Gitlab.
{: .prompt-tip }

#### What tool can be used to scan the commits of a repo for sensitive information?
```text
GittyLeaks
```
{: .nolineno }
{: file="Answer:" }

> If an attacker got access to the repo, they could use a tool such as GittyLeaks, which would scan through the commits for sensitive information.
{: .prompt-tip }

---

## [Task 4] Dependency Management

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/6093e17fa004d20049b6933e/room-content/05428b2c1ae49738813c1644df3a31a3.png)

#### What do we call the type of dependency that was created by our organisation? (Internal/External)
```text
Internal
```
{: .nolineno }
{: file="Answer:" }

#### What type of dependency is JQuery? (Internal/External)
```text
External
```
{: .nolineno }
{: file="Answer:" }

#### What is the name of Python's public dependency repo?
```text
PyPi
```
{: .nolineno }
{: file="Answer:" }

> Example external dependency managers: 
- `PyPi` for Python, 
- NuGet for .NET, 
- and Gems for Ruby libraries.
{: .prompt-tip }

#### What dependency 0day vulnerability set the world ablaze in 2021?
```text
Log4j
```
{: .nolineno }
{: file="Answer:" }

> A 0day vulnerability was discovered in `Log4j` dependency in 2021 called Log4Shell. `Log4j` is a Java-based logging utility. It is part of the Apache Logging Services, a project of the Apache Software Foundation. The vulnerability could allow an unauthenticated attacker to gain remote code execution on a system that makes use of the logger. The true issue? This small little dependency was used almost literally everywhere.
{: .prompt-tip }

---

## [Task 5] Automated Testing

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/6093e17fa004d20049b6933e/room-content/d532d7168eaa7553b54464a6736f42fd.png)

#### What type of tool scans code to look for potential vulnerabilities?
```text
SAST
```
{: .nolineno }
{: file="Answer:" }

> Static Application Security Testing (`SAST`) works by reviewing the source code of the application or service to identify sources of vulnerabilities.
{: .prompt-tip }

#### What type of tool runs code and injects test cases to look for potential vulnerabilities?
```text
DAST
```
{: .nolineno }
{: file="Answer:" }

> One method that `DAST` tools use to find additional vulnerabilities, such as Cross Site Scripting (XSS), is by creating sources and sinks.
{: .prompt-tip }

#### Can SAST and DAST be used as a replacement for penetration tests? (Yea,Nay)
```text
Nay
```
{: .nolineno }
{: file="Answer:" }

> Sadly, SAST and DAST tools cannot fully replace manual testing, such as penetration tests. There have been significant advancements in automated testing and even in some cases, these techniques were combined with more modern approaches to create new testing techniques such as  Interactive Application Security Testing (IAST) and Runtime Application Self-Protection (RASP).
{: .prompt-tip }

---

## [Task 6] Continuous Integration and Delivery

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/6093e17fa004d20049b6933e/room-content/678d09b2f788f32a2766556cb4730701.png)

#### What does CI in CI/CD stand for?
```text
Continuous Integration
```
{: .nolineno }
{: file="Answer:" }

#### What does CD in CI/CD stand for?
```text
Continuous Delivery
```
{: .nolineno }
{: file="Answer:" }

#### What do we call the build infrastructure element that controls all builds?
```text
Build Orchestrator
```
{: .nolineno }
{: file="Answer:" }

> A `build orchestrator` directs the various agents to perform the actions of the CI/CD pipelines as required.
{: .prompt-tip }

#### What do we call the build infrastructure element that performs the build?
```text
Build Agent
```
{: .nolineno }
{: file="Answer:" }

> A `build agent` is a software component, typically a program or a virtual machine, that executes the tasks and steps defined in a build pipeline.
{: .prompt-tip }

---

## [Task 7] Environments

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/6093e17fa004d20049b6933e/room-content/0065d23932f564df870affd95f73dd3d.png)

#### Which environment usually has the weakest security configuration?
```text
DEV
```
{: .nolineno }
{: file="Answer:" }

> The DEV environment is the playground for developers. This environment is the most unstable as developers are continuously pushing new code and testing it. From a security standpoint, this environment has the weakest security.
{: .prompt-tip }

#### Which environment is used to test the application?
```text
UAT
```
{: .nolineno }
{: file="Answer:" }

> The UAT environment is used to test the application or select features before they are pushed to production.
{: .prompt-tip }

#### Which environment is similar to PROD but is used to verify that everything is working before it is pushed to PROD?
```text
PrePROD
```
{: .nolineno }
{: file="Answer:" }

> The PreProd environment is used to mimic production without actual customer/user data.
{: .prompt-tip }

#### What is a common class of vulnerabilities that is discovered in PROD due to insecure code creeping in from DEV?
```text
Developer Bypasses
```
{: .nolineno }
{: file="Answer:" }

> `Developer bypasses` allow developers to quickly test different application features by bypassing time-consuming features such as MFA prompts. A common example is having a specific One-Time Pin (OTP) code that is always accepted, regardless of the OTP code that is sent by the application.
{: .prompt-tip }

---

## [Task 8] Challenge

![img-description](https://tryhackme-images.s3.amazonaws.com/user-uploads/6093e17fa004d20049b6933e/room-content/5bf9574f4b8f6bc202123c9476650e58.png)

#### What is the flag received after successfully building your pipeline?
```text
THM{Pipeline.Automation.Is.Fun}
```
{: .nolineno }
{: file="Answer:" }