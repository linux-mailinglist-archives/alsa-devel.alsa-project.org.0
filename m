Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CEE90FB60
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 04:41:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8FDBDEC;
	Thu, 20 Jun 2024 04:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8FDBDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718851292;
	bh=iPckXq+QmhuOv+aBF8464Aojs2fh1w5Z1XbJSsYttaM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nGVKyoJBDCHlKOnF+nwQe+UDDCiot33Iw7d2xSYwS+X4nT1zh1Ex1jilrJvcTazxU
	 Rtd9gj/fnwmHepxOaDJ6uYdbxDU9VcAjcNB7uf5rHB3URovGIOqJBzdBTonqEidyjQ
	 4+sc/DpPvpQ8Sgf87THCgtE473udXhsp8R/qI6OQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 182F0F80589; Thu, 20 Jun 2024 04:41:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98E2BF805B0;
	Thu, 20 Jun 2024 04:41:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4330CF8023A; Thu, 20 Jun 2024 04:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 99FC5F80154
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 04:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99FC5F80154
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1718851262444810867-webhooks-bot@alsa-project.org>
References: <1718851262444810867-webhooks-bot@alsa-project.org>
Subject: ALSA volume control ignored for "4c4a:4155 Jieli Technology USB
 Composite Device"
Message-Id: <20240620024106.4330CF8023A@alsa1.perex.cz>
Date: Thu, 20 Jun 2024 04:41:06 +0200 (CEST)
Message-ID-Hash: CYSG6A62JJID5N2V5YUDW43CELEZDF36
X-Message-ID-Hash: CYSG6A62JJID5N2V5YUDW43CELEZDF36
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYSG6A62JJID5N2V5YUDW43CELEZDF36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #401 was opened from davidmcnabnz:

I just purchased a generic USB audio interface, which shows up in `lsusb` as:
```
4c4a:4155 Jieli Technology USB Composite Device
```
The device on the whole seems to _simply just work_. But the level control for the stereo capture seems to be completely ignored, both in `alsamixer` and `pavucontrol`.

My setup is Debian GNU/Linux 12 (bookworm), standard apt including contrib.
General stack is wireplumber and pipewire, implementing JACK via pw-jack and pipewire-pulse. This is working very well for my music work.

Lastly, below is a paste of my currently installed packages relevant to ALSA and JACK.

Grateful if anyone can advise.

Cheers
David

