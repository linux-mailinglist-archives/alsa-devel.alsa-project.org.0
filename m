Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D01073A1750
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 16:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01D6516C0;
	Wed,  9 Jun 2021 16:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01D6516C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623249217;
	bh=c9vGHi/H+57cUjjy/h4RKvNm+xKvEDIH70mwj7a2ZyY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q0GQpuwAUT5+xPdn6gDoE/EVRby2WSb58Pttex/xXaNJmIBtdqAWie2NxQ9c2/Z7s
	 i1o4p87DWErTBhSefXMdZaBwRi+5nDeGxc3iLnzSRZUrxJflyHGiBF2f/ZdjnI6RuV
	 KsLmYYIBFQDDCvCEFzmhlss5SQ9dqK6hYiCTQlZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6286DF8027C;
	Wed,  9 Jun 2021 16:32:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E833F802DF; Wed,  9 Jun 2021 16:32:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89195F800F4
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 16:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89195F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="t0/KY5aO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MC3YEviJ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D1DBA2715;
 Wed,  9 Jun 2021 10:31:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 09 Jun 2021 10:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=0GPn95wktpc3A
 mc0klL7znKGoMSyTwJspsqmd1c8iSU=; b=t0/KY5aO08LVh0FBrdjbPHuCEMw38
 itDfHboRWbUFkPbGOo6LRWdwdf9uFa6wbyrcRNSk7/FAi+PofeiqYrqUbjBTj2So
 6TgQEvuYbk2CBtwSlyk2y8Qi/Xc9aEH73sx1yv7gqbYat8WERnBq+/BiM0C0QaGZ
 303vuOP2a22SXnQI1gSmRkCVbFdM7pMvOscYQQxFSyyS9GB3r+fYYZyiGi4dKmZL
 K2ZYLOMVDAFznY8R7i/3C+ccdPZVybUtqD0zAyQt+fzOM8Qbgb3lZ6zv308N+yTh
 XMYyQkKHp4tbqvElkOYNBbe0Q/kAyUOzV78iSeBnjpvhFOF9JuK3sc7sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=0GPn95wktpc3Amc0klL7znKGoMSyTwJspsqmd1c8iSU=; b=MC3YEviJ
 XRzV2vzIvIYZ+EzdWPRBNgCg6b6HjxQgbKT5VCWj3Bz6lJXJhHBcpd3s7ZyCg/q4
 lg69lYXdHMf7F45nRunQB3Psr158CfJNSnJ/o4xBkQ+YyXJscu7W2vUN2pZXz00/
 FZL3cnUil8lA7svjEmctZZYQHi6fGRpUpaDhjDuuf2M4riN2xLQOfjzy4KgbSXtY
 NAdpuUm9jkWARnejQN1IomNOnZiSVS+HCSAl70WUwy43YGcK0p9pM2zRbjBpRAfI
 RC27Ze74OxGQEInoyTTLd044lyLT/0Ik3Sv6jdrvXSYrJITVM/n02u3Xx9g5etzL
 LnaZUI3SeoNDMg==
X-ME-Sender: <xms:2NDAYARkstN3VJCqRBBvRtbOowBDFyEkz8JfnJpKgobWmDowyqjF4Q>
 <xme:2NDAYNxJdlxJDbVVK7SyVLPmP6KIsjdABscf6JwVsUavkoqktZ7F9SDZ9OFeNregV
 ANW2ORKp1RBzBDLWXI>
X-ME-Received: <xmr:2NDAYN1y6XovAHUA9iLNjfD2MyuG5fA8ff3OGNdP8QyzaKHdtOtMH4fjm7_kNwX3iY6nZulf-FnQbHO-LurKIlQ-8vlhnaxqjYFf6cLmutx96DZeizSW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:2NDAYEDiN-FhFL-zcMw7_dZhdH9e0fdVrGiReSjdw-LSMsSW0yXevg>
 <xmx:2NDAYJiZVGkDYNBtjDfxYbzNirgipUG3nzvGtY_3RwUMg5dGWIueLg>
 <xmx:2NDAYAqSCsTswDCRT5Ybu3IHOEhFAqo33GASs8mkkb9fvpzA5OuIog>
 <xmx:2dDAYJb1UExBpMMq8kejdZSyFlx1LQUSgy0nMp2r2TutitbKd5moZA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 10:31:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 1/3] ALSA: pcm: add snd_pcm_period_elapsed() variant
 without acquiring lock of PCM substream
Date: Wed,  9 Jun 2021 23:31:43 +0900
Message-Id: <20210609143145.146680-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210609143145.146680-1-o-takashi@sakamocchi.jp>
References: <20210609143145.146680-1-o-takashi@sakamocchi.jp>
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
snd_pcm_period_elapsed(), for drivers to awaken user processes from waiting
for available frames. The function voluntarily acquires lock of PCM
substream, therefore it is not called in process context for any PCM
operation since the lock is already acquired.

