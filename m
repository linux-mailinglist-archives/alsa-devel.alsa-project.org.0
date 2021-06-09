Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D999C3A08F9
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 03:24:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 700DC16CE;
	Wed,  9 Jun 2021 03:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 700DC16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623201893;
	bh=00x0CN41ahaYwxLs8M3SupV4QQ6UTSBeDrV3h99miyY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T+JiqJ/28HeWdNOhvaMfy9q7pBJD3iLnsniUM/HZT2kBzJIZlxCzfLYToIhi0kDQk
	 PXa5ibTthGk5OfBrv+ZUohratfoQFWwmizA6dw3JmhBLfJWXZI+9D1buItRrxqHZ0K
	 ivDGHaZ8HbAOL+tryCBtB92dGCd4dt4Er801cgS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64E21F804C3;
	Wed,  9 Jun 2021 03:23:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 881FEF80256; Wed,  9 Jun 2021 03:23:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 943CBF800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 03:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 943CBF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="NsO9sjL7"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="wkOBlw6Z"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 10F01731;
 Tue,  8 Jun 2021 21:22:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 08 Jun 2021 21:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=drUWGIv84SvOS
 UrGsi1C8/xe6FEjNTi4/cXmYoY+wYI=; b=NsO9sjL7KcItZPIhJV7nfWVJ74/8m
 L4ROgYd/IIZkH4mTVDlF4A6R6L4VxeqCTj9E2DMhHTzU8m2M5hq8L9jTggQDW4Lq
 6OYe/x9mz9lLSq1OuAEy/lgGuAfywevHX+JvOFRMd/sE9sULMSZlQQEYKosWTTlQ
 Lq7hMq3yVMwKa41WzWfwyQswukYkjrDn3wwF/ZQlr2dBz8wq4RX47/avVWIGubu4
 cvNqPDMIqgD00fu4PHhIrzT9knOOE7lOh2z56tyZ9IiH5ZySlCXrGNIZvTHUN7gO
 p+sTcSmGjLN2gkDjMu9/al68p3AQro+rhk9iZwo6NExTWl9zN1DYL2GjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=drUWGIv84SvOSUrGsi1C8/xe6FEjNTi4/cXmYoY+wYI=; b=wkOBlw6Z
 mHXQh3DZwm64id4qZuxCpE2vICENId4X9qqsOgu2rEk3/Aulm8mNGyAXzA0fLklE
 tpXKk3K00umAoPcZrlkpZ1mMu8wlcJLVrl/xVCDUyiJOZYRU5JYDA1X7dMpYm6ss
 8dDfihpZnWvrGCPC7w6Kh+UJi4XslkTMGwXs53SlHfI+R0BPIUqORjlClk8UONu8
 Rp+dbasg57Q1ZZo6qx0tnNHYVEmtAC4NwSKRNNDkcVq73KbcB2l04BlJYStEOeVy
 Ysi2OvZr60S+L0yuqd9t6IUcMsoayQsF/26ScMlG7X+uPlD9wb70AJhNPhS5Ioo9
 eKiu2Y6/HIQ7Vg==
X-ME-Sender: <xms:6xfAYLP2D7RA6ZDuyQ8JdcniP4M1WHjLjGt7QOh6nfBUgJ36bTpTxQ>
 <xme:6xfAYF_4avGq5voXeHO-t_bMGQbicHPqFZQmEOGnFEQoifkPLLDZgz6ZuExPvVfK3
 uguussK_myfR1TVuFI>
X-ME-Received: <xmr:6xfAYKRypTYT8NBMm5Tnd35C1BRfLe3cEROez2nWJvClm1Vk1xbxZQX_H8XufPqOfvdKP9OOBrc_QqOIUMgOQE-BEAq5IXAlukP7Pt2kFaFOyfouWkOV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:6xfAYPuThBWFIVtVaXfydsXlWLUWiIZ03qrZPH176MedEG15GKbEXg>
 <xmx:6xfAYDdIDph6K2N2yyH1oajXI9OIi4ZEOz4urtw6Bx20hgne9GSmeg>
 <xmx:6xfAYL3FkFjC4WaZ76-_kZx_y4IxXPs-2n5o9AOyA2R3mJftOEXWdg>
 <xmx:7BfAYLEDnoFm0ySK-MMjn16Io_C3fVDzItabcSF0CztvurwXkkhuKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 21:22:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/3] ALSA: pcm: add snd_pcm_period_elapsed() variant without
 acquiring lock of PCM substream
Date: Wed,  9 Jun 2021 10:22:42 +0900
Message-Id: <20210609012244.24296-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210609012244.24296-1-o-takashi@sakamocchi.jp>
References: <20210609012244.24296-1-o-takashi@sakamocchi.jp>
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
snd_pcm_period_elapsed(), for drivers to awaken processes from waiting for
available frames. The function voluntarily acquires lock of PCM substream,
therefore it is not called in process context for any PCM operation since
the lock is already acquired.

The call in process context is convenient for packet-oriented driver, at
least for drivers to audio and music unit in IEEE 1394 bus. The drivers
are allowed by Linux FireWire subsystem to process isochronous packets
queued till recent isochronous cycle in process context in any time.

This commit adds snd_pcm_period_elapsed() variant,
snd_pcm_period_elapsed_under_stream_lock(), for drivers to queue the event
in the process context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/sound/pcm.h  |  1 +
 sound/core/pcm_lib.c | 68 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 54 insertions(+), 15 deletions(-)

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
index b7e3d8f44511..6f01b0c805ca 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1778,27 +1778,40 @@ int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 EXPORT_SYMBOL(snd_pcm_lib_ioctl);
 
 /**
- * snd_pcm_period_elapsed - update the pcm status for the next period
- * @substream: the pcm substream instance
+ * snd_pcm_period_elapsed_under_stream_lock() - update the status of runtime for the next period
+ *						under acquired lock of PCM substream.
+ * @substream: the instance of pcm substream.
+ *
+ * The function is called when the batch of audio data frames as the same size as the period of
+ * buffer is already processed in audio data transmission.
+ *
+ * The call of function updates the status of runtime with the latest position of audio data
+ * transmission, checks overrun and underrun over buffer, awaken user processes from waiting for
+ * available audio data frames, sampling audio timestamp, and performs stop or drain the PCM
+ * substream according to configured threshold.
+ *
+ * The function is intended to use for the case that PCM driver operates audio data frames under
+ * acquired lock of PCM substream; e.g. in callback of any operation of &snd_pcm_ops in process
+ * context. In any interrupt context, it's preferable to use ``snd_pcm_period_elapsed()`` instead
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
+ * Context: Any context under acquired lock of PCM substream. This function may not sleep.
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
@@ -1811,7 +1824,32 @@ void snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
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
+ * The function is mostly similar to ``snd_pcm_period_elapsed_under_stream_lock()`` except for
+ * acquiring lock of PCM substream voluntarily.
+ *
+ * It's typically called by any type of IRQ handler when hardware IRQ occurs to notify event that
+ * the batch of audio data frames as the same size as the period of buffer is already processed in
+ * audio data transmission.
+ *
+ * Context: Interrupt context without acquired lock of PCM substream. This function may not sleep.
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

