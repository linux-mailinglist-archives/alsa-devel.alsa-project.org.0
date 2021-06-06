Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7393439CE64
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 11:21:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 006701713;
	Sun,  6 Jun 2021 11:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 006701713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622971287;
	bh=TXFh93KM8BIjnzQ3YP92bA9BGe/4PKC1Uz5OF4s/zK8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IQXLS8p38kgHf9H6fAnyFVNhdiReiexZBqhGhMxOZ8r6EdcTULUC25pABkO1V/cZ9
	 9TYQ2021NeplX+LNjMs2D7uBXDvl5ZdBqoV5J7je4gZ/9gH+612b3R36o0dwYfcZ16
	 /ENdcbUOpeCpWpW3ehjXqq0eOz/qkVniGyz5DJno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F512F804CB;
	Sun,  6 Jun 2021 11:19:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1664CF804CA; Sun,  6 Jun 2021 11:18:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66F61F8019B
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 11:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66F61F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="n+Msfr1w"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="esYZjDMS"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C0BD95C01AC;
 Sun,  6 Jun 2021 05:18:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 06 Jun 2021 05:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=HygvQ/JDpRWBo
 3NYkfmt7Lt2hI1kyT5Aqf9aT3VLIiA=; b=n+Msfr1w1ZOATj0OM4ttVLW5fsgrI
 D5tcFVoBpOq9OTOkRKJNqbspuI0Fb25gZEg3Bx3VoftsHpwEDNYW5bqiBnPTgjAj
 Jj2YTTxvVI/bSwg0ENekdUMLwru4ch+XdBtFvWyhOQOOD2o92SvKtcsT+jJwJ3SD
 Ym78q5odU0JpjyVDUbzcJ9s8c1jnpVZN/vrJSdT4kx0BsMVFivBozogRhgb/6oV6
 NGmTE+/0+OQofJehyxkF7TMBN4ly2UZuqPgwreVTfh9R7Q2eWZo2u94tMNARq/Qs
 akpJk3AaOzdi+gOryXKj9iKC7NKoNQj1ZtzYGaIDmP5bZtTxQMG40IFCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=HygvQ/JDpRWBo3NYkfmt7Lt2hI1kyT5Aqf9aT3VLIiA=; b=esYZjDMS
 BfFGVyKZQSGyCZsm1zpttgz2GrDN0Ts49aEFN5PFb5B65oz6oCLqvJUBsBxAMbMl
 hgJg0o4YSokV1ZC7UfIPIU4BceGBSXRFwYiJT4dBxuppokjN1OMk+ZgkjHRt0vq3
 5O3HJHB3n4eLGhSM3cyMWPTt6KFBdH50+uCa+imIChPk94vhf+nTMBfHCLmOp3qL
 4WZpuZ/H5G5RnzZ9kfZbyXVz8VPxIMHKI19qfx/rcUxGn0WxCkIg55jmwijAZEaT
 Li9H9kbhKk9aC58hGLVSzR0HQl45lb/dmKmsdyMOyelKZvTN/21do4b2EFcho6g9
 J7D91KKPWhoX7Q==
X-ME-Sender: <xms:9pK8YDKFsu7Mijp1ubc2wYzY0hQ8USK5q0C3GcPjWSnJuSTuvgB7rQ>
 <xme:9pK8YHK-u3OsUpncP4dEOdL9BVbrmUW1IEhUBXJ8qfH3bGBbeppz1aJLM23wrrwSO
 uT_K-QRfvwPrYXq0x0>
X-ME-Received: <xmr:9pK8YLvaglizr578lxRzRTWziTT7-Fkbdiwz0cxzohgeygq7oTsUvFqU0f1PR6X7RAY4aPQ6_gkysDWZDSsl5RGsUsYpPUp6Gu4INd62SuLI6qwoNUva>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedthedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:9pK8YMaPglNf4ZaPhHbvG7wNdSO4jcEambrmCxCSh1SBgysavuD0Jg>
 <xmx:9pK8YKbfjlbm-xp9T89ncDhdAOCXP3teRou4S-ObUiuumyTXLoc4tQ>
 <xmx:9pK8YAD6stkDPMcCnv3eC0cfykgXhE4SKyEtzid_9k2EdLBdHU_2Bg>
 <xmx:9pK8YNyNFbhsWL4dgwsiFbDXin6D9mgvi3eEXGrrzLb7b4gbwNNIsw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jun 2021 05:18:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [RFC][PATCH 1/3] ALSA: pcm: add snd_pcm_period_elapsed() variant
 without acquiring lock of PCM substream
Date: Sun,  6 Jun 2021 18:18:36 +0900
Message-Id: <20210606091838.80812-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210606091838.80812-1-o-takashi@sakamocchi.jp>
References: <20210606091838.80812-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Current implementation of ALSA PCM core has a kernel API,
snd_pcm_period_elapsed(), for drivers to queue event to awaken processes
from waiting for available frames. The function voluntarily acquires lock
of PCM substream, therefore it is not called in process context for any
PCM operation since the lock is already acquired.

