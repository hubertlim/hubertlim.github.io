---
title: "[THM Walkthrough] Intro to Docker"
description: This is a full walkthrough with answers and explanations for the TryHackMe room "Intro to Docker".
author: hubert_k
date: 2025-04-18 18:30:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/66704dd0e54a1f39bff7b1a1-1735574684594
---

> Link to the room: <https://tryhackme.com/room/introtodockerk8pdqk>.
{: .prompt-info }

## [Task 2] Basic Docker Syntax

#### If we wanted to pull a docker image, what would our command look like?
```text
docker pull
```
{: .nolineno }
{: file="Answer:" }

> Images can be downloaded using the `docker pull` command and providing the name of the image.
{: .prompt-tip }

#### If we wanted to list all images on a device running Docker, what would our command look like?
```text
docker image ls
```
{: .nolineno }
{: file="Answer:" }

> `ls` (list images)
{: .prompt-tip }

#### Let's say we wanted to pull the image "tryhackme" (no quotations); what would our command look like?
```text
docker pull tryhackme
```
{: .nolineno }
{: file="Answer:" }

> Images can be downloaded using the `docker pull` command and providing the `name of the image`.
{: .prompt-tip }

#### Let's say we wanted to pull the image "tryhackme" with the tag "1337" (no quotations). What would our command look like?
```text
docker pull tryhackme:1337
```
{: .nolineno }
{: file="Answer:" }

> In Docker, a tag specifies a particular version of an image to pull, allowing you to choose between different builds (e.g., latest, `1337`, alpine) of the same image repository.
{: .prompt-tip }

---

## [Task 3] Running Your First Container

#### What would our command look like if we wanted to run a container interactively? Note: Assume we are not specifying any image here.
```text
docker run -it
```
{: .nolineno }
{: file="Answer:" }

> To allow us to interact with the container directly, we need to use the `-it` switch.
{: .prompt-tip }

#### What would our command look like if we wanted to run a container in "detached" mode? Note: Assume we are not specifying any image here.
```text
docker run -d
```
{: .nolineno }
{: file="Answer:" }

> `-d` : This argument tells the container to start in "detached" mode. This means that the container will run in the background.
{: .prompt-tip }

#### Let's say we want to run a container that will run and bind a webserver on port 80. What would our command look like? Note: Assume we are not specifying any image here.
```text
docker run -p 80:80
```
{: .nolineno }
{: file="Answer:" }

> `-p` : This argument tells Docker to bind a port on the host operating system to a port that is being exposed in the container. 
{: .prompt-tip }

#### How would we list all running containers?
```text
docker ps
```
{: .nolineno }
{: file="Answer:" }

> To list all containers, you can use `docker ps`.
{: .prompt-tip }

#### Now, how would we list all containers (including stopped)?
```text
docker ps -a
```
{: .nolineno }
{: file="Answer:" }

> To list all containers (even stopped), you can use `docker ps -a`.
{: .prompt-tip }

---

## [Task 4] Intro to Dockerfiles

#### What instruction would we use to specify what base image the container should be using?
```text
FROM
```
{: .nolineno }
{: file="Answer:" }

> `FROM` : This instruction sets a build stage for the container as well as setting the base image (operating system). All Dockerfiles must start with this.
{: .prompt-tip }

#### What instruction would we use to tell the container to run a command?
```text
RUN
```
{: .nolineno }
{: file="Answer:" }

> `RUN` : This instruction will execute commands in the container within a new layer.
{: .prompt-tip }

#### What docker command would we use to build an image using a Dockerfile?
```text
build
```
{: .nolineno }
{: file="Answer:" }

> Once we have a Dockerfile, we can create an image using the docker `build` command. 
{: .prompt-tip }

#### Let's say we want to name this image; what argument would we use?
```text
-t
```
{: .nolineno }
{: file="Answer:" }

> Whether or not you want to name the image yourself (we will use the `-t` (tag) argument).
{: .prompt-tip }

---

## [Task 5] Intro to Docker Compose

#### I want to use docker-compose to start up a series of containers. What argument allows me to do this?
```text
up
```
{: .nolineno }
{: file="Answer:" }

> `up` : This command will (re)create/build and start the containers specified in the compose file.
{: .prompt-tip }

#### I want to use docker-compose to delete the series of containers. What argument allows me to do this?
```text
down
```
{: .nolineno }
{: file="Answer:" }

> `down` : This command will stop and delete the containers specified in the compose file.
{: .prompt-tip }

#### What is the name of the .yml file that docker-compose uses? Note: for this question, you will need to include the .yml file extension in your answer
```text
docker-compose.yml
```
{: .nolineno }
{: file="Answer:" }

> `docker-compose.yml` - One file to rule them all.
{: .prompt-tip }

---

## [Task 6] Intro to the Docker Socket

#### What does the term "IPC" stand for?
```text
Interprocess Communication
```
{: .nolineno }
{: file="Answer:" }

> `Interprocess Communication` is the definition of the mechaism that allows processes to communicate and share data between each other.
{: .prompt-tip }

#### What technology can the Docker Server be equalled to?
```text
API
```
{: .nolineno }
{: file="Answer:" }

> In the context of Docker, the Docker Server is effectively just an `API`.
{: .prompt-tip }

---

## [Task 7] Practical
#### Connect to the machine. What is the name of the container that is currently running?
```text
CloudIsland
```
{: .nolineno }
{: file="Answer:" }

> Use the command `docker ps`.
{: .prompt-tip }

#### Use Docker to start a web server with the "webserver" image (no quotations). You will need to run the container with port 80. After starting the container, try to connect to https://LAB_WEB_URL.p.thmlabs.com/ in your browser. What is the flag?
```text
THM{WEBSERVER_CONTAINER}
```
{: .nolineno }
{: file="Answer:" }

> Use the command `docker run -p 80:80 webserver`.
{: .prompt-tip }