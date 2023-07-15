Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFBD754A04
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jul 2023 18:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3626E0F;
	Sat, 15 Jul 2023 18:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3626E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689437388;
	bh=EM+bPJEmj6Qzvn9k7d+4rNhZ7bf3Wz0F4TlztPF23kI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aTRibiN5yuOydW/oymAjssIe/v45qzUWcwA9aTW1DFuPU1AcRZhL93sv0EVYSb2//
	 CKi6SUgC/s0nneYVzbTDXCHqvc71esyhDiadPKgamYXFgEnM0AuDUQ48JhOfIoIGvY
	 mfnz+bHmvD5mX841yp05ZPC9VFS3cPyxxPgZbzZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE28EF80570; Sat, 15 Jul 2023 18:08:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C745F8024E;
	Sat, 15 Jul 2023 18:08:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7336FF8024E; Sat, 15 Jul 2023 18:08:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0755BF8053B
	for <alsa-devel@alsa-project.org>; Sat, 15 Jul 2023 18:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0755BF8053B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 2E47D23EE2;
	Sat, 15 Jul 2023 12:08:40 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qKhp1-N40-00; Sat, 15 Jul 2023 18:08:39 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/2] ALSA: emu10k1: clean up driver status comments
Date: Sat, 15 Jul 2023 18:08:38 +0200
Message-Id: <20230715160839.326978-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C7ANYSYMORQSTRCVLQD3PU3X6PRN7MDU
X-Message-ID-Hash: C7ANYSYMORQSTRCVLQD3PU3X6PRN7MDU
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7ANYSYMORQSTRCVLQD3PU3X6PRN7MDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Empty BUGS and TODO sections don't really help anyone, so remove them.

Version information is chronically outdated, and not really useful in a
git world anyway, so remove it as well.

Also remove duplicated (and outdated, of course) status section from
p16v.h (the one in p16v.c is in better shape).

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c |  6 ----
 sound/pci/emu10k1/emufx.c        |  6 ----
 sound/pci/emu10k1/emumixer.c     |  6 ----
 sound/pci/emu10k1/emupcm.c       |  6 ----
 sound/pci/emu10k1/emuproc.c      |  6 ----
 sound/pci/emu10k1/io.c           |  6 ----
 sound/pci/emu10k1/irq.c          |  6 ----
 sound/pci/emu10k1/p16v.h         | 56 --------------------------------
 sound/pci/emu10k1/p17v.h         |  1 -
 sound/pci/emu10k1/timer.c        |  6 ----
 sound/pci/emu10k1/tina2.h        |  1 -
 sound/pci/emu10k1/voice.c        |  6 ----
 12 files changed, 112 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index a11fcba4b9af..529d0bba87da 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -8,12 +8,6 @@
  *      Added support for Audigy 2 Value.
  *  	Added EMU 1010 support.
  *  	General bug fixes and enhancements.
- *
- *  BUGS:
- *    --
- *
- *  TODO:
- *    --
  */
 
 #include <linux/sched.h>
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 9904bcfee106..e0ad339c5bbf 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -6,12 +6,6 @@
  *
  *  Copyright (c) by James Courtier-Dutton <James@superbug.co.uk>
  *  	Added EMU 1010 support.
- *
- *  BUGS:
- *    --
- *
- *  TODO:
- *    --
  */
 
 #include <linux/pci.h>
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 9a94f08f2463..6ff59c44da36 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -8,12 +8,6 @@
  *
  *  Copyright (c) by James Courtier-Dutton <James@superbug.co.uk>
  *  	Added EMU 1010 support.
- *
- *  BUGS:
- *    --
- *
- *  TODO:
- *    --
  */
 
 #include <linux/time.h>
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 8b3d1b35d6e7..7a1d448f0656 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -4,12 +4,6 @@
  *                   Creative Labs, Inc.
  *  Routines for control of EMU10K1 chips / PCM routines
  *  Multichannel PCM support Copyright (c) Lee Revell <rlrevell@joe-job.com>
- *
- *  BUGS:
- *    --
- *
- *  TODO:
- *    --
  */
 
 #include <linux/pci.h>
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 5533277e4d47..39b422297c70 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -6,12 +6,6 @@
  *
  *  Copyright (c) by James Courtier-Dutton <James@superbug.co.uk>
  *  	Added EMU 1010 support.
- *
- *  BUGS:
- *    --
- *
- *  TODO:
- *    --
  */
 
 #include <linux/slab.h>
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index c695cb863e5e..7e4483c5bd2a 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -3,12 +3,6 @@
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
  *                   Creative Labs, Inc.
  *  Routines for control of EMU10K1 chips
- *
- *  BUGS:
- *    --
- *
- *  TODO:
- *    --
  */
 
 #include <linux/time.h>
diff --git a/sound/pci/emu10k1/irq.c b/sound/pci/emu10k1/irq.c
index 8573248dd799..71aa90b9cc88 100644
--- a/sound/pci/emu10k1/irq.c
+++ b/sound/pci/emu10k1/irq.c
@@ -3,12 +3,6 @@
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
  *                   Creative Labs, Inc.
  *  Routines for IRQ control of EMU10K1 chips
