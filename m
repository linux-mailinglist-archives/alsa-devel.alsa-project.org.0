Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40200294136
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 19:14:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5651E172C;
	Tue, 20 Oct 2020 19:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5651E172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603214097;
	bh=zIioBnAb+MSY5qoyx6ORH1yrwJ5lt+qZGnCovkBaHMc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KCyfO2h+ZrXGfH+omvZ2RkvW0pNUXHGNAFod5Wg2lWHfBsA1d78SaAupjRKZwvN45
	 biNcxcMfX6J6DuGD/GaSVLaGH/cnMZlgiMXPfnpFBbZFu6iHmsUnjoZKuY9QsPoMuZ
	 ygjkuuVdlFg0wO7jMeg+ZkdY5H2NJD4m27ludduk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98C7CF804AB;
	Tue, 20 Oct 2020 19:13:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97968F804AA; Tue, 20 Oct 2020 19:13:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 56C2AF8049F
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 19:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C2AF8049F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603213986151724100-webhooks-bot@alsa-project.org>
References: <1603213986151724100-webhooks-bot@alsa-project.org>
Subject: ALSA error on finding "working profile" for a USB MIDI device.
Message-Id: <20201020171314.97968F804AA@alsa1.perex.cz>
Date: Tue, 20 Oct 2020 19:13:14 +0200 (CEST)
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

alsa-project/alsa-lib issue #89 was edited from radiobla:

TL;DR: After upgrading alsa-* packages yesterday, on the next reboot, systemd (apparently, pulseaudio.service) begun to show an error message related to "module-alsa-card" not finding a "working profile" for a USB MIDI device I have connected. Despite the error message, the device is working fine (through "raw MIDI" and also with jack2). Anyway, I want go further and find the root cause of this problem, since it's very annoying to see the Sound Service failing on every reboot.

Here is my pacman.log from yesterday:

**[ALPM] upgraded alsa-topology-conf (1.2.3-1 -> 1.2.4-1)
[ALPM] upgraded alsa-ucm-conf (1.2.3-2 -> 1.2.4-1)
[ALPM] upgraded alsa-lib (1.2.3.2-1 -> 1.2.4-1)
[ALPM] upgraded alsa-utils (1.2.3-2 -> 1.2.4-1)
[ALPM] upgraded lib32-alsa-lib (1.2.3.2-1 -> 1.2.4-1)**

After a reboot, the Sound Service could start, but begun to show an error message.

Taking a look on the systemd logs with

journalctl -xe --user-unit pulseaudio

I found this:

systemd[1027]: Starting Sound Service...
...
**pulseaudio[1037]: Failed to find a working profile.
pulseaudio[1037]: Failed to load module "module-alsa-card" (argument: "device_id="3" name="usb-Roland_A->
pulseaudio[1037]: module-rescue-stream is obsolete and should no longer be loaded. Please remove it from>
systemd[1027]: Started Sound Service.**

I disabled the "load-module module-rescue-streams" on the default.pa, but the other issue persists. They seem not be related, IMO. I wanted to rule out that chance anyway.

By stopping pulseaudio service through systemd and running

pulseaudio -vvv

manually, I got more verbose information.

**E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="1" name="usb-Roland_A-Series_Keyboard-00" card_name="alsa_card.usb-Roland_A-Series_Keyboard-00" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.  
I: [pulseaudio] module-udev-detect.c: Card /devices/pci0000:00/0000:00:14.0/usb1/1-10/1-10:1.0/sound/card1 (alsa_card.usb-Roland_A-Series_Keyboard-00) failed to load module.**

Regarding specifically to the following error message...

**E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.**

What does it mean it is not finding a "working profile"? How could I investigate it further?

It worth mentioning that the device (an USB Keyboard Controller) is working
perfectly with jack2. I tested it with an "aseqdump".

$ aseqdump -l
 Port    Client name                      Port name
  0:0    System                           Timer
  0:1    System                           Announce
 14:0    Midi Through                     Midi Through Port-0
 20:0    A-Series Keyboard                A-Series Keyboard Keyboard

$ aseqdump -p20:0
Waiting for data. Press Ctrl+C to end.
Source  Event                  Ch  Data
 20:0   Note on                 0, note 41, velocity 76
 20:0   Note on                 0, note 40, velocity 82

Although the device is working even with the error message, it's very annoying to see a "failed service" on initialization.

Thanks!

More occurrences of this error were provided on Arch Linux [forum](https://bbs.archlinux.org/viewtopic.php?pid=1932801)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/89
Repository URL: https://github.com/alsa-project/alsa-lib
