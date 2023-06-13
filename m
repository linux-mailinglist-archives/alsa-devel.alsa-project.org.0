Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8B472EB03
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 20:32:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89904EAA;
	Tue, 13 Jun 2023 20:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89904EAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686681155;
	bh=rpjaUQaKqheRi5x93bvCXfognKWCG/Eq3yElxSXsFto=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jywyAZuemxXR09cN+TQCqRXISbgMvdquBBp1A9p91sUsCh9xR0xm1q8CfsjYf5qPL
	 SzcR7i7JywsV3SRfhaLqVG21qeXN+FSKRwk645TvPFdx8Oq3XTzz0KnKJ0wmlgQ+zx
	 ANtLZM9KEVn0tAe4wnSGZNzOpSGX6zjwngzqozcQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0D81F80246; Tue, 13 Jun 2023 20:31:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4198F80132;
	Tue, 13 Jun 2023 20:31:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EDAEF80149; Tue, 13 Jun 2023 20:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B7B04F80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 20:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7B04F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1686681085118930101-webhooks-bot@alsa-project.org>
References: <1686681085118930101-webhooks-bot@alsa-project.org>
Subject: bug in snd_usb_audio alsa driver, likely cause for audio freezes
Message-Id: <20230613183138.5EDAEF80149@alsa1.perex.cz>
Date: Tue, 13 Jun 2023 20:31:38 +0200 (CEST)
Message-ID-Hash: CVZ477VB5M5YVQ3J6OKZZCAMWK63JG7Z
X-Message-ID-Hash: CVZ477VB5M5YVQ3J6OKZZCAMWK63JG7Z
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVZ477VB5M5YVQ3J6OKZZCAMWK63JG7Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #328 was opened from VMichailidis:

For the past few days I've been encountering this bug where during media playback audio will stop, a few seconds later the video will stop and allow the audio section to catch up. Also during voice calls and video games audio will occasionally stop.
Initially I was using pipewire and jounalctl wasn't reporting any issues, eventually I switched to pulseaudio. The switch didn't fix anything, however journalctl has been reporting the following message:


```
Jun 13 17:18:25 melchior pulseaudio[1347]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 13 17:18:25 melchior pulseaudio[1347]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 13 17:18:25 melchior pulseaudio[1347]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
```

So I resolved to raise the issue here.

Here is the rest of the relevant journalctl output



```
journalctl | grep ALSA

Jun 07 22:12:14 melchior pulseaudio[44796]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 07 22:12:14 melchior pulseaudio[44796]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 07 23:41:12 melchior pulseaudio[1273]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 07 23:41:12 melchior pulseaudio[1273]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 08 01:39:23 melchior pulseaudio[946]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 08 01:39:23 melchior pulseaudio[946]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 08 18:00:28 melchior pulseaudio[1495]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 08 18:00:28 melchior pulseaudio[1495]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 09 23:18:45 melchior pulseaudio[1692]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 09 23:18:45 melchior pulseaudio[1692]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 10 00:10:17 melchior pulseaudio[1516]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 10 00:10:17 melchior pulseaudio[1516]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 10 15:00:28 melchior pulseaudio[1491]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 10 15:00:28 melchior pulseaudio[1491]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 11 01:16:33 melchior pulseaudio[1346]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 11 01:16:33 melchior pulseaudio[1346]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 11 13:30:54 melchior pulseaudio[1334]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 11 13:30:54 melchior pulseaudio[1334]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 11 17:13:20 melchior pulseaudio[1644]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 11 17:13:20 melchior pulseaudio[1644]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 12 19:53:14 melchior pulseaudio[1168]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 12 19:53:14 melchior pulseaudio[1168]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 13 17:18:25 melchior pulseaudio[1347]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 13 17:18:25 melchior pulseaudio[1347]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
```