It is convenient for packet-oriented driver, at least for drivers to audio
and music unit in IEEE 1394 bus. The drivers are allowed by Linux
FireWire subsystem to process isochronous packets queued till recent
isochronous cycle in process context in any time.

This commit adds snd_pcm_period_elapsed() variant,
snd_pcm_period_elapsed_without_lock(), for drivers to queue the event in
the process context.
---
 include/sound/pcm.h  | 53 +++++++++++++++++++++++++++++++++++++++++++-
 sound/core/pcm_lib.c | 25 ++++-----------------
 2 files changed, 56 insertions(+), 22 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2e1200d17d0c..a4eaa48584da 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -11,6 +11,7 @@
 #include <sound/asound.h>
 #include <sound/memalloc.h>
 #include <sound/minors.h>
+#include <sound/core.h>
 #include <linux/poll.h>
 #include <linux/mm.h>
 #include <linux/bitops.h>
@@ -1066,7 +1067,57 @@ void snd_pcm_set_ops(struct snd_pcm * pcm, int direction,
 void snd_pcm_set_sync(struct snd_pcm_substream *substream);
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
-void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
+
+void __snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
+
+/**
+ * snd_pcm_period_elapsed - update the pcm status for the next period
+ * @substream: the pcm substream instance
+ *
+ * This function is called when the batch of PCM frames as the same as period of PCM buffer are
+ * processed in audio data transmission. It's typically called by any type of IRQ handler when
+ * hardware IRQ occurs to notify the event. It acquires lock of PCM substream, then will update the
+ * current pointer, wake up sleepers, etc.
+ *
+ * Developer should pay enough attention that some callbacks in &snd_pcm_ops are done by the call of
+ * function:
+ *
+ * - .pointer - to retrieve current position of audio data transmission by frame count or XRUN state.
+ * - .trigger - with SNDRV_PCM_TRIGGER_STOP at XRUN or DRAINING state.
+ * - .get_time_info - to retrieve audio time stamp.
+ *
+ * Even if more than one periods have elapsed since the last call, you have to call this only once.
+ */
+static inline void snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
+{
+	unsigned long flags;
+
+	if (snd_BUG_ON(!substream))
+		return;
+
+	snd_pcm_stream_lock_irqsave(substream, flags);
+	__snd_pcm_period_elapsed(substream);
+	snd_pcm_stream_unlock_irqrestore(substream, flags);
+}
+
+/**
+ * snd_pcm_period_elapsed_without_lock() - update the pcm status for the next period without
+ *					   acquiring lock of PCM substream.
+ * @substream: the pcm substream instance
+ *
+ * This function is variant of ``snd_pcm_period_elapsed()`` without voluntarily acquiring lock of
+ * PCM substream. It's intended to use for the case that PCM driver operates PCM frames under
+ * acquiring lock of PCM substream; e.g. in callback of any operation of &snd_pcm_ops in process
+ * context, then queueing period wakeup event.
+ */
+static inline void snd_pcm_period_elapsed_without_lock(struct snd_pcm_substream *substream)
+{
+	if (snd_BUG_ON(!substream))
+		return;
+
+	__snd_pcm_period_elapsed(substream);
+}
+
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
 				     snd_pcm_uframes_t frames, bool in_kernel);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index b7e3d8f44511..33ad4ab0ec3a 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1777,28 +1777,13 @@ int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL(snd_pcm_lib_ioctl);
 
-/**
- * snd_pcm_period_elapsed - update the pcm status for the next period
- * @substream: the pcm substream instance
- *
- * This function is called from the interrupt handler when the
- * PCM has processed the period size.  It will update the current
- * pointer, wake up sleepers, etc.
- *
- * Even if more than one periods have elapsed since the last call, you
- * have to call this only once.
- */
-void snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
+// The pointer to PCM substream should not be NULL as precondition.
+void __snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime;
-	unsigned long flags;
 
-	if (snd_BUG_ON(!substream))
-		return;
-
-	snd_pcm_stream_lock_irqsave(substream, flags);
 	if (PCM_RUNTIME_CHECK(substream))
-		goto _unlock;
+		return;
 	runtime = substream->runtime;
 
 	if (!snd_pcm_running(substream) ||
@@ -1811,10 +1796,8 @@ void snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
 #endif
  _end:
 	kill_fasync(&runtime->fasync, SIGIO, POLL_IN);
- _unlock:
-	snd_pcm_stream_unlock_irqrestore(substream, flags);
 }
-EXPORT_SYMBOL(snd_pcm_period_elapsed);
+EXPORT_SYMBOL(__snd_pcm_period_elapsed);
 
 /*
  * Wait until avail_min data becomes available
-- 
2.27.0

