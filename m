Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA22CA7BD
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 17:08:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53D9E172A;
	Tue,  1 Dec 2020 17:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53D9E172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606838906;
	bh=6KqkQ3DqUxVW1ifRFhu96Cg0kXR6m55SaJqYBdaENt8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NdRX/6uXLwZ6mk7Sdm6xePOWrprh/vbKV5ICFJ3S9SHcaI34G4yzXgaGmRzGlGf34
	 uTT8X9RWp9ukx8LI5mpQU5BClF3oUqApabitxyOtgCWVf+Dyp8B73i/HE37NM3zzSk
	 3bgbInqq6GObG+R01gGNbP9KiGOaolp53z86ugAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F4A6F80254;
	Tue,  1 Dec 2020 17:06:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA23EF8016D; Tue,  1 Dec 2020 17:06:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_30,SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 23051F80168
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 17:06:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23051F80168
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1606838795700922012-webhooks-bot@alsa-project.org>
References: <1606838795700922012-webhooks-bot@alsa-project.org>
Subject: module-alsa-card.c: Failed to find a working profile.
Message-Id: <20201201160648.DA23EF8016D@alsa1.perex.cz>
Date: Tue,  1 Dec 2020 17:06:48 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #104 was opened from mhwombat:

I can get audio through my headphones, but not through my speakers.

Basic checks:

- Speakers work on another machine
- Speakers are plugged in and turned on
- Headphones are unplugged when using speakers
- My user account is in the audio group.
- Nothing is muted in alsamixer

I think the cause might be this `module-alsa-card.c: Failed to find a working profile.`

```
$ journalctl --user -u pulseaudio | tail -n 20
-- Reboot --
Nov 28 22:35:15 nixos systemd[2142]: Starting Sound Service...
Nov 28 22:35:15 nixos pulseaudio[2160]: E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
Nov 28 22:35:15 nixos pulseaudio[2160]: E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="0" name="pci-0000_22_00.4" card_name="alsa_card.pci-0000_22_00.4" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.
Nov 28 22:35:17 nixos pulseaudio[2160]: E: [pulseaudio] module-jackdbus-detect.c: Unable to contact D-Bus session bus: org.freedesktop.DBus.Error.NotSupported: Unable to autolaunch a dbus-daemon without a $DISPLAY for X11
Nov 28 22:35:17 nixos pulseaudio[2160]: E: [pulseaudio] module.c: Failed to load module "module-jackdbus-detect" (argument: "channels=2"): initialization failed.
Nov 28 22:35:17 nixos pulseaudio[2160]: W: [pulseaudio] server-lookup.c: Unable to contact D-Bus: org.freedesktop.DBus.Error.NotSupported: Unable to autolaunch a dbus-daemon without a $DISPLAY for X11
Nov 28 22:35:17 nixos pulseaudio[2160]: W: [pulseaudio] main.c: Unable to contact D-Bus: org.freedesktop.DBus.Error.NotSupported: Unable to autolaunch a dbus-daemon without a $DISPLAY for X11
Nov 28 22:35:17 nixos systemd[2142]: Started Sound Service.
Nov 28 22:35:17 nixos pulseaudio[2160]: E: [pulseaudio] bluez5-util.c: GetManagedObjects() failed: org.freedesktop.DBus.Error.ServiceUnknown: The name org.bluez was not provided by any .service files
Nov 29 17:24:50 nixos systemd[2142]: pulseaudio.service: Current command vanished from the unit file, execution of the command list won't be resumed.
Nov 29 17:25:00 nixos pulseaudio[2160]: E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
Nov 29 17:25:00 nixos pulseaudio[2160]: E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="0" name="pci-0000_22_00.4" card_name="alsa_card.pci-0000_22_00.4" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.
Nov 29 17:25:00 nixos pulseaudio[2160]: E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
Nov 29 17:25:00 nixos pulseaudio[2160]: E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="0" name="pci-0000_22_00.4" card_name="alsa_card.pci-0000_22_00.4" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.
Nov 29 17:25:01 nixos pulseaudio[2160]: E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
Nov 29 17:25:01 nixos pulseaudio[2160]: E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="0" name="pci-0000_22_00.4" card_name="alsa_card.pci-0000_22_00.4" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.
Dec 01 10:53:45 nixos pulseaudio[2160]: E: [alsa-sink-USB Audio] alsa-sink.c: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Dec 01 10:53:45 nixos pulseaudio[2160]: E: [alsa-sink-USB Audio] alsa-sink.c: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Dec 01 10:53:45 nixos pulseaudio[2160]: E: [alsa-sink-USB Audio] alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
```

Here is the [output of alsa-info_alsa-info.sh](https://alsa-project.org/db/?f=c5a24a41c9ab6f2b320362b6b0d3afee507d6cab).

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/104
Repository URL: https://github.com/alsa-project/alsa-lib
