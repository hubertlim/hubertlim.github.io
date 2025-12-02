---
title: "[THM] K8s Best Security Practices"
description: This is a full walkthrough with answers and explanations for the TryHackMe room "K8s Best Security Practices".
author: hubert_k
date: 2025-12-02 06:00:00 +0800
categories: [THM]
tags: [Security, THM, Walkthrough]
pin: true
math: true
mermaid: true
image:
    path: https://tryhackme-images.s3.amazonaws.com/room-icons/6228f0d4ca8e57005149c3e3-1718621162033
---

> Link to the room: <https://tryhackme.com/room/k8sbestsecuritypractices>.
{: .prompt-info }


---

## [Task 2] ServiceAccounts

> ServiceAccounts:	
- Managed by K8s
- Created by the API
- Have Associated Credentials which are stored as Secrets
{: .prompt-info }

> Users:
- Managed outside of K8s
- There is no “User” Kubernetes Object  
- Cannot be created by API
{: .prompt-info }

#### What are the credentials associated with a ServiceAccount stored as?
> Review the "ServiceAccounts Vs Users" tabele.
{: .prompt-tip }

```text
secrets
```
{: .nolineno }
{: file="Answer:" }

#### Kubernetes ServiceAccounts are Lightweight, Namespaced and which other attribute?
> Tell me more… 
{: .prompt-tip }

```text
Portable
```
{: .nolineno }
{: file="Answer:" }

## [Task 3] RBAC
> Role: What can this role do, and to what resource(s)? Permissions are additive, meaning there are no deny permissions. Think of this as allowlisting for API access. You will provide a verb (what can this role do), e.g. "get" or "delete", and a resource (and to what), e.g. "pods" or "secrets". Note that sub-resources can also be defined here using a / after the resource name, e.g. pods/log. This will be visualised with a configuration example soon. Roles are namespaces, meaning they can allow actions within a given namespace, not the entire cluster.
{: .prompt-info }

> RoleBinding: The RoleBinding object does what it says on the tin. It binds a Role (defined above) to a ServiceAccount or User. As Roles are namespaced, the role mentioned in the RoleBinding configuration YAML will need to exist in the same namespace as the RoleBinding.
{: .prompt-info }

> ClusterRole: A ClusterRole is functionally the same as a Role, except roles are granted on a (non-namespaced) cluster level. This would be used if access is needed to cluster-level resources like nodes or resources across multiple namespaces. Again, only if this is NEEDED, with least privilege in mind.
{: .prompt-info }

> ClusterRoleBinding: A ClusterRoleBinding is functionally the same as a RoleBinding except it binds a ClusterRole to a ServiceAccount or user.
{: .prompt-info }

#### You have defined a "Role". What should you now define to associate that role with an identity?
> The RoleBinding object does what it says on the tin. It binds a Role (defined above) to a ServiceAccount or User. As Roles are namespaced, the role mentioned in the RoleBinding configuration YAML will need to exist in the same namespace as the RoleBinding.
{: .prompt-tip }

```text
RoleBinding
```
{: .nolineno }
{: file="Answer:" }

#### You now want to define permissions at a cluster level; what do you define?
> A ClusterRole is functionally the same as a Role, except roles are granted on a (non-namespaced) cluster level. This would be used if access is needed to cluster-level resources like nodes or resources across multiple namespaces. Again, only if this is NEEDED, with least privilege in mind.
{: .prompt-tip }

```text
ClusterRole
```
{: .nolineno }
{: file="Answer:" }

#### In which field under "rules" would you define the actions that can be performed on a resource? (in the role YAML/spec)
> Review the rule definition script in "Defining RBAC" section.
{: .prompt-tip }

```text
verbs
```
{: .nolineno }
{: file="Answer:" }

#### In which field under "rules" would you define to what those actions should be applied? (in the role YAML/spec)
> Review the rule definition script in "Defining RBAC" section.
{: .prompt-tip }

```text
resources
```
{: .nolineno }
{: file="Answer:" }

## [Task 4] API Requests in Kubernetes

>
Accessing the Kubernetes API:
1. Kubectl 
2. Proxy 
3. Auth Token 
4. Programmatic
{: .prompt-info }

>
API Request Stages:
1. Authentication
2. Authorisation
3. Admission Controllers
{: .prompt-info }

