# Dragonfly

[![Join the chat at https://gitter.im/alibaba/Dragonfly](https://badges.gitter.im/alibaba/Dragonfly.svg)](https://gitter.im/alibaba/Dragonfly?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License](https://img.shields.io/badge/license-Apache%202-brightgreen.svg)](https://github.com/alibaba/Dragonfly/blob/master/LICENSE)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Falibaba%2FDragonfly.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Falibaba%2FDragonfly?ref=badge_shield)
[![GoDoc](https://godoc.org/github.com/alibaba/Dragonfly?status.svg)](https://godoc.org/github.com/alibaba/Dragonfly)
[![Go Report Card](https://goreportcard.com/badge/github.com/alibaba/Dragonfly)](https://goreportcard.com/report/github.com/alibaba/Dragonfly)
[![Build Status](https://travis-ci.org/alibaba/Dragonfly.svg?branch=master)](https://travis-ci.org/alibaba/Dragonfly)
[![CircleCI](https://circleci.com/gh/alibaba/Dragonfly.svg?style=svg)](https://circleci.com/gh/alibaba/Dragonfly)
[![codecov](https://codecov.io/gh/alibaba/Dragonfly/branch/master/graph/badge.svg)](https://codecov.io/gh/alibaba/Dragonfly)

![Dragonfly](docs/images/logo/dragonfly-linear.png)

## Contents

- [Introduction](#introduction)
- [Features](#features)
- [Comparison](#comparison)
- [Quick Start](./docs/quick_start/_index.md)
- [Documents](https://alibaba.github.io/Dragonfly/)
- [Contributing](CONTRIBUTING.md)
- [FAQ](FAQ.md)
- [Adoptors](./docs/_index.md#who-has-adopted-dragonfly)
- [LICENSE](LICENSE)

## Introduction

Dragonfly is an intelligent P2P based image and file distribution system. It aims to resolve issues related to low-efficiency, low-success rate and waste of network bandwidth in file transferring process, especially distribution scenarios such as application distribution, cache distribution, log distribution, image distribution, etc.

While container technologies makes devops life easier most of the time, and it definitely brings some challenges: the efficiency of image distribution, especially when you have to replicate image distribution on several hosts. Dragonfly works extremely well with both Docker and [PouchContainer](https://github.com/alibaba/pouch) for this scenario. It is also compatible with some other container engines.

Dragonfly makes it simple and cost-effective to set up, operate, and scale any kind of files/images/data distribution.

## Features

Dragonfly is sourced from Alibaba, trained in actual scenarios, and solves three aspects problems in cloud native image distribution proactively: efficiency, flow control and security:

- **distribution efficiency**: with P2P and CDN technology, reduce image distribution time drastically, speed up business delivery;
- **distribution flow control**: with intelligent analysis technology, dynamically balance distribtion workload and business running, realize load's dynamical control, guarantee business' stable running;
- **distribution security**: support HTTPs protocol in private image registry, encrypt distribution content, ensure security on data.

### Distribution Efficiency

- **P2P based file distribution**: Using P2P technology for file transmission, which can make full use of the bandwidth resources of each peer to improve download efficiency,  saves a lot of cross-IDC bandwidth, especially costly cross-board bandwidth
- **Passive CDN**: The CDN mechanism can avoid repetitive remote downloads.
- **No pressure on file source**: Generally, as long as a few Cluster Managers download file from the source.

### Distribution Flow Control

- **Host level speed limit**: Many downloading tools(wget/curl) only have rate limit for the current download task, but dragonfly also provides rate limit for the entire host.
- **Disk protection and high efficient IO**: Precheck Disk space, delay synchronization, write file-block in the best order, split net-read / disk-write, and so on.

### Distribution Security

- **Strong consistency**: Dragonfly can guarantee that all downloaded files must be consistent even if users do not provide any check code(MD5).
- **Exception auto isolation**: Dragonfly will automatically isolate exception nodes(peer or Cluster Manager) to improve download stability.
- **Effective concurrency control of Registry Auth**: Reduce the pressure of the Registry Auth Service.


## Performance Data

Dragonfly performs quite significantly in distributing image in cloud native scenarios. 

With using Dragonfly to distriute, no matter how many clients start the file downloading, the average downloading time is always around 12 seconds. 

With only using wget to download files, the downloading time keeps increasing when you have more clients, and as the amount of wget clients reaches 1200, the file source will crash, then it can not serve any client.

For more details about comparison of two different way to distriubte images, please refer to the following graph.

![Performance](docs/images/performance.png)

The following data is about the testing environment configurations.

|Test Environment ||
|--------------------|-------------------|
|Dragonfly server|2 * (24core 64GB 2000Mb/s)|
|File Source server|2 * (24core 64GB 2000Mb/s)|
|Client|4core 8GB 200Mb/s|
|Target Image size|200MB|

## Roadmap

For more details about roadmap, please refer to file [ROADMAP.md](ROADMAP.md).

## Community

You are encouraged to communicate most things via GitHub issues or pull requests.

Other active channels:

- Gitter Chat: [dragonfly](https://gitter.im/alibaba/Dragonfly)
- Twitter: [@dragonfly_oss](https://twitter.com/dragonfly_oss)

## Contributing

You are warmly welcomed to hack on Dragonfly. We have prepared a detailed guide [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Dragonfly is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for the full license text.
