Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CED32C01CB
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 09:58:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B36A61670;
	Mon, 23 Nov 2020 09:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B36A61670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606121936;
	bh=+U1jgdADtbJmR8IfYmHI7auIxeItOEsWtTRnY/lZAY8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hFMYdJ7/9jiwSRr3RHmLCVTYtKwsHyIfJ2+G70bVug/0XrxX9fbsvdBnskaQJ7anP
	 8VYLl8O/N+Q23TO0eOMRfl10Xgubkq6OEBOnRNJMQUvdnLEan36avsnohZMYNp0bIq
	 74xsbshSvmKWZ052YRs0KXqp5qnFNtb7/X0F7jfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFEE5F804E3;
	Mon, 23 Nov 2020 09:54:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20963F8051E; Mon, 23 Nov 2020 09:54:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31153F8026A
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31153F8026A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8BD60AFAA;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/41] ALSA: usb-audio: Drop debug.h
Date: Mon, 23 Nov 2020 09:53:18 +0100
Message-Id: <20201123085347.19667-13-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

The file debug.h contains a simple macro for debug prints, and it's
used only in two places, the format parser and the hw_params rules.
The former actually should print a more informative message instead,
so the only users are the hw_parmas rules.

This patch moves the contents of debug.h into the hw_params rules
local code and remove the unneeded includes.  Also, the debug print in
the format parser is replaced with the information print with more
useful information, and the raw printk() call is replaced with
pr_debug().

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c   |  1 -
 sound/usb/debug.h  | 16 ----------------
 sound/usb/format.c |  5 +++--
 sound/usb/pcm.c    | 11 ++++++++++-
 4 files changed, 13 insertions(+), 20 deletions(-)
 delete mode 100644 sound/usb/debug.h

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 4457214a3ae6..096dd8e3c64b 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -49,7 +49,6 @@
 #include "quirks.h"
 #include "endpoint.h"
 #include "helper.h"
-#include "debug.h"
 #include "pcm.h"
 #include "format.h"
 #include "power.h"
diff --git a/sound/usb/debug.h b/sound/usb/debug.h
deleted file mode 100644
index 7dd983c35001..000000000000
--- a/sound/usb/debug.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __USBAUDIO_DEBUG_H
-#define __USBAUDIO_DEBUG_H
-
-/*
- * h/w constraints
- */
-
-#ifdef HW_CONST_DEBUG
-#define hwc_debug(fmt, args...) printk(KERN_DEBUG fmt, ##args)
-#else
-#define hwc_debug(fmt, args...) do { } while(0)
-#endif
-
-#endif /* __USBAUDIO_DEBUG_H */
-
diff --git a/sound/usb/format.c b/sound/usb/format.c
index 3348032daa16..7641716f0c6c 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -16,7 +16,6 @@
 #include "card.h"
 #include "quirks.h"
 #include "helper.h"
-#include "debug.h"
 #include "clock.h"
 #include "format.h"
 
@@ -227,7 +226,9 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 			fp->nr_rates++;
 		}
 		if (!fp->nr_rates) {
-			hwc_debug("All rates were zero. Skipping format!\n");
+			usb_audio_info(chip,
+				       "%u:%d: All rates were zero\n",
+				       fp->iface, fp->altsetting);
 			return -EINVAL;
 		}
 	} else {
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index ecc6bf9b42f0..d83a6a6ac023 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -17,7 +17,6 @@
 #include "usbaudio.h"
 #include "card.h"
 #include "quirks.h"
-#include "debug.h"
 #include "endpoint.h"
 #include "helper.h"
 #include "pcm.h"
@@ -1061,6 +1060,16 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	return ret;
 }
 
+/*
+ * h/w constraints
+ */
+
+#ifdef HW_CONST_DEBUG
+#define hwc_debug(fmt, args...) pr_debug(fmt, ##args)
+#else
+#define hwc_debug(fmt, args...) do { } while(0)
+#endif
+
 static const struct snd_pcm_hardware snd_usb_hardware =
 {
 	.info =			SNDRV_PCM_INFO_MMAP |
-- 
2.16.4

