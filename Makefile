docker-base:
	cd docker-base && ./build.sh

core-rolling:
	podman build -t ghcr.io/threatcode/core:rolling-amd64 core/rolling-amd64/

core: docker-base
	podman build -t ghcr.io/threatcode/core:amd64 core/lts-amd64/
	podman build -t ghcr.io/threatcode/core:i386 core/lts-i386/
	podman build -t ghcr.io/threatcode/core:arm64 core/lts-arm64/
	podman build -t ghcr.io/threatcode/core:armhf core/lts-armhf/

builder:
	podman build -t ghcr.io/threatcode/build:amd64 build/lts-amd64/
	podman build -t ghcr.io/threatcode/build:i386 build/lts-i386/
	podman build -t ghcr.io/threatcode/build:arm64 build/lts-arm64/
	podman build -t ghcr.io/threatcode/build:armhf build/lts-armhf/


security:
	podman build -t ghcr.io/threatcode/tools-nmap:latest tools/nmap
	podman build -t ghcr.io/threatcode/tools-metasploit:latest tools/metasploit
	podman build -t ghcr.io/threatcode/tools-set:latest tools/set
	podman build -t ghcr.io/threatcode/tools-bettercap:latest tools/bettercap
	podman build -t ghcr.io/threatcode/tools-beef:latest tools/beef
	podman build -t ghcr.io/threatcode/tools-sqlmap:latest tools/sqlmap
	podman build -t ghcr.io/threatcode/security:latest security/lts/

build: core-rolling core builder security

push-docker: build
	podman push ghcr.io/threatcode/core:amd64 ghcr.io/threatcode/core:lts-amd64
	podman push ghcr.io/threatcode/core:amd64 ghcr.io/threatcode/core:lts
	podman push ghcr.io/threatcode/core:amd64 ghcr.io/threatcode/core:latest
	podman push ghcr.io/threatcode/core:amd64 ghcr.io/threatcode/core:5
	podman push ghcr.io/threatcode/core:amd64 ghcr.io/threatcode/core:5.0
	podman push ghcr.io/threatcode/core:amd64 ghcr.io/threatcode/core:5.0.0

	podman push ghcr.io/threatcode/core:arm64 ghcr.io/threatcode/core:lts-arm64
	podman push ghcr.io/threatcode/core:arm64 ghcr.io/threatcode/core:5-arm64
	podman push ghcr.io/threatcode/core:arm64 ghcr.io/threatcode/core:5.0-arm64
	podman push ghcr.io/threatcode/core:arm64 ghcr.io/threatcode/core:5.0.0-arm64

	podman push ghcr.io/threatcode/core:armhf ghcr.io/threatcode/core:lts-armhf
	podman push ghcr.io/threatcode/core:i386 ghcr.io/threatcode/core:lts-i386

	podman push ghcr.io/threatcode/core:rolling-amd64 ghcr.io/threatcode/core:rolling-amd64
	podman push ghcr.io/threatcode/core:rolling-amd64 ghcr.io/threatcode/core:rolling

	podman push ghcr.io/threatcode/build:amd64 ghcr.io/threatcode/build:latest
	podman push ghcr.io/threatcode/build:amd64 ghcr.io/threatcode/build:amd64
	podman push ghcr.io/threatcode/build:arm64 ghcr.io/threatcode/build:arm64
	podman push ghcr.io/threatcode/build:i386 ghcr.io/threatcode/build:i386

	podman push ghcr.io/threatcode/tools-nmap:latest ghcr.io/threatcode/tools-nmap:latest
	podman push ghcr.io/threatcode/tools-metasploit:latest ghcr.io/threatcode/tools-metasploit:latest
	podman push ghcr.io/threatcode/tools-set:latest ghcr.io/threatcode/tools-set:latest
	podman push ghcr.io/threatcode/tools-bettercap:latest ghcr.io/threatcode/tools-bettercap:latest
	podman push ghcr.io/threatcode/tools-beef:latest ghcr.io/threatcode/tools-beef:latest
	podman push ghcr.io/threatcode/tools-sqlmap:latest ghcr.io/threatcode/tools-sqlmap:latest
	podman push ghcr.io/threatcode/security:latest ghcr.io/threatcode/security:latest
	podman push ghcr.io/threatcode/security:latest ghcr.io/threatcode/security:5
	podman push ghcr.io/threatcode/security:latest ghcr.io/threatcode/security:5.0
	podman push ghcr.io/threatcode/security:latest ghcr.io/threatcode/security:5.0.0

push-parrot: build
	podman push ghcr.io/threatcode/core:amd64 registry.parrot.run/core:lts-amd64
	podman push ghcr.io/threatcode/core:amd64 registry.parrot.run/core:lts
	podman push ghcr.io/threatcode/core:amd64 registry.parrot.run/core:latest
	podman push ghcr.io/threatcode/core:amd64 registry.parrot.run/core:5
	podman push ghcr.io/threatcode/core:amd64 registry.parrot.run/core:5.0
	podman push ghcr.io/threatcode/core:amd64 registry.parrot.run/core:5.0.0

	podman push ghcr.io/threatcode/core:arm64 registry.parrot.run/core:lts-arm64
	podman push ghcr.io/threatcode/core:arm64 registry.parrot.run/core:5-arm64
	podman push ghcr.io/threatcode/core:arm64 registry.parrot.run/core:5.0-arm64
	podman push ghcr.io/threatcode/core:arm64 registry.parrot.run/core:5.0.0-arm64

	podman push ghcr.io/threatcode/core:armhf registry.parrot.run/core:lts-armhf
	podman push ghcr.io/threatcode/core:i386 registry.parrot.run/core:lts-i386

	podman push ghcr.io/threatcode/core:rolling-amd64 registry.parrot.run/core:rolling-amd64
	podman push ghcr.io/threatcode/core:rolling-amd64 registry.parrot.run/core:rolling

	podman push ghcr.io/threatcode/build:amd64 registry.parrot.run/build:latest
	podman push ghcr.io/threatcode/build:amd64 registry.parrot.run/build:amd64
	podman push ghcr.io/threatcode/build:arm64 registry.parrot.run/build:arm64
	podman push ghcr.io/threatcode/build:i386 registry.parrot.run/build:i386

	podman push ghcr.io/threatcode/tools-nmap:latest registry.parrot.run/tools-nmap:latest
	podman push ghcr.io/threatcode/tools-metasploit:latest registry.parrot.run/tools-metasploit:latest
	podman push ghcr.io/threatcode/tools-set:latest registry.parrot.run/tools-set:latest
	podman push ghcr.io/threatcode/tools-bettercap:latest registry.parrot.run/tools-bettercap:latest
	podman push ghcr.io/threatcode/tools-beef:latest registry.parrot.run/tools-beef:latest
	podman push ghcr.io/threatcode/tools-sqlmap:latest registry.parrot.run/tools-sqlmap:latest
	podman push ghcr.io/threatcode/security:latest registry.parrot.run/security:latest
	podman push ghcr.io/threatcode/security:latest registry.parrot.run/security:5
	podman push ghcr.io/threatcode/security:latest registry.parrot.run/security:5.0
	podman push ghcr.io/threatcode/security:latest registry.parrot.run/security:5.0.0
