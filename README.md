<h1 align="center">
	<img
		width="180"
		alt="Popcorn logo"
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/icons/popcorn.png">
    <br/>
    Media Center
</h1>

<h4 align="center">
	A dead simple dockerized media center bundle with everything you might need (Probably).
</h4>

<p align="center">
  <a href="https://github.com/JorgeAnzola/media-center/releases/latest/download/media-center.zip"><img
		alt="Download latest zip file"
		src="https://img.shields.io/badge/Download-media--center.zip-blue"></a>
</p>

# Table of Contents

- [Included software](#included-software)
- [Requirements](#requirements)
- [Getting started](#getting-started)
    - [Configuration](#configuration)
    - [Booting up](#booting-up)
    - [Automatic start](#automatic-start)
    - [Going extra](#going-extra)

# Included software

<h2>
	<img
		width="22"
		alt="Plex logo"
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/icons/plex.png">
    Plex
</h2>

Plex is a global streaming media service and a client–server media player platform. [read more](https://www.plex.tv/)

**TL;DR: to stream your media.** 

<div align="center">
	<img
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/screenshots/plex.jpg">
    <br/>
</div>

<h2>
	<img
		width="22"
		alt="Radarr logo"
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/icons/radarr.png">
    Radarr
</h2>

Radarr is a movie collection manager for Usenet and BitTorrent users. [read more](https://radarr.video/)

**TL;DR: to search, download and manage your movie files.**

<div align="center">
	<img
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/screenshots/radarr.jpg">
    <br/>
</div>


<h2>
	<img
		width="22"
		alt="Sonarr logo"
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/icons/sonarr.png">
    Sonarr
</h2>

Sonarr is a PVR for Usenet and BitTorrent users. [read more](https://sonarr.tv/)

**TL;DR: to search, download and manage your TV show files.**


<div align="center">
	<img
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/screenshots/sonarr.jpg">
    <br/>
</div>

<h2>
	<img
		width="22"
		alt="Transmission logo"
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/icons/transmission.png">
    Transmission
</h2>

Transmission is a cross-platform BitTorrent client. [read more](https://transmissionbt.com/)

**TL;DR: to download your torrents.**

<div align="center">
	<img
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/screenshots/transmission.jpg">
    <br/>
</div>

<h2>
	<img
		width="22"
		alt="Jackett logo"
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/icons/jackett.png">
    Jackett
</h2>

Jackett works as a proxy server: it translates queries from apps (like Sonarr or Radarr) into tracker-site-specific http queries, parses the html response, then sends results back to the requesting software. [read more](https://github.com/Jackett/Jackett)

**TL;DR: to get the torrent files.**

<div align="center">
	<img
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/screenshots/jackett.jpg">
    <br/>
</div>

<h2>
	<img
		width="22"
		alt="Tautulli logo"
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/icons/tautulli.png">
    Tautulli
</h2>

Tautulli is a 3rd party application that you can run alongside your Plex Media Server to monitor activity and track various statistics. [read more](https://tautulli.com/)

**TL;DR: to get analytics about Plex and send notifications.**

<div align="center">
	<img
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/screenshots/tautulli.jpg">
	<img
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/screenshots/tautulli2.jpg">
    <br/>
</div>

# Requirements
- Docker Compose


# Getting started

Clone or download this repo into your home folder.

```
cd ~
git clone https://github.com/JorgeAnzola/media-center.git (or download the [latest release](https://github.com/JorgeAnzola/media-center/releases/latest/download/media-center.zip))
cd media-center
cp docker-compose.yaml.example docker-compose.yaml
```

## Configuration
If you've cloned the repo in a folder different than `~/media-center/` you'd need to double check a couple of things in the newly created `docker-compose.yaml` file before booting up.
You need to make sure all the `/data` paths (like `/data/torrents/` and `/data/media/movies`) are pointing to the right folders. 

## Booting up

```
cd ~/media-center
docker-compose up -d
```

## Automatic start
You'd probably like your media center to start automatically after restarting.
To do that

```
crontab -e
```

and add the following line

```
@reboot docker-compose -f ~/media-center/docker-compose.yaml up -d
```

# Going extra
You will now have 6 software running on your system or server.
You can use an app dashboard like [Homer](https://github.com/JorgeAnzola/homer-dashboard).

<img src="https://raw.githubusercontent.com/JorgeAnzola/homer-dashboard/master/assets/readme/dark.jpg">