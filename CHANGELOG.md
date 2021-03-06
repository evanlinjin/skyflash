# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

<!--
This is a note for developers about the recommended tags to keep track of the changes:

- Added: for new features.
- Changed: for changes in existing functionality.
- Deprecated: for soon-to-be removed features.
- Removed: for now removed features.
- Fixed: for any bug fixes.
- Security: in case of vulnerabilities.

Dates must be YEAR-MONTH-DAY
-->

## v0.0.6 - 2019-09-25

### Changed

- Some UI improvements and fixes: reformat the about box, fix the grammar of a sentences and delay the browser popup after the "new version of skyflash" is detected.
- Configuration load between runs now relays on a config file rather than a dynamic detection (see deprecated section), this for local skybian file and version and app status
- State detection of the app upgraded, now we use a configuration file (skyflash.conf) on the work folder to store the app state and vars
- Deployment and release procedure, see section Added below.
- Name change for the different release apps per OS, the name mask is as follows: Skyflash_${version}_${OS}_${ARCH}.{extension_by_os}, for example: Skyflash_v0.0.5-beta_windows.exe
- Improved the Linux SD card detection code, adding block devices with major type 179 and prevent devices named as mmcblk to being masked by the algorithm even if they are tagged as non removable
- Improved the info shown in the labels next to the 'Browse [skybian image]' and 'Build image' buttons, now with more useful and logic infos
- Status bar infos also updated with more useful info
- Fixed a bug about the build button being disabled if you refuse to use any directory to build the images

### Added

- Now the flashing process shows the write speed and the time left (both as average of the whole flash process)
- Users can now flash already built images upon app start (no more need to re-built to flash)
- Now the deploy into Github happens with just one artifact under a tag and with the 3 apps for the different OS

### Deprecated

- Skyflash image detection from previous runs will be deprecated in version 0.0.7 and forward, we switched to a configparser configuration with a config file

## v0.0.5 - 2019-07-19

### Fixed

- Issue #70, Windows apps problem when checking for the Skybian download URL, that triggered a annoying "New version of Skybian, please download" dialog box, fixed now.

### Changed

- The logic behind the parsing of the Skybian URL and the version matching schema, to fix issue #70 described above.

## v0.0.4 - 2019-07-12

### Added

- Setuptools compatibility (structure and code changed)
- Travis yml file for CI/CD
- Developers now can create a local Docker image to generate the Windows .exe release file from a linux host
- Full flashing support in Windows & Linux
- New flashing paradigm in the UI, to help the user and allow for repeated flashing
- Full flashing support in macos OSX
- Full generation of release files via Travis
- Make now can take care of dependencies in linux for the devs
- Doc update with latest changes
- UI now shows the name and version of the base image being processed.
- Skyflash now checks for new versions on startup, if found will warn the user and open a web browser with indications to the user...
- Skyflash now detects the latest stable version of Skybian (from internet) and use that for the download... if it can detect it, just use the hardcoded one.
- Added a new dependency for python3: request module, drop your local created docker image and re-create it, see 'make help'

### Changed

- Structure changed to support python3 setutools
- Versioning for Skyflash will match the Skywire ones, starting with 0.0.4
- Separated user manual for the CLI utility
- README and MANUALS updated to reflect recent changes
- Makefile options changed
- Posix OS (Linux/OSX) now uses a own streamer app to feed dd fon the flash process
- Windows uses a own flasher app (flash.exe)
- The docker image in the dev stage that was named "pyinstaller-win64py3:pyqt_winapi" and then renamed to pyinstaller-win64py3:skyflash please remove the old and run `make deps-windows` to re-create the new docker image.
- We will not longer release a .deb file for installation, use the linux static app instead.
- The network config now has a natural view on the IPs, no more spaces in the IPs
- The internal validation mechanism for the IPs and DNS entries was rebuilt almost from scratch
- Dev docker image updated, please run `make deps-windows` to erase your old one and to re-create the updated one
- Change in Python & PyQt5 version, now we use Python v3.6 and PyQt5 v 5.13
