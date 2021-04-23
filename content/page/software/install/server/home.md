---
title: Server
comments: false
---

The server part of Transcrobes runs on [Kubernetes](https://kubernetes.io/). In order to use Transcrobes properly, you will need to have a Kubernetes cluster that is accessible from the internet (or can at least access your DNS provider). For development and small-scale testing, Transcrobes can be run on [k3s](https://k3s.io/), which allows you to run a full cluster on a single machine, or scale up with more nodes as needed.

# Supported Platforms

The following table gives an indication of the level of testing and support of Transcrobes on various common Kubernetes platforms, with links to detailed setup and configuration information, where it exists:

| Platform name | Documentation | Status | Comments |
|---------|------|---|-------------|
| k3s (coming soon) | Setup (coming soon) | Well tested | Currently the "reference platform" for Transcrobes |
| Microsoft Azure | | Planned |  |

# Setting up a cluster
## Prerequisites

Transcrobes requires a few things for you to set up the server applications. You will need access to a Kubernetes cluster and a domain. While the SSL certificates can be configured manually (or with Let's Encrypt via DNS), support/documentation is only provided for Let's Encrypt HTTP validation, so you will need ports 80 and 443 open (or get in touch on one of the lists).

Transcrobes also currently requires an Azure cloud account, but the free tier should be more than sufficient for extensive testing, and even active language learning for up to a few learners.

For further instructions on getting Transcrobes set up on a particular provider, see the dedicated pages above.

# User setup
See the dedicated [user setup page](/page/software/install/server/user-setup)
