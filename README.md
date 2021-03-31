# centos-docker-mirror

<p align="center">
    <a href="https://travis-ci.com/github/flavienbwk/centos-docker-mirror" target="_blank">
        <img src="https://travis-ci.com/flavienbwk/centos-docker-mirror.svg?branch=main&status=passed"/>
    </a>
</p>

Mirror for installing Docker on CentOS

## Downloading & updating

1. Setup your CentOS version and arch in `mirror.sh`

2. Run the `mirror` container :

    ```bash
    docker-compose build
    docker-compose up mirror
    ```

> Tips: We recommend you downloading the mirror from [a cloud provider](https://www.scaleway.com/en/) and then transfer the files to your computer.

## Serving

1. Check your mirroring succeeded in `./mirror/*` or typing `du -sh ./mirror` to check the volume

    The default configuration should make you download _XX G_

2. Run the server :

    ```bash
    docker-compose up -d server
    ```

    Server will run on [`localhost:8080`](http://localhost:8080)  

## Client configuration

To point your CentOS clients to your mirror, create a `/etc/yum.repos.d/local-docker-mirror.repo` file as follow :

```conf
[local-docker-ce-stable]
name=Docker CE Stable - $basearch
baseurl=http://localhost:8080/$releasever/$basearch/stable
enabled=1
gpgcheck=1
gpgkey=http://localhost:8080/gpg

[local-docker-ce-stable-debuginfo]
name=Docker CE Stable - Debuginfo $basearch
baseurl=http://localhost:8080/$releasever/debug-$basearch/stable
enabled=0
gpgcheck=1
gpgkey=http://localhost:8080/gpg

[local-docker-ce-stable-source]
name=Docker CE Stable - Sources
baseurl=http://localhost:8080/$releasever/source/stable
enabled=0
gpgcheck=1
gpgkey=http://localhost:8080/gpg

[local-docker-ce-test]
name=Docker CE Test - $basearch
baseurl=http://localhost:8080/$releasever/$basearch/test
enabled=0
gpgcheck=1
gpgkey=http://localhost:8080/gpg

[local-docker-ce-test-debuginfo]
name=Docker CE Test - Debuginfo $basearch
baseurl=http://localhost:8080/$releasever/debug-$basearch/test
enabled=0
gpgcheck=1
gpgkey=http://localhost:8080/gpg

[local-docker-ce-test-source]
name=Docker CE Test - Sources
baseurl=http://localhost:8080/$releasever/source/test
enabled=0
gpgcheck=1
gpgkey=http://localhost:8080/gpg

[local-docker-ce-nightly]
name=Docker CE Nightly - $basearch
baseurl=http://localhost:8080/$releasever/$basearch/nightly
enabled=0
gpgcheck=1
gpgkey=http://localhost:8080/gpg

[local-docker-ce-nightly-debuginfo]
name=Docker CE Nightly - Debuginfo $basearch
baseurl=http://localhost:8080/$releasever/debug-$basearch/nightly
enabled=0
gpgcheck=1
gpgkey=http://localhost:8080/gpg

[local-docker-ce-nightly-source]
name=Docker CE Nightly - Sources
baseurl=http://localhost:8080/$releasever/source/nightly
enabled=0
gpgcheck=1
gpgkey=http://localhost:8080/gpg
```

:point_right: Please cite my work if you're using it !
:point_right: Feel free to send **pull requests** as well !