It is convenient for packet-oriented driver, at least for drivers to audio
and music unit in IEEE 1394 bus. The drivers are allowed by Linux
FireWire subsystem to process isochronous packets queued till recent
isochronous cycle in process context in any time.

This commit adds snd_pcm_period_elapsed() variant,
snd_pcm_period_elapsed_without_lock(), for drivers to call in the
process context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/sound/pcm.h  |  1 +
 sound/core/pcm_lib.c | 71 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 57 insertions(+), 15 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2e1200d17d0c..bae90696cd06 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1066,6 +1066,7 @@ void snd_pcm_set_ops(struct snd_pcm * pcm, int direction,
 void snd_pcm_set_sync(struct snd_pcm_substream *substream);
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
+void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index b7e3d8f44511..3488ec1e3674 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1778,27 +1778,41 @@ int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 EXPORT_SYMBOL(snd_pcm_lib_ioctl);
 
 /**
- * snd_pcm_period_elapsed - update the pcm status for the next period
- * @substream: the pcm substream instance
+ * snd_pcm_period_elapsed_under_stream_lock() - update the status of runtime for the next period
+ *						under acquired lock of PCM substream.
+ * @substream: the instance of pcm substream.
+ *
+ * This function is called when the batch of audio data frames as the same size as the period of
+ * buffer is already processed in audio data transmission.
+ *
+ * The call of function updates the status of runtime with the latest position of audio data
+ * transmission, checks overrun and underrun over buffer, awaken user processes from waiting for
+ * available audio data frames, sampling audio timestamp, and performs stop or drain the PCM
+ * substream according to configured threshold.
+ *
+ * The function is intended to use for the case that PCM driver operates audio data frames under
+ * acquired lock of PCM substream; e.g. in callback of any operation of &snd_pcm_ops in process
+ * context. In any interrupt context, it's preferrable to use ``snd_pcm_period_elapsed()`` instead
+ * since lock of PCM substream should be acquired in advance.
  *
- * This function is called from the interrupt handler when the
- * PCM has processed the period size.  It will update the current
- * pointer, wake up sleepers, etc.
+ * Developer should pay enough attention that some callbacks in &snd_pcm_ops are done by the call of
+ * function:
  *
- * Even if more than one periods have elapsed since the last call, you
- * have to call this only once.
+ * - .pointer - to retrieve current position of audio data transmission by frame count or XRUN state.
+ * - .trigger - with SNDRV_PCM_TRIGGER_STOP at XRUN or DRAINING state.
+ * - .get_time_info - to retrieve audio time stamp if needed.
+ *
+ * Even if more than one periods have elapsed since the last call, you have to call this only once.
+ *
+ * Context: Any context in which lock of PCM substream is already acquired. This function may not
+ * sleep.
  */
-void snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
+void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime;
-	unsigned long flags;
-
-	if (snd_BUG_ON(!substream))
-		return;
 
-	snd_pcm_stream_lock_irqsave(substream, flags);
 	if (PCM_RUNTIME_CHECK(substream))
-		goto _unlock;
+		return;
 	runtime = substream->runtime;
 
 	if (!snd_pcm_running(substream) ||
@@ -1811,7 +1825,34 @@ void snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
 #endif
  _end:
 	kill_fasync(&runtime->fasync, SIGIO, POLL_IN);
- _unlock:
+}
+EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
+
+/**
+ * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
+ *			      PCM substream.
+ * @substream: the instance of PCM substream.
+ *
+ * This function is mostly similar to ``snd_pcm_period_elapsed_under_stream_lock()`` except for
+ * acquiring lock of PCM substream voluntarily.
+ *
+ * It's typically called by any type of IRQ handler when hardware IRQ occurs to notify event that
+ * the batch of audio data frames as the same size as the period of buffer is already processed in
+ * audio data transmission.
+ *
+ * Context: Any context in which lock of PCM substream is not acquired yet. It depends on
+ * configuration of PCM device (@snd_pcm.nonatomic) by each driver whether this function may or
+ * may not sleep due to internal call of ``snd_pcm_stream_lock_irqsave()``.
+ */
+void snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
+{
+	unsigned long flags;
+
+	if (snd_BUG_ON(!substream))
+		return;
+
+	snd_pcm_stream_lock_irqsave(substream, flags);
+	snd_pcm_period_elapsed_under_stream_lock(substream);
 	snd_pcm_stream_unlock_irqrestore(substream, flags);
 }
 EXPORT_SYMBOL(snd_pcm_period_elapsed);
-- 
2.27.0