```
journalctl | grep pulseaudio

Jun 07 21:51:03 melchior dbus-daemon[515]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.57' (uid=1000 pid=44796 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 07 21:51:03 melchior pulseaudio[44796]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 07 21:51:03 melchior pulseaudio[44796]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 07 21:51:03 melchior pulseaudio[44796]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 07 22:12:14 melchior pulseaudio[44796]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 07 22:12:14 melchior pulseaudio[44796]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 07 22:12:14 melchior pulseaudio[44796]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Jun 07 22:48:10 melchior dbus-daemon[515]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.143' (uid=1000 pid=44796 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 07 22:48:10 melchior dbus-daemon[515]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.144' (uid=1000 pid=44796 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 07 22:48:10 melchior dbus-daemon[515]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.145' (uid=1000 pid=44796 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 07 22:48:10 melchior dbus-daemon[515]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.146' (uid=1000 pid=44796 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 07 22:48:10 melchior dbus-daemon[515]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.147' (uid=1000 pid=44796 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 07 22:48:10 melchior pulseaudio[44796]: Error opening PCM device iec958:3: No such file or directory
Jun 07 22:48:10 melchior systemd[563]: pulseaudio.service: Consumed 14.257s CPU time.
Jun 07 22:48:44 melchior dbus-daemon[563]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.18' (uid=1000 pid=1273 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 07 22:48:44 melchior pulseaudio[1273]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 07 22:48:44 melchior pulseaudio[1273]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 07 22:48:44 melchior pulseaudio[1273]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 07 23:05:43 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.pci-0000_03_00.1.hdmi-stereo-extra3"
Jun 07 23:16:17 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_input.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.mono-fallback"
Jun 07 23:16:17 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 07 23:16:40 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 07 23:25:05 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo"
Jun 07 23:25:05 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 07 23:25:05 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo"
Jun 07 23:25:05 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo.monitor"
Jun 07 23:25:05 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo.monitor"
Jun 07 23:25:07 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo"
Jun 07 23:25:07 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo.monitor"
Jun 07 23:25:07 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo"
Jun 07 23:25:07 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 07 23:25:07 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 07 23:25:10 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo"
Jun 07 23:25:10 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 07 23:25:10 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo"
Jun 07 23:25:10 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo.monitor"
Jun 07 23:25:10 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo.monitor"
Jun 07 23:41:12 melchior pulseaudio[1273]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 07 23:41:12 melchior pulseaudio[1273]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 07 23:41:12 melchior pulseaudio[1273]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Jun 07 23:49:49 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo.monitor"
Jun 08 00:05:37 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo.monitor"
Jun 08 00:22:52 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo"
Jun 08 00:22:52 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo.monitor"
Jun 08 00:22:52 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo"
Jun 08 00:22:52 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 08 00:22:52 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 08 00:31:33 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo"
Jun 08 00:31:33 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 08 00:31:33 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo"
Jun 08 00:31:33 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_input.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.mono-fallback"
Jun 08 00:31:33 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_input.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.mono-fallback"
Jun 08 00:31:36 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_input.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.mono-fallback"
Jun 08 00:31:36 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo.monitor"
Jun 08 00:34:26 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo"
Jun 08 00:34:26 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.analog-stereo.monitor"
Jun 08 00:34:26 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo"
Jun 08 00:34:26 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 08 00:34:26 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 08 01:08:06 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 08 01:14:21 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_input.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.mono-fallback"
Jun 08 01:14:21 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 08 01:14:41 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo.monitor"
Jun 08 01:38:21 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo"
Jun 08 01:38:21 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo"
Jun 08 01:38:21 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_output.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.iec958-stereo"
Jun 08 01:38:21 melchior kdeconnectd[824]: org.kde.pulseaudio: No object for name "alsa_input.usb-Elgato_Systems_Elgato_Wave_1_AS31J1A08137-00.mono-fallback"
Jun 08 01:38:21 melchior pulseaudio[1273]: Error opening PCM device hw:3: No such file or directory
Jun 08 01:38:21 melchior systemd[638]: pulseaudio.service: Consumed 1min 30.529s CPU time.
Jun 08 01:38:53 melchior dbus-daemon[491]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.14' (uid=1000 pid=946 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 01:38:53 melchior pulseaudio[946]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 08 01:38:53 melchior pulseaudio[946]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 08 01:38:53 melchior pulseaudio[946]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 08 01:39:23 melchior pulseaudio[946]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 08 01:39:23 melchior pulseaudio[946]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 08 01:39:23 melchior pulseaudio[946]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Jun 08 02:01:24 melchior dbus-daemon[491]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.37' (uid=1000 pid=946 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 02:01:24 melchior dbus-daemon[491]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.38' (uid=1000 pid=946 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 02:01:24 melchior dbus-daemon[491]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.39' (uid=1000 pid=946 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 02:01:24 melchior dbus-daemon[491]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.40' (uid=1000 pid=946 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 02:01:24 melchior dbus-daemon[491]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.41' (uid=1000 pid=946 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 02:01:24 melchior systemd[610]: pulseaudio.service: Consumed 12.550s CPU time.
Jun 08 11:45:49 melchior dbus-daemon[516]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.18' (uid=1000 pid=1235 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 11:45:50 melchior pulseaudio[1235]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 08 11:45:50 melchior pulseaudio[1235]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 08 11:45:50 melchior pulseaudio[1235]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 08 12:32:43 melchior dbus-daemon[516]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.36' (uid=1000 pid=1235 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 12:32:43 melchior dbus-daemon[516]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.37' (uid=1000 pid=1235 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 12:32:43 melchior dbus-daemon[516]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.38' (uid=1000 pid=1235 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 12:32:43 melchior dbus-daemon[516]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.39' (uid=1000 pid=1235 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 12:32:43 melchior dbus-daemon[516]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.40' (uid=1000 pid=1235 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 12:32:43 melchior systemd[606]: pulseaudio.service: Consumed 12.826s CPU time.
Jun 08 17:56:45 melchior dbus-daemon[528]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.18' (uid=1000 pid=1495 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 08 17:56:46 melchior pulseaudio[1495]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 08 17:56:46 melchior pulseaudio[1495]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 08 17:56:46 melchior pulseaudio[1495]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 08 18:00:28 melchior pulseaudio[1495]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 08 18:00:28 melchior pulseaudio[1495]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 08 18:00:28 melchior pulseaudio[1495]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Jun 09 02:20:10 melchior dbus-daemon[528]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.111' (uid=1000 pid=1495 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 09 02:20:10 melchior dbus-daemon[528]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.112' (uid=1000 pid=1495 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 09 02:20:10 melchior dbus-daemon[528]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.113' (uid=1000 pid=1495 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 09 02:20:10 melchior dbus-daemon[528]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.114' (uid=1000 pid=1495 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 09 02:20:10 melchior dbus-daemon[528]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.115' (uid=1000 pid=1495 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 09 02:20:10 melchior systemd[616]: pulseaudio.service: Consumed 1min 809ms CPU time.
Jun 09 19:31:43 melchior dbus-daemon[496]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.23' (uid=1000 pid=1692 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 09 19:31:44 melchior pulseaudio[1692]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 09 19:31:44 melchior pulseaudio[1692]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 09 19:31:44 melchior pulseaudio[1692]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 09 23:18:45 melchior pulseaudio[1692]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 09 23:18:45 melchior pulseaudio[1692]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 09 23:18:45 melchior pulseaudio[1692]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Jun 10 00:08:24 melchior dbus-daemon[496]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.53' (uid=1000 pid=1692 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 00:08:24 melchior dbus-daemon[496]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.54' (uid=1000 pid=1692 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 00:08:24 melchior dbus-daemon[496]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.55' (uid=1000 pid=1692 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 00:08:24 melchior dbus-daemon[496]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.56' (uid=1000 pid=1692 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 00:08:24 melchior dbus-daemon[496]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.57' (uid=1000 pid=1692 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 00:08:24 melchior pulseaudio[1692]: Error opening PCM device hw:3: No such file or directory
Jun 10 00:08:24 melchior systemd[615]: pulseaudio.service: Consumed 21.103s CPU time.
Jun 10 00:09:16 melchior dbus-daemon[505]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.18' (uid=1000 pid=1516 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 00:09:16 melchior pulseaudio[1516]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 10 00:09:16 melchior pulseaudio[1516]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 10 00:09:16 melchior pulseaudio[1516]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 10 00:10:17 melchior pulseaudio[1516]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 10 00:10:17 melchior pulseaudio[1516]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 10 00:10:17 melchior pulseaudio[1516]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Jun 10 00:41:02 melchior dbus-daemon[505]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.28' (uid=1000 pid=1516 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 00:41:02 melchior dbus-daemon[505]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.29' (uid=1000 pid=1516 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 00:41:02 melchior dbus-daemon[505]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.30' (uid=1000 pid=1516 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 00:41:02 melchior dbus-daemon[505]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.31' (uid=1000 pid=1516 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 00:41:02 melchior dbus-daemon[505]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.32' (uid=1000 pid=1516 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 00:41:02 melchior systemd[627]: pulseaudio.service: Consumed 12.940s CPU time.
Jun 10 14:47:13 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.18' (uid=1000 pid=1491 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 14:47:13 melchior pulseaudio[1491]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 10 14:47:13 melchior pulseaudio[1491]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 10 14:47:13 melchior pulseaudio[1491]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 10 15:00:28 melchior pulseaudio[1491]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 10 15:00:28 melchior pulseaudio[1491]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 10 15:00:28 melchior pulseaudio[1491]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Jun 10 15:27:53 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.35' (uid=1000 pid=1491 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 15:27:53 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.36' (uid=1000 pid=1491 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 15:27:53 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.37' (uid=1000 pid=1491 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 15:27:53 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.38' (uid=1000 pid=1491 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 15:27:53 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.39' (uid=1000 pid=1491 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 15:27:53 melchior pulseaudio[1491]: Error opening PCM device iec958:3: No such file or directory
Jun 10 15:27:53 melchior systemd[618]: pulseaudio.service: Consumed 7.926s CPU time.
Jun 10 18:38:08 melchior dbus-daemon[492]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.18' (uid=1000 pid=1304 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 18:38:08 melchior pulseaudio[1304]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 10 18:38:08 melchior pulseaudio[1304]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 10 18:38:08 melchior pulseaudio[1304]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 10 22:55:47 melchior dbus-daemon[492]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.90' (uid=1000 pid=1304 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 22:55:47 melchior dbus-daemon[492]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.91' (uid=1000 pid=1304 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 22:55:47 melchior dbus-daemon[492]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.92' (uid=1000 pid=1304 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 22:55:47 melchior dbus-daemon[492]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.93' (uid=1000 pid=1304 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 22:55:47 melchior dbus-daemon[492]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.94' (uid=1000 pid=1304 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 10 22:55:47 melchior systemd[612]: pulseaudio.service: Consumed 20.163s CPU time.
Jun 11 00:59:13 melchior dbus-daemon[513]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.18' (uid=1000 pid=1346 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 00:59:14 melchior pulseaudio[1346]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 11 00:59:14 melchior pulseaudio[1346]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 11 00:59:14 melchior pulseaudio[1346]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 11 01:16:33 melchior pulseaudio[1346]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 11 01:16:33 melchior pulseaudio[1346]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 11 01:16:33 melchior pulseaudio[1346]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Jun 11 01:29:42 melchior dbus-daemon[513]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.39' (uid=1000 pid=1346 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 01:29:42 melchior dbus-daemon[513]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.40' (uid=1000 pid=1346 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 01:29:42 melchior dbus-daemon[513]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.41' (uid=1000 pid=1346 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 01:29:42 melchior dbus-daemon[513]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.42' (uid=1000 pid=1346 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 01:29:42 melchior dbus-daemon[513]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.43' (uid=1000 pid=1346 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 01:29:42 melchior pulseaudio[1346]: Error opening PCM device hw:3: No such file or directory
Jun 11 01:29:42 melchior systemd[638]: pulseaudio.service: Consumed 7.162s CPU time.
Jun 11 11:37:46 melchior dbus-daemon[468]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.18' (uid=1000 pid=1334 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 11:37:46 melchior pulseaudio[1334]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 11 11:37:46 melchior pulseaudio[1334]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 11 11:37:46 melchior pulseaudio[1334]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 11 13:30:54 melchior pulseaudio[1334]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 11 13:30:54 melchior pulseaudio[1334]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 11 13:30:54 melchior pulseaudio[1334]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Jun 11 13:51:22 melchior dbus-daemon[468]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.57' (uid=1000 pid=1334 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 13:51:22 melchior dbus-daemon[468]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.58' (uid=1000 pid=1334 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 13:51:22 melchior dbus-daemon[468]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.59' (uid=1000 pid=1334 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 13:51:22 melchior dbus-daemon[468]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.60' (uid=1000 pid=1334 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 13:51:22 melchior dbus-daemon[468]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.61' (uid=1000 pid=1334 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 13:51:22 melchior pulseaudio[1334]: Error opening PCM device hw:3: No such file or directory
Jun 11 13:51:22 melchior systemd[618]: pulseaudio.service: Consumed 11.444s CPU time.
Jun 11 15:53:44 melchior dbus-daemon[536]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.18' (uid=1000 pid=1644 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 15:53:44 melchior pulseaudio[1644]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 11 15:53:44 melchior pulseaudio[1644]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 11 15:53:44 melchior pulseaudio[1644]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 11 17:13:20 melchior pulseaudio[1644]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 11 17:13:20 melchior pulseaudio[1644]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 11 17:13:20 melchior pulseaudio[1644]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Jun 11 21:20:39 melchior dbus-daemon[536]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.63' (uid=1000 pid=1644 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 21:20:39 melchior dbus-daemon[536]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.64' (uid=1000 pid=1644 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 21:20:39 melchior dbus-daemon[536]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.65' (uid=1000 pid=1644 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 21:20:39 melchior dbus-daemon[536]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.66' (uid=1000 pid=1644 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 21:20:39 melchior dbus-daemon[536]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.67' (uid=1000 pid=1644 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 11 21:20:39 melchior systemd[621]: pulseaudio.service: Consumed 13.392s CPU time.
Jun 12 14:01:16 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.16' (uid=1000 pid=1168 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 14:01:17 melchior pulseaudio[1168]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 12 14:01:17 melchior pulseaudio[1168]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 12 14:01:17 melchior pulseaudio[1168]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 12 19:53:14 melchior pulseaudio[1168]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 12 19:53:14 melchior pulseaudio[1168]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 12 19:53:14 melchior pulseaudio[1168]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Jun 12 23:14:09 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.71' (uid=1000 pid=1168 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 23:14:09 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.72' (uid=1000 pid=1168 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 23:14:09 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.73' (uid=1000 pid=1168 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 23:14:09 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.74' (uid=1000 pid=1168 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 23:14:09 melchior dbus-daemon[472]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.75' (uid=1000 pid=1168 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 23:14:09 melchior systemd[652]: pulseaudio.service: Consumed 4min 4.210s CPU time.
Jun 12 23:14:41 melchior dbus-daemon[510]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.23' (uid=1000 pid=1890 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 23:14:42 melchior pulseaudio[1890]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 12 23:14:42 melchior pulseaudio[1890]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 12 23:14:42 melchior pulseaudio[1890]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 12 23:22:19 melchior dbus-daemon[510]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.47' (uid=1000 pid=1890 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 23:22:19 melchior dbus-daemon[510]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.48' (uid=1000 pid=1890 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 23:22:19 melchior dbus-daemon[510]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.49' (uid=1000 pid=1890 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 23:22:19 melchior dbus-daemon[510]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.50' (uid=1000 pid=1890 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 23:22:19 melchior dbus-daemon[510]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.51' (uid=1000 pid=1890 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 12 23:22:19 melchior pulseaudio[1890]: Error opening PCM device hw:3: No such file or directory
Jun 12 23:22:19 melchior systemd[623]: pulseaudio.service: Consumed 2.341s CPU time.
Jun 13 15:42:21 melchior dbus-daemon[498]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service' requested by ':1.18' (uid=1000 pid=1347 comm="/usr/bin/pulseaudio --daemonize=no --log-target=jo")
Jun 13 15:42:21 melchior pulseaudio[1347]: Failed to open cookie file '/home/basil/.config/pulse/cookie': No such file or directory
Jun 13 15:42:21 melchior pulseaudio[1347]: Failed to load authentication key '/home/basil/.config/pulse/cookie': No such file or directory
Jun 13 15:42:21 melchior pulseaudio[1347]: stat('/etc/pulse/default.pa.d'): No such file or directory
Jun 13 17:18:25 melchior pulseaudio[1347]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Jun 13 17:18:25 melchior pulseaudio[1347]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Jun 13 17:18:25 melchior pulseaudio[1347]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/328
Repository URL: https://github.com/alsa-project/alsa-lib
