Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A991587891D
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 20:52:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5A01EDB;
	Mon, 11 Mar 2024 20:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5A01EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710186724;
	bh=F++vK1tYkFTmaDNnQ/PVFOa1BrtGrFm//eKYTNRrubs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OIfl5o7wRveGLEKqhnk+pPGIb1N8L0Jk2JUWtWtXFusDMg05CumtNkeKsizz4Z9u2
	 QGGECwx1MNXMItkBjugvHZ+afMGJ+rhyG4mez/TJHtjP8a7nEScxazkTPR/tLlsrKs
	 8no0F8AxBkzSCSg7nzbfZzyAtRXfeM/aeZ4En3MI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B710F805A1; Mon, 11 Mar 2024 20:51:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9918F80588;
	Mon, 11 Mar 2024 20:51:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2656EF8028D; Mon, 11 Mar 2024 20:51:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B1163F8014B
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 20:51:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1163F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710186674228767157-webhooks-bot@alsa-project.org>
References: <1710186674228767157-webhooks-bot@alsa-project.org>
Subject: UCM2 for HP Chromebook X2 11" (sc7180-adau7002-max98357a)
Message-Id: <20240311195127.2656EF8028D@alsa1.perex.cz>
Date: Mon, 11 Mar 2024 20:51:27 +0100 (CET)
Message-ID-Hash: JE3YN3Q2R7VQYMLTJM3ICMPETNQ2KGNG
X-Message-ID-Hash: JE3YN3Q2R7VQYMLTJM3ICMPETNQ2KGNG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JE3YN3Q2R7VQYMLTJM3ICMPETNQ2KGNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #403 was opened from pulak1901:

Hi, I've been trying to get sound working on this tablet.

Since I'm quite new to alsa UCM & PA/PW, I took a look at the existing sc7180-rt5682-max98357a config as well as the [ChromeOS UCM for this system](https://chromium.googlesource.com/chromiumos/overlays/board-overlays/+/refs/heads/main/overlay-strongbad/chromeos-base/chromeos-bsp-strongbad/files/coachz/audio/ucm-config/sc7180-adau7002-max98357a/HiFi.conf).

It looks like the hardware does not have any hw controls (`alsamixer -c 0` shows no bars), so it was easy to get internal speakers & microphone working (albeit without any gain for the mic).

However, I could not get the USB HDMI/DP output to work seamlessly. Even though I've mentioned the JackControl,  PA tries to open the device, errors out, and fails to find a working profile. It only works if I reboot the system with HDMI plugged in. Jack detection itself seems to be fine(from the output of `amixer -c 0 contents`), so is there something else I should be doing here?

<details><summary>amixer -c 0 contents</summary>
<p>

```
numid=1,iface=CARD,name='HDMI Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=off
numid=5,iface=PCM,name='ELD',device=2
  ; type=BYTES,access=r--v----,values=128
  : values=0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
numid=4,iface=PCM,name='IEC958 Playback Default',device=2
  ; type=IEC958,access=rw------,values=1
  : values=[AES0=0x04 AES1=0x00 AES2=0x00 AES3=0x01]
numid=3,iface=PCM,name='IEC958 Playback Mask',device=2
  ; type=IEC958,access=r-------,values=1
  : values=[AES0=0xff AES1=0xff AES2=0xff AES3=0xff]
numid=2,iface=PCM,name='Playback Channel Map',device=2
  ; type=INTEGER,access=r----R--,values=8,min=0,max=36,step=0
  : values=0,0,0,0,0,0,0,0
  | container
    | chmap-fixed=FL,FR
``` 

</p>
</details> 

<details><summary>pulseaudio -vvv</summary>
<p>

