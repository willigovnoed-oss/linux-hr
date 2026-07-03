# Linux HR

```
██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗    ██╗  ██╗██████╗ 
██║     ██║████╗  ██║██║   ██║╚██╗██╔╝    ██║  ██║██╔══██╗
██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝     ███████║██████╔╝
██║     ██║██║╚██╗██║██║   ██║ ██╔██╗    ██╔══██║██╔══██╗
███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗   ██║  ██║██║  ██║
╚═══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝
```

A minimal, hacker-styled Linux distribution built on Debian, with a green
terminal aesthetic, a curated toolset, and a themed boot sequence.

![preview](branding/preview.svg)

## What this is (and isn't)

Linux HR is a **respin** built with Debian's `live-build`: real Debian
(bookworm) underneath, with a custom boot theme, shell, banners, and
package set layered on top. It is not a from-scratch kernel/OS — see
[`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) for why that's the right
tradeoff for something you can actually build and boot.

## Features

- Green-on-black GRUB boot theme
- Custom Plymouth boot splash
- Pre-login TTY banner (`/etc/issue`) with ASCII logo
- zsh with a Kali-style two-line hacker prompt
- Curated CLI toolset: `nmap`, `tmux`, `htop`, `neofetch`, `cmatrix`,
  `figlet`, `lolcat`, Python 3, and the usual build essentials
- Custom `/etc/os-release` identity (`NAME="Linux HR"`, codename *Nullbyte*)

## Build it

Requires a Debian/Ubuntu machine (or VM) with root access and a few GB of
free disk space.

```bash
git clone https://github.com/willigovnoed-oss/linux-hr.git
cd linux-hr
sudo ./build.sh
```

This installs `live-build` if needed, configures a Debian bookworm live
image, and builds a hybrid ISO (`linux-hr-*.iso`) in the project directory.
Expect 20–60+ minutes depending on your connection.

## Try it

```bash
qemu-system-x86_64 -m 2048 -cdrom linux-hr-*.iso
```

or flash the ISO to a USB stick with `dd`/Rufus/Balena Etcher and boot from
it, or attach it as a CD/DVD in VirtualBox / VMware.

## Project layout

```
linux-hr/
├── build.sh                # build entry point
├── config/                 # live-build configuration
│   ├── package-lists/      # packages installed into the image
│   ├── includes.chroot/    # files copied into the target filesystem
│   └── hooks/live/         # branding hook, runs inside the chroot
├── branding/                # source ascii art / preview image
├── docs/ARCHITECTURE.md     # how it's built, and why
├── LICENSE
└── .gitignore
```

## Customizing

- Add packages: `config/package-lists/linux-hr.list.chroot`
- Change the shell prompt: `config/includes.chroot/etc/skel/.zshrc`
- Change the boot banner: `config/includes.chroot/etc/issue`
- Change the GRUB theme: `config/includes.chroot/boot/grub/themes/linux-hr/theme.txt`
- Change the boot splash: `config/includes.chroot/usr/share/plymouth/themes/linux-hr/`

## License

MIT — see [`LICENSE`](LICENSE).
