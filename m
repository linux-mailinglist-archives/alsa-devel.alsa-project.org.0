Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D275BA54239
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Mar 2025 06:36:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A2B160441;
	Thu,  6 Mar 2025 06:36:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A2B160441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741239398;
	bh=i6rcZGPHrQ5ZsDP++dkMcXr2L62FrSF3oiKa9FKtQ/o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Gb0w8LAZUoUXWGKMvqtKFlx39t+FjHmcTQjoDOHQlebCQn75bHQSwowmiecl5hf0W
	 6oFcFduDNXLxHkzI2IgVez/qiOCSl9dWmGtiXTV4tu008De+lYfu/FZoR4r0LTfSWH
	 lFIuXU6GuKgMRhI9jvD434a/268Llfv1efypFo9c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A58F2F804B0; Thu,  6 Mar 2025 06:36:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25525F805BD;
	Thu,  6 Mar 2025 06:36:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B34AAF804B0; Thu,  6 Mar 2025 06:35:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D0CF80152
	for <alsa-devel@alsa-project.org>; Thu,  6 Mar 2025 06:35:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D0CF80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1741239352142091513-webhooks-bot@alsa-project.org>
References: <1741239352142091513-webhooks-bot@alsa-project.org>
Subject: regresion: snd_hdsp
Message-Id: <20250306053554.B34AAF804B0@alsa1.perex.cz>
Date: Thu,  6 Mar 2025 06:35:54 +0100 (CET)
Message-ID-Hash: 5GU22ZGWI3HKZH62SJIOUIVT5ZV7PCYK
X-Message-ID-Hash: 5GU22ZGWI3HKZH62SJIOUIVT5ZV7PCYK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GU22ZGWI3HKZH62SJIOUIVT5ZV7PCYK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-firmware issue #11 was edited from juanpc2018:

![Image](https://github.com/user-attachments/assets/e57192a7-ad1c-44f9-b51d-7806efed9a32)

```
$ pulseaudio
W: [pulseaudio] module.c: module-combine is deprecated: Please use module-combine-sink instead of module-combine!
W: [pulseaudio] module-combine.c: We will now load module-combine-sink. Please make sure to remove module-combine from your configuration.
E: [alsa-sink-RME Hammerfall HDSP 9632] alsa-sink.c: ALSA woke us up to write new data to the device, but there was actually nothing to write.
E: [alsa-sink-RME Hammerfall HDSP 9632] alsa-sink.c: Most likely this is a bug in the ALSA driver 'snd_hdsp'. Please report this issue to the ALSA developers.
E: [alsa-sink-RME Hammerfall HDSP 9632] alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.

```

when i play any video or sound file,
most of the time PulseAudio takes between 7 to 15 seconds to fill the buffer in proper order,
audio is played in wrong order, chopped, like [stutter](https://www.youtube.com/watch?v=9ZaDn5wne8Y&t=609s).[2](https://www.youtube.com/watch?v=oeSa9SyVd94&t=9s)

i have tested /etc/pulse/deamon.conf
s24le to s24be
problem persists.

forced sample rate to 48Khz,
APIC ACPI Tables v2 & v3 in Bios,

Audacity 3.6. ALSA hw:0 also Crash.
but Jack Audio works ok.

i remember hdsp9632 worked ok on U/Kubuntu 10.04 & 10.10
Now 20.04.4 LTS has problems.

im using Liquorix 6.3 Kernel.

```
$ sudo apt show alsa-firmware*
Package: alsa-firmware-loaders
Version: 1.1.7-1ubuntu1
Priority: extra
Section: multiverse/sound
Source: alsa-tools
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian ALSA Maintainers <pkg-alsa-devel@lists.alioth.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 211 kB
Depends: fxload, udev, libasound2 (>= 1.0.24.1), libc6 (>= 2.4)
Homepage: https://www.alsa-project.org/
Download-Size: 25,0 kB
APT-Manual-Installed: yes
APT-Sources: http://archive.ubuntu.com/ubuntu focal/multiverse amd64 Packages
Description: ALSA software loaders for specific hardware


$ sudo apt show alsa-tools-gui
Package: alsa-tools-gui
Version: 1.1.7-1ubuntu1
Priority: extra
Section: universe/sound
Source: alsa-tools
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian ALSA Maintainers <pkg-alsa-devel@lists.alioth.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 1.002 kB
Depends: libasound2 (>= 1.0.24.1), libc6 (>= 2.29), libfltk1.1 (>= 1.1.6), libglib2.0-0 (>= 2.35.9), libgtk-3-0 (>= 3.0.0), libgtk2.0-0 (>= 2.8.0), libstdc++6 (>= 5.2)
Homepage: https://www.alsa-project.org/
Task: ubuntustudio-audio
Download-Size: 220 kB
APT-Manual-Installed: yes
APT-Sources: http://archive.ubuntu.com/ubuntu focal/universe amd64 Packages
Description: GUI based ALSA utilities for specific hardware

```

Issue URL     : https://github.com/alsa-project/alsa-firmware/issues/11
Repository URL: https://github.com/alsa-project/alsa-firmware
