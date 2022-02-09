<h1 align="center">
	<img
		width="180"
		alt="Popcorn logo"
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/icons/popcorn.png">
    <br/>
    Media Center
</h1>

<h4 align="center">
	A dead simple dockerized 15-minutes-to-setup media center bundle with everything you might need (Probably).
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
    - [Installation](#installation)
    - [Configuration](#configuration)
      - [Setting up Transmission](#setting-up-transmission)
      - [Setting up Radarr/Sonarr](#setting-up-radarr-sonarr)
	  - [Setting up Prowlarr](#setting-up-prowlarr)
      - [Setting up Plex](#setting-up-plex)
      - [Setting up Tautulli](#setting-up-tautulli)
    - [Booting up](#booting-up)
    - [Automatic start](#automatic-start)
    - [Updating the images](#updating-the-images)
- [Going extra](#going-extra)
  - [Dashboard](#dashboard)
- [Trouble shooting](#trouble-shooting)
  - [Plex not booting up](#plex-not-booting-up)

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
		alt="Prowlarr logo"
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/icons/prowlarr.png">
    Jackett
</h2>

Prowlarr works as a proxy server: it translates queries from apps (like Sonarr or Radarr) into tracker-site-specific http queries, parses the html response, then sends results back to the requesting software. [read more](https://github.com/prowlarr/prowlarr)

**TL;DR: to get the torrent files.**

<div align="center">
	<img
		src="https://raw.githubusercontent.com/JorgeAnzola/media-center/master/assets/screenshots/prowlarr.jpg">
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

With Docker should work on most cases and systems but it has been tested on a server with Ubuntu 20.04 and on a Raspberry 4b, working as expected.
Plex was a bit rough on the Raspberry, especially when trying to stream 4k media.  

# Getting started

## Installation

Clone or download this repo into your home folder.

```
cd ~
git clone https://github.com/JorgeAnzola/media-center.git # (or download the [latest release](https://github.com/JorgeAnzola/media-center/releases/latest/download/media-center.zip))
cd media-center
cp docker-compose.yaml.example docker-compose.yaml
```

## Configuration
If you've cloned the repo in a folder different than `~/media-center/` you'd need to double check a couple of things in the newly created `docker-compose.yaml` file before booting up.
You need to make sure all the `/data` paths (like `/data/torrents/` and `/data/media/movies`) are pointing to the right folders. 

Furthermore, each app require some minor configuration steps

### Setting up Transmission
No extra configuration should be required for Transmission.

### Setting up Radarr/Sonarr
The guide refers to Radarr, but all these settings you can be (and need to be) replicated on Sonarr.

#### Adding Indexers
The indexers will be automagically added by Prowlarr (See [Setting up Prowlarr](#setting-up-prowlarr)).

#### Add a download client (Transmission)

- Go into Settings > Download Clients
- Click the Plus button.
- Click on the Transmission button
- Add a name
- For the host, replace `localhost` for `transmission`
- Click test to make sure everything is ok.
- Click save

#### Add a root folder
- Go into Settings > Media Management
- Scroll down to Root Folders
- Click on Add Root Folder
- Select the folder data/media/movies (data/media/tv for Sonarr)

#### Trakt/IMDB lists (Optional) 
If you use IMDB or Trakt.tv to keep lists of movies and shows you can integrate them to Radarr/Sonarr
And everything you add there will be downloaded automatically. You can define different quality profiles for each lists and much more.

#### Size limit (Optional)
With all these automagic things going on, might happen that Radarr tries to download a 60gb 1080p movie.
If you like to avoid this, you can set up your quality preferences (Settings > Quality), or directly in the indexers, go into Settings > Indexers and set up a **Maximum Size**.

### Setting up Prowlarr
Go to http://your-server-ip-address:9696.
Click the **Add indexer** button, a frame will popup, in there look for the provider you'd like to add and click on it. A second frame will show up, in there you can
modify the settings of the indexers.
For public indexers you won't need extra steps, usually. Just verify that the Enable option is checked. Click test and if it's succesful, click save.
You can add as many as you want.
Once you have all the indexers click 'Settings' in the left side panel, then Apps. 
Here you will add Radarr. Click on the plus button in the Applications section choose Radarr. You will need the ApiKey, go to your Radarr instance, Settings > General and copy the API key under the security section, you can now test and save.  
Repeat the same process for Sonarr.

### Setting up Plex
Go through the wizard for the time first configuration, and create an account if you don't have one.
Add libraries: Films pointing to `media/movies` and TV Shows pointing to `data/tv`
In the settings you can also set for the libraries to be updated as soon as there's a change in the files.

### Setting up Tautulli
Go through the wizard for the time first configuration, set up user and password and sign in with your Plex account.
In Tautulli you have many settings and features. One of the most useful are the notifications.
Go into Settings > Notification Agents. Here you can add many notifications with many triggers. For example, a Telegram notification when there's a new movie to watch.

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

## Updating the images

You can pull each docker image manually or use the included script:

```
cd ~/media-center/
./update.sh
```

If you want to keep your system clean, you can prune the unused images by including the `--prune` parameter.

```
cd ~/media-center/
./update.sh --prune
```


# Going extra
## Dashboard
You will now have 6 software running on your system or server.
You can use an app dashboard like [Homer](https://github.com/JorgeAnzola/homer-dashboard).

<img src="https://raw.githubusercontent.com/JorgeAnzola/homer-dashboard/master/assets/readme/dark.jpg">

# Trouble shooting
## Plex not booting up 
If you're installing the media center in a Raspberry Pi with Raspbian, you might encounter the problem of having an out of date `libseccomp` component.
To fix this manually install an updated version of the library with dpkg. [More info](https://docs.linuxserver.io/faq#libseccomp)

```
wget http://ftp.us.debian.org/debian/pool/main/libs/libseccomp/libseccomp2_2.4.4-1~bpo10+1_armhf.deb
sudo dpkg -i libseccomp2_2.4.4-1~bpo10+1_armhf.deb
```
  