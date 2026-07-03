# Architecture

Linux HR is a *respin*, not a from-scratch kernel: it takes real, upstream
Debian (bookworm) and layers hacker-styled branding + a curated toolset on
top, using Debian's `live-build` system. That's the same approach used by
distros like Kali or Parrot -- a themed, purpose-built layer on a real,
maintained kernel/base, rather than reinventing kernel and userspace from
zero (which is a multi-year undertaking on its own).

## Layout

```
linux-hr/
├── build.sh                    # orchestrates `lb config` + `lb build`
├── config/
│   ├── package-lists/          # extra packages installed into the ISO
│   ├── includes.chroot/         # files copied verbatim into the target filesystem
│   │   ├── etc/issue            # pre-login TTY banner
│   │   ├── etc/motd             # post-login message
│   │   ├── etc/os-release       # distro identity (NAME=Linux HR, etc.)
│   │   ├── etc/skel/.zshrc      # default shell theme for new users
▾   │   ├── boot/grub/themes/    # GRUB boot menu theme (green-on-black)
│   └── usr/share/plymouth/  # graphical boot splash theme
├── hooks/live/              # scripts run inside the chroot at build time
├── branding/                    # source assets (ascii logo, preview art)
└── docs/
```

## Build pipeline

1. `build.sh` installs `live-build` if missing and runs `lb config` with
   Linux HR's ISO metadata (name, volume label, boot options).
2. `lb build` bootstraps a Debian bookworm chroot, installs the packages in
   `config/package-lists/linux-hr.list.chroot`, copies everything under
   `config/includes.chroot/` into the target filesystem, then runs the
   hooks in `config/hooks/live/`.
3. The hook script sets zsh as the default shell, points GRUB at the Linux
   HR theme, and activates the Plymouth boot theme.
4. `lb build` packages the result into a hybrid ISO you can boot on real
   hardware (USB) or in a VM.

## Why not a real from-scratch kernel?

A genuine "own kernel + own userland" OS (the OSDev.org style toy-kernel
route: your own bootloader, memory manager, scheduler, drivers) is a valid
and fun project, but it's a different scope -- weeks/months of systems work
before you even get a shell prompt, and it wouldn't be able to run any of
the existing Linux tooling. This project optimizes for something you can
actually build and boot today, while still giving you full control over
every file that ends up on the ISO.