#### Which cluster access method would be vulnerable to a MITM attack?
> This method accesses the Kubernetes API directly by providing the HTTP client with the cluster location and credentials. For this reason, it is not recommended (as it would be vulnerable to a MITM attack). 
{: .prompt-tip }

```text
Auth Token
```
{: .nolineno }
{: file="Answer:" }

#### Which API request stage would RBAC be involved in?
> Do you have permission to do what you are trying to do?
{: .prompt-tip }

```text
Authorisation
```
{: .nolineno }
{: file="Answer:" }

#### In which API request stage would we find the words "Mutating" and "Validating"? 
> They can be validating (is this action permitted, does it breach a check) or Mutating (e.g. in a request to create a pod, the pod's name might need to be changed to match a custom naming convention).
{: .prompt-tip }

```text
Admission Controllers
```
{: .nolineno }
{: file="Answer:" }

#### In which API request stage would a ServiceAccount token be used to verify a ServiceAccount?
> Are you who you say you are?
{: .prompt-tip }

```text
Authentication
```
{: .nolineno }
{: file="Answer:" }

## [Task 5] More Best Security Practices

> "Deny Privilege Escalation":
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
  Namespace: example-namespace
spec:
  securityContext: 
      allowPrivilegeEscalation: false
```
{: .prompt-info }

> "Non Root User":
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
  Namespace: example-namespace
spec:
  securityContext: 
      runAsUser:
```
{: .prompt-info }

#### Which best security practice should be introduced to the CI/CD pipeline?
> Image scanning should always be introduced into a CI/CD pipeline as a best security practice.  
{: .prompt-tip }

```text
Image Scanning
```
{: .nolineno }
{: file="Answer:" }

#### What should be set as "false" in configuration to ensure a container cannot have its privileges escalated?
> Review the "Deny Privilege Escalation" yaml example.
{: .prompt-tip }

```text
allowPrivilegeEscalation
```
{: .nolineno }
{: file="Answer:" }

#### To ensure the security of etcd, it should be isolated, behind a firewall and?
> This way, if an attacker was able to access the etcd, they wouldn't be able to decipher the contents.
{: .prompt-tip }

```text
encrypted
```
{: .nolineno }
{: file="Answer:" }

#### How many cluster upgrades would you have to do to go from version 1.21 to 1.25
> 1.21 -> 1.22 -> 1.23 -> 1.24 -> 1.25
{: .prompt-tip }

```text
4
```
{: .nolineno }
{: file="Answer:" }

## [Task 6] Practical

#### What's the encoded role?
> 
1) Create a ServiceAccount called "pod-checker":
```text
kubectl create serviceaccount pod-checkerte -n test-chambers 
```
2) Create a role named "pod-checker-role" which can "get" and "list" "pod" resources only
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-checker-role
  namespace: test-chambers
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list"]
```
3) Create a RoleBinding which binds the "pod-checker-role" to the "pod-checker" ServiceAccount
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-checker-role-binding
  namespace: test-chambers
subjects:
- kind: ServiceAccount
  name: pod-checker
  namespace: test-chambers
roleRef:
  kind: Role
  name: pod-checker-role
  apiGroup: rbac.authorization.k8s.io
```
4) Delete the pod-status-checker pod
```text
kubectl delete pod pod-status-checker -n test-chambers
```
5) Make changes to the ~/Documents/pod-config/pod-checker.yaml config so the pod uses the pod-checker ServiceAccount instead of pod-admin, then apply this config
```text
Replace the value of the ServeiceAccountName. 
```
{: .prompt-tip }

```text
TmFtZTogICAgICAgICBwb2QtY2hlY2tlci1yb2xlCkxhYmVsczogICAgICAgPG5vbmU+CkFubm90YXRpb25zOiAgPG5vbmU+ClBvbGljeVJ1bGU6CiAgUmVzb3VyY2VzICBOb24tUmVzb3VyY2UgVVJMcyAgUmVzb3VyY2UgTmFtZXMgIFZlcmJzCiAgLS0tLS0tLS0tICAtLS0tLS0tLS0tLS0tLS0tLSAgLS0tLS0tLS0tLS0tLS0gIC0tLS0tCiAgcG9kcyAgICAgICBbXSAgICAgICAgICAgICAgICAgW10gICAgICAgICAgICAgIFtnZXQgbGlzdF0=
```
{: .nolineno }
{: file="Answer:" }