- *
- *  BUGS:
- *    --
- *
- *  TODO:
- *    --
  */
 
 #include <linux/time.h>
diff --git a/sound/pci/emu10k1/p16v.h b/sound/pci/emu10k1/p16v.h
index 9d429ad1feff..95ab8071751b 100644
--- a/sound/pci/emu10k1/p16v.h
+++ b/sound/pci/emu10k1/p16v.h
@@ -2,62 +2,6 @@
 /*
  *  Copyright (c) by James Courtier-Dutton <James@superbug.demon.co.uk>
  *  Driver p16v chips
- *  Version: 0.21
- *
- *  FEATURES currently supported:
- *    Output fixed at S32_LE, 2 channel to hw:0,0
- *    Rates: 44.1, 48, 96, 192.
- *
- *  Changelog:
- *  0.8
- *    Use separate card based buffer for periods table.
- *  0.9
- *    Use 2 channel output streams instead of 8 channel.
- *       (8 channel output streams might be good for ASIO type output)
- *    Corrected speaker output, so Front -> Front etc.
- *  0.10
- *    Fixed missed interrupts.
- *  0.11
- *    Add Sound card model number and names.
- *    Add Analog volume controls.
- *  0.12
- *    Corrected playback interrupts. Now interrupt per period, instead of half period.
- *  0.13
- *    Use single trigger for multichannel.
- *  0.14
- *    Mic capture now works at fixed: S32_LE, 96000Hz, Stereo.
- *  0.15
- *    Force buffer_size / period_size == INTEGER.
- *  0.16
- *    Update p16v.c to work with changed alsa api.
- *  0.17
- *    Update p16v.c to work with changed alsa api. Removed boot_devs.
- *  0.18
- *    Merging with snd-emu10k1 driver.
- *  0.19
- *    One stereo channel at 24bit now works.
- *  0.20
- *    Added better register defines.
- *  0.21
- *    Split from p16v.c
- *
- *  BUGS:
- *    Some stability problems when unloading the snd-p16v kernel module.
- *    --
- *
- *  TODO:
- *    SPDIF out.
- *    Find out how to change capture sample rates. E.g. To record SPDIF at 48000Hz.
- *    Currently capture fixed at 48000Hz.
- *
- *    --
- *  GENERAL INFO:
- *    Model: SB0240
- *    P16V Chip: CA0151-DBS
- *    Audigy 2 Chip: CA0102-IAT
- *    AC97 Codec: STAC 9721
- *    ADC: Philips 1361T (Stereo 24bit)
- *    DAC: CS4382-K (8-channel, 24bit, 192Khz)
  *
  *  This code was initially based on code from ALSA's emu10k1x.c which is:
  *  Copyright (c) by Francisco Moraes <fmoraes@nc.rr.com>
diff --git a/sound/pci/emu10k1/p17v.h b/sound/pci/emu10k1/p17v.h
index d4ada1c430c8..ee4f4ab4b79c 100644
--- a/sound/pci/emu10k1/p17v.h
+++ b/sound/pci/emu10k1/p17v.h
@@ -2,7 +2,6 @@
 /*
  *  Copyright (c) by James Courtier-Dutton <James@superbug.demon.co.uk>
  *  Driver p17v chips
- *  Version: 0.01
  */
 
 /******************************************************************************/
diff --git a/sound/pci/emu10k1/timer.c b/sound/pci/emu10k1/timer.c
index f3c78adf3248..8798604e7f98 100644
--- a/sound/pci/emu10k1/timer.c
+++ b/sound/pci/emu10k1/timer.c
@@ -3,12 +3,6 @@
  *  Copyright (c) by Lee Revell <rlrevell@joe-job.com>
  *                   Clemens Ladisch <clemens@ladisch.de>
  *  Routines for control of EMU10K1 chips
- *
- *  BUGS:
- *    --
- *
- *  TODO:
- *    --
  */
 
 #include <linux/time.h>
diff --git a/sound/pci/emu10k1/tina2.h b/sound/pci/emu10k1/tina2.h
index 7fd235345292..e3fcb290271c 100644
--- a/sound/pci/emu10k1/tina2.h
+++ b/sound/pci/emu10k1/tina2.h
@@ -2,7 +2,6 @@
 /*
  *  Copyright (c) by James Courtier-Dutton <James@superbug.demon.co.uk>
  *  Driver tina2 chips
- *  Version: 0.1
  */
 
 /********************************************************************************************************/
diff --git a/sound/pci/emu10k1/voice.c b/sound/pci/emu10k1/voice.c
index 6939498e26f0..ffe87f359a0e 100644
--- a/sound/pci/emu10k1/voice.c
+++ b/sound/pci/emu10k1/voice.c
@@ -6,12 +6,6 @@
  *  Routines for control of EMU10K1 chips - voice manager
  *
  *  Rewrote voice allocator for multichannel support - rlrevell 12/2004
- * 
- *  BUGS:
- *    --
- *
- *  TODO:
- *    --
  */
 
 #include <linux/time.h>
-- 
2.40.0.152.g15d061e6df