```
ii  a2jmidid                                 9-3                                  amd64        Daemon for exposing legacy ALSA MIDI in JACK MIDI systems
ii  aj-snapshot                              0.9.9-4                              amd64        make snapshots of JACK connections
ii  alsa-tools                               1.2.5-3                              amd64        Console based ALSA utilities for specific hardware
ii  alsa-tools-gui                           1.2.5-3                              amd64        GUI based ALSA utilities for specific hardware
ii  alsa-topology-conf                       1.2.5.1-2                            all          ALSA topology configuration files
ii  alsa-ucm-conf                            1.2.8-1                              all          ALSA Use Case Manager configuration files
ii  alsa-utils                               1.2.8-1                              amd64        Utilities for configuring and using ALSA
ii  drumstick-data                           2.7.2-1                              all          Qt5/C++ wrapper for ALSA Sequencer (data files)
ii  gir1.2-cvc-1.0:amd64                     5.6.1-1                              amd64        Introspection data for Cinnamon pulseaudio abstraction
ii  gnome-remote-desktop                     43.3-1                               amd64        Remote desktop daemon for GNOME using PipeWire
ii  gstreamer1.0-alsa:amd64                  1.22.0-3+deb12u1                     amd64        GStreamer plugin for ALSA
ii  gstreamer1.0-pipewire:amd64              0.3.65-3+deb12u1                     amd64        GStreamer 1.0 plugin for the PipeWire multimedia server
ii  jack-midi-clock                          0.4.3-1+b1                           amd64        JACK client that sends MIDI beat clock pulses
ii  jack-mixer                               17-2+b2                              amd64        GTK+ JACK audio mixer application (Python 3)
ii  jack-tools                               20131226-1.1                         amd64        various JACK tools: dl, record, scope, osc, plumbing, udp, play, transport
ii  jackd                                    5+nmu1                               all          JACK Audio Connection Kit (default server package)
ii  jackd2                                   1.9.21~dfsg-3                        amd64        JACK Audio Connection Kit (server and example clients)
ii  jackd2-firewire                          1.9.21~dfsg-3                        amd64        JACK Audio Connection Kit (FFADO backend)
ii  jackmeter                                0.4-1+b2                             amd64        a basic command line meter for the JACK audio system
ii  jacktrip                                 1.7.0+ds-1                           amd64        high-quality system for audio network performances (cmdline)
ii  klick                                    0.12.2-4.1                           amd64        advanced metronome for JACK
ii  kmetronome                               1.3.1-1                              amd64        ALSA MIDI Metronome
ii  libasound2:amd64                         1.2.8-1+b1                           amd64        shared library for ALSA applications
ii  libasound2:i386                          1.2.8-1+b1                           i386         shared library for ALSA applications
ii  libasound2-data                          1.2.8-1                              all          Configuration files and profiles for ALSA drivers
ii  libasound2-dev:amd64                     1.2.8-1+b1                           amd64        shared library for ALSA applications -- development files
ii  libasound2-plugins:amd64                 1.2.7.1-1                            amd64        ALSA library additional plugins
ii  libasound2-plugins:i386                  1.2.7.1-1                            i386         ALSA library additional plugins
ii  libatopology2:amd64                      1.2.8-1+b1                           amd64        shared library for handling ALSA topology definitions
ii  libcanberra-pulse:amd64                  0.30-10                              amd64        PulseAudio backend for libcanberra
ii  libclalsadrv2                            2.0.0-3.1                            amd64        ALSA driver C++ access library
ii  libcvc0:amd64                            5.6.1-1                              amd64        Cinnamon pulseaudio abstraction library
ii  libdrumstick-alsa2:amd64                 2.7.2-1                              amd64        Qt5/C++ wrapper for ALSA Sequencer (shared library)
ii  libdrumstick-widgets2:amd64              2.7.2-1                              amd64        Qt5/C++ wrapper for ALSA Sequencer (widgets)
ii  libjack-jackd2-0:amd64                   1.9.21~dfsg-3                        amd64        JACK Audio Connection Kit (libraries)
ii  libjack-jackd2-0:i386                    1.9.21~dfsg-3                        i386         JACK Audio Connection Kit (libraries)
ii  libjack-jackd2-dev:amd64                 1.9.21~dfsg-3                        amd64        JACK Audio Connection Kit (development files)
ii  libpipewire-0.3-0:amd64                  0.3.65-3+deb12u1                     amd64        libraries for the PipeWire multimedia server
ii  libpipewire-0.3-common                   0.3.65-3+deb12u1                     all          libraries for the PipeWire multimedia server - common files
ii  libpipewire-0.3-modules:amd64            0.3.65-3+deb12u1                     amd64        libraries for the PipeWire multimedia server - modules
ii  libpulse-mainloop-glib0:amd64            16.1+dfsg1-2+b1                      amd64        PulseAudio client libraries (glib support)
ii  libpulse0:amd64                          16.1+dfsg1-2+b1                      amd64        PulseAudio client libraries
ii  libpulse0:i386                           16.1+dfsg1-2+b1                      i386         PulseAudio client libraries
ii  libpulsedsp:amd64                        16.1+dfsg1-2+b1                      amd64        PulseAudio OSS pre-load library
ii  libspa-0.2-bluetooth:amd64               0.3.65-3+deb12u1                     amd64        libraries for the PipeWire multimedia server - bluetooth plugins
ii  libspa-0.2-modules:amd64                 0.3.65-3+deb12u1                     amd64        libraries for the PipeWire multimedia server Simple Plugin API - modules
ii  libzita-alsa-pcmi0:amd64                 0.6.1-1                              amd64        C++ wrapper around the ALSA API
ii  lsp-plugins-jack                         1.2.5-1                              amd64        LSP (Linux Studio Plugins) audio-plugins (standalone JACK clients)
ii  mudita24                                 1.0.3+svn13-7                        amd64        ALSA GUI control tool for Envy24 (ice1712) soundcards
ii  multimedia-jack                          0.10                                 all          JACK (Jack Audio Connection Kit) and ALSA related packages
ii  pavucontrol                              5.0-2                                amd64        PulseAudio Volume Control
ii  pipewire:amd64                           0.3.65-3+deb12u1                     amd64        audio and video processing engine multimedia server
ii  pipewire-alsa:amd64                      0.3.65-3+deb12u1                     amd64        PipeWire ALSA plugin
ii  pipewire-audio                           0.3.65-3+deb12u1                     all          recommended set of PipeWire packages for a standard audio desktop use
ii  pipewire-bin                             0.3.65-3+deb12u1                     amd64        PipeWire multimedia server - programs
ii  pipewire-jack:amd64                      0.3.65-3+deb12u1                     amd64        PipeWire JACK plugin
ii  pipewire-pulse                           0.3.65-3+deb12u1                     amd64        PipeWire PulseAudio daemon
ii  pulseaudio-utils                         16.1+dfsg1-2+b1                      amd64        Command line tools for the PulseAudio sound server
ii  qasconfig                                0.23.0-1                             amd64        ALSA configuration browser
ii  qashctl                                  0.23.0-1                             amd64        mixer for ALSA's High level Control Interface
ii  qasmixer                                 0.23.0-1                             amd64        ALSA mixer for the desktop
ii  qjackctl                                 0.9.9-1                              amd64        User interface for controlling the JACK sound server
ii  silentjack                               0.3-2+b2                             amd64        silence detector for the JACK audio system
ii  wireplumber                              0.4.13-1                             amd64        modular session / policy manager for PipeWire
ii  xjadeo                                   0.8.12-1                             amd64        Video player with JACK sync
ii  zita-ajbridge                            0.8.4-1                              amd64        alsa to jack bridge
ii  zita-alsa-pcmi-utils                     0.6.1-1                              amd64        Two simple demo programs zita-alsa-pcmi library
ii  zita-lrx                                 0.1.2-1                              amd64        Command line jack application providing crossover filters
ii  zita-mu1                                 0.3.3-2                              amd64        organise stereo monitoring for Jack Audio Connection Kit
ii  zita-njbridge                            0.4.8-1                              amd64        Jack clients to transmit multichannel audio over a local IP network
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/401
Repository URL: https://github.com/alsa-project/alsa-lib
