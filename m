Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13943754A03
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jul 2023 18:09:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04739AEA;
	Sat, 15 Jul 2023 18:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04739AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689437380;
	bh=tBz1lNoB9z5HQpFPnVyMryRPhYjZK+znx9YZIiibd2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VCbx4YiKOCww695Gi/AwQGsBZcCZNIou4S0/2A/K6vOW2XxIQ6mBajR92V/9QEMX8
	 y77XNthfTGdzCmaPtnki+5zVP/lvapJ9xTuN7SOKzzvZduMkfp9dpgZmrndSPjaVu7
	 yjynivzouByl6I8OxGfZbH7QNSUdFqoPLQa5C5gQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58F34F80564; Sat, 15 Jul 2023 18:08:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA4E7F80548;
	Sat, 15 Jul 2023 18:08:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C43BF80551; Sat, 15 Jul 2023 18:08:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86830F8047D
	for <alsa-devel@alsa-project.org>; Sat, 15 Jul 2023 18:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86830F8047D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 30EC62408D;
	Sat, 15 Jul 2023 12:08:40 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qKhp1-N46-00; Sat, 15 Jul 2023 18:08:39 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/2] ALSA: emu10k1: rework copyright statements
Date: Sat, 15 Jul 2023 18:08:39 +0200
Message-Id: <20230715160839.326978-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230715160839.326978-1-oswald.buddenhagen@gmx.de>
References: <20230715160839.326978-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LCFJ3XP7OD5HJGEGFVHQTEAXGWWR3QHJ
X-Message-ID-Hash: LCFJ3XP7OD5HJGEGFVHQTEAXGWWR3QHJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCFJ3XP7OD5HJGEGFVHQTEAXGWWR3QHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- Remove the "log-like" parts, following the same logic as the previous
  commit
- Unify format
- Add missing major contributors, including myself
- Sort entries in order of first contribution (Creative comes last for
  optical reasons; they don't appear to have directly contributed
  anyway)

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1.c      | 4 +---
 sound/pci/emu10k1/emu10k1_main.c | 8 +++-----
 sound/pci/emu10k1/emufx.c        | 6 +++---
 sound/pci/emu10k1/emumixer.c     | 8 ++++----
 sound/pci/emu10k1/emupcm.c       | 5 ++++-
 sound/pci/emu10k1/emuproc.c      | 7 ++++---
 sound/pci/emu10k1/io.c           | 4 ++++
 sound/pci/emu10k1/timer.c        | 2 ++
 sound/pci/emu10k1/voice.c        | 6 +++---
 9 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index 1a13c086e86c..ba8e5534e2df 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -2,9 +2,7 @@
 /*
  *  The driver for the EMU10K1 (SB Live!) based soundcards
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
- *
- *  Copyright (c) by James Courtier-Dutton <James@superbug.demon.co.uk>
- *      Added support for Audigy 2 Value.
+ *                   James Courtier-Dutton <James@superbug.co.uk>
  */
 
 #include <linux/init.h>
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 529d0bba87da..d3a37d805fb2 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1,13 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
+ *                   James Courtier-Dutton <James@superbug.co.uk>
+ *                   Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  *                   Creative Labs, Inc.
- *  Routines for control of EMU10K1 chips
  *
- *  Copyright (c) by James Courtier-Dutton <James@superbug.co.uk>
- *      Added support for Audigy 2 Value.
- *  	Added EMU 1010 support.
- *  	General bug fixes and enhancements.
+ *  Routines for control of EMU10K1 chips
  */
 
 #include <linux/sched.h>
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index e0ad339c5bbf..347141635604 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
+ *                   James Courtier-Dutton <James@superbug.co.uk>
+ *                   Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  *                   Creative Labs, Inc.
- *  Routines for effect processor FX8010
  *
- *  Copyright (c) by James Courtier-Dutton <James@superbug.co.uk>
- *  	Added EMU 1010 support.
+ *  Routines for effect processor FX8010
  */
 
 #include <linux/pci.h>
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 6ff59c44da36..cb2b4e5553e7 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -2,12 +2,12 @@
 /*
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>,
  *                   Takashi Iwai <tiwai@suse.de>
+ *                   Lee Revell <rlrevell@joe-job.com>
+ *                   James Courtier-Dutton <James@superbug.co.uk>
+ *                   Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  *                   Creative Labs, Inc.
- *  Routines for control of EMU10K1 chips / mixer routines
- *  Multichannel PCM support Copyright (c) Lee Revell <rlrevell@joe-job.com>
  *
- *  Copyright (c) by James Courtier-Dutton <James@superbug.co.uk>
- *  	Added EMU 1010 support.
+ *  Routines for control of EMU10K1 chips / mixer routines
  */
 
 #include <linux/time.h>
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 7a1d448f0656..7f4c1b38d6ec 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
+ *                   Lee Revell <rlrevell@joe-job.com>
+ *                   James Courtier-Dutton <James@superbug.co.uk>
+ *                   Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  *                   Creative Labs, Inc.
+ *
  *  Routines for control of EMU10K1 chips / PCM routines
- *  Multichannel PCM support Copyright (c) Lee Revell <rlrevell@joe-job.com>
  */
 
 #include <linux/pci.h>
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 39b422297c70..2f80fd91017c 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
+ *                   Lee Revell <rlrevell@joe-job.com>
+ *                   James Courtier-Dutton <James@superbug.co.uk>
+ *                   Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  *                   Creative Labs, Inc.
- *  Routines for control of EMU10K1 chips / proc interface routines
  *
- *  Copyright (c) by James Courtier-Dutton <James@superbug.co.uk>
- *  	Added EMU 1010 support.
+ *  Routines for control of EMU10K1 chips / proc interface routines
  */
 
 #include <linux/slab.h>
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index 7e4483c5bd2a..74df2330015f 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -1,7 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
+ *                   Lee Revell <rlrevell@joe-job.com>
+ *                   James Courtier-Dutton <James@superbug.co.uk>
+ *                   Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  *                   Creative Labs, Inc.
+ *
  *  Routines for control of EMU10K1 chips
  */
 
diff --git a/sound/pci/emu10k1/timer.c b/sound/pci/emu10k1/timer.c
index 8798604e7f98..bb2478319361 100644
--- a/sound/pci/emu10k1/timer.c
+++ b/sound/pci/emu10k1/timer.c
@@ -2,6 +2,8 @@
 /*
  *  Copyright (c) by Lee Revell <rlrevell@joe-job.com>
  *                   Clemens Ladisch <clemens@ladisch.de>
+ *                   Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
+ *
  *  Routines for control of EMU10K1 chips
  */
 
diff --git a/sound/pci/emu10k1/voice.c b/sound/pci/emu10k1/voice.c
index ffe87f359a0e..77fb5427aaed 100644
--- a/sound/pci/emu10k1/voice.c
+++ b/sound/pci/emu10k1/voice.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
- *                   Creative Labs, Inc.
  *                   Lee Revell <rlrevell@joe-job.com>
- *  Routines for control of EMU10K1 chips - voice manager
+ *                   Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
+ *                   Creative Labs, Inc.
  *
- *  Rewrote voice allocator for multichannel support - rlrevell 12/2004
+ *  Routines for control of EMU10K1 chips - voice manager
  */
 
 #include <linux/time.h>
-- 
2.40.0.152.g15d061e6df