```
...
D: [pulseaudio] module-udev-detect.c: /dev/snd/controlC0 is accessible: yes
D: [pulseaudio] module-udev-detect.c: /devices/platform/sound/sound/card0 is busy: no
D: [pulseaudio] module-udev-detect.c: Loading module-alsa-card with arguments 'device_id="0" name="platform-sound" card_name="alsa_card.platform-sound" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1"'
D: [pulseaudio] reserve-wrap.c: Unable to contact D-Bus session bus: org.freedesktop.DBus.Error.Spawn.ExecFailed: /usr/bin/dbus-launch terminated abnormally without any error message
I: [pulseaudio] alsa-ucm.c: UCM available for card hw:0
D: [pulseaudio] alsa-ucm.c: UCM _alibpref=_ucm0006.
I: [pulseaudio] alsa-ucm.c: Set UCM verb to HiFi
D: [pulseaudio] alsa-ucm.c: Got PlaybackPCM for device HDMI: _ucm0006.hw:sc7180adau7002m,2
D: [pulseaudio] alsa-ucm.c: Got PlaybackCTL for device HDMI: _ucm0006.hw:sc7180adau7002m
D: [pulseaudio] alsa-ucm.c: Got CaptureCTL for device HDMI: _ucm0006.hw:sc7180adau7002m
D: [pulseaudio] alsa-ucm.c: Got JackControl for device HDMI: HDMI Jack
I: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' for device HDMI, assuming stereo.
D: [pulseaudio] alsa-ucm.c: No _supporteddevs for device HDMI
D: [pulseaudio] alsa-ucm.c: Got CapturePCM for device Mic: _ucm0006.hw:sc7180adau7002m,0
D: [pulseaudio] alsa-ucm.c: Got PlaybackCTL for device Mic: _ucm0006.hw:sc7180adau7002m
D: [pulseaudio] alsa-ucm.c: Got CaptureCTL for device Mic: _ucm0006.hw:sc7180adau7002m
D: [pulseaudio] alsa-ucm.c: Got CapturePriority for device Mic: 100
I: [pulseaudio] alsa-ucm.c: UCM file does not specify 'CaptureChannels' for device Mic, assuming stereo.
D: [pulseaudio] alsa-ucm.c: No _conflictingdevs for device Mic
D: [pulseaudio] alsa-ucm.c: No _supporteddevs for device Mic
D: [pulseaudio] alsa-ucm.c: Got PlaybackPCM for device Speaker: _ucm0006.hw:sc7180adau7002m,1
D: [pulseaudio] alsa-ucm.c: Got PlaybackCTL for device Speaker: _ucm0006.hw:sc7180adau7002m
D: [pulseaudio] alsa-ucm.c: Got PlaybackPriority for device Speaker: 100
D: [pulseaudio] alsa-ucm.c: Got PlaybackRate for device Speaker: 48000
D: [pulseaudio] alsa-ucm.c: Got PlaybackChannels for device Speaker: 2
D: [pulseaudio] alsa-ucm.c: Got CaptureCTL for device Speaker: _ucm0006.hw:sc7180adau7002m
D: [pulseaudio] alsa-ucm.c: UCM playback device Speaker rate 48000
D: [pulseaudio] alsa-ucm.c: No _supporteddevs for device Speaker
I: [pulseaudio] module-alsa-card.c: Found UCM profiles
D: [pulseaudio] alsa-ucm.c: UCM mapping: HiFi: hw:sc7180adau7002m,2: sink dev HDMI
D: [pulseaudio] alsa-ucm.c: UCM mapping: HiFi: hw:sc7180adau7002m,0: source dev Mic
D: [pulseaudio] alsa-ucm.c: UCM mapping: HiFi: hw:sc7180adau7002m,1: sink dev Speaker
D: [pulseaudio] alsa-mixer.c: Profile HiFi (Default), input=(null), output=(null) priority=8000, supported=yes n_input_mappings=1, n_output_mappings=2
D: [pulseaudio] alsa-mixer.c: Input HiFi: hw:sc7180adau7002m,0: source
D: [pulseaudio] alsa-mixer.c: Output HiFi: hw:sc7180adau7002m,2: sink
D: [pulseaudio] alsa-mixer.c: Output HiFi: hw:sc7180adau7002m,1: sink
I: [pulseaudio] alsa-ucm.c: Set ucm verb to HiFi
D: [pulseaudio] alsa-util.c: Trying _ucm0006.hw:sc7180adau7002m,2 with SND_PCM_NO_AUTO_FORMAT ...
D: [pulseaudio] alsa-util.c: Managed to open _ucm0006.hw:sc7180adau7002m,2
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Signed 16 bit Little Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Signed 16 bit Big Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Float 32 bit Little Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Float 32 bit Big Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Signed 32 bit Little Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Signed 32 bit Big Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: Maximum hw buffer size is 128 ms
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_HW_PARAMS failed (-22)
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_HW_PARAMS failed (-22)
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_HW_PARAMS failed (-22)
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_HW_PARAMS failed (-22)
D: [pulseaudio] alsa-util.c: Set neither period nor buffer size.
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_HW_PARAMS failed (-22)
I: [pulseaudio] alsa-util.c: snd_pcm_hw_params failed: Invalid argument
D: [pulseaudio] alsa-util.c: Trying _ucm0006.hw:sc7180adau7002m,2 without SND_PCM_NO_AUTO_FORMAT ...
D: [pulseaudio] alsa-util.c: Managed to open _ucm0006.hw:sc7180adau7002m,2
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Signed 16 bit Little Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Signed 16 bit Big Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Float 32 bit Little Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Float 32 bit Big Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Signed 32 bit Little Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: snd_pcm_hw_params_set_format(Signed 32 bit Big Endian) failed: Invalid argument
D: [pulseaudio] alsa-util.c: Maximum hw buffer size is 128 ms
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_HW_PARAMS failed (-22)
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_HW_PARAMS failed (-22)
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_HW_PARAMS failed (-22)
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_HW_PARAMS failed (-22)
D: [pulseaudio] alsa-util.c: Set neither period nor buffer size.
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_HW_PARAMS failed (-22)
I: [pulseaudio] alsa-util.c: snd_pcm_hw_params failed: Invalid argument
D: [pulseaudio] alsa-util.c: Trying plug:SLAVE='_ucm0006.hw:sc7180adau7002m,2' with SND_PCM_NO_AUTO_FORMAT ...
I: [pulseaudio] (alsa-lib)pcm.c: Unknown PCM _ucm0006.hw:sc7180adau7002m,2
I: [pulseaudio] alsa-util.c: Error opening PCM device plug:SLAVE='_ucm0006.hw:sc7180adau7002m,2': No such file or directory
D: [pulseaudio] alsa-mixer.c: Profile set 0xaaab034ad7e0, auto_profiles=no, probed=yes, n_mappings=0, n_profiles=0, n_decibel_fixes=0
E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="0" name="platform-sound" card_name="alsa_card.platform-sound" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.
I: [pulseaudio] module-udev-detect.c: Card /devices/platform/sound/sound/card0 (alsa_card.platform-sound) failed to load module.
D: [pulseaudio] bluez5-util.c: Media application for adapter /org/bluez/hci0 was successfully registered
D: [pulseaudio] module-udev-detect.c: /dev/snd/controlC0 is accessible: yes
D: [pulseaudio] module-udev-detect.c: /devices/platform/sound/sound/card0 is busy: no
W: [pulseaudio] module-udev-detect.c: Tried to configure /devices/platform/sound/sound/card0 (alsa_card.platform-sound) more often than 5 times in 10s
...
```

</p>
</details>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/403
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/403.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
