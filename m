Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C73A22B1
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 05:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8859D170E;
	Thu, 10 Jun 2021 05:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8859D170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623295170;
	bh=4uHW+00JgF+hh/8OjSgp/9ZAsRtTz9gP7nnJmSYUYgs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uYaQIRLanSGtxK76GnJExmURlH7Yc58oaQf3SfTjOY0V/RXNetMN+jqmc4nSr8Ahg
	 PoIWLA+eacR4xK5EC0kov19FinFhKH3U9s5f3mNb7vzDM8iYfOLJ34JExAmhdxc2iR
	 KF73aZFS8zZ+RbDdD0eKPdJuwF2VTwwS9JNf7ScU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC5B4F804BD;
	Thu, 10 Jun 2021 05:17:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D7B7F801EC; Thu, 10 Jun 2021 05:17:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BA9EF801EC
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 05:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BA9EF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Odpe1kqk"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZADJQN22"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A40165C0140;
 Wed,  9 Jun 2021 23:17:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 09 Jun 2021 23:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=cDZeZQL+b09+G
 UQUyDJVDayFVX+4X/q27psyF3f4DDc=; b=Odpe1kqk69w2YAsd883OWZ/7Qu6lH
 uAgsOVycp/j3zFJBHKVL84jLcKhDOK4omOQBt3w9mLxcvXmAQx1lXRLYsAf011u0
 9VuocpnGylHfUjp6VUs8cztC5cNtKTZalJwYLMBWVwOio48BScadyXHKyfUrgJmF
 RGKunOGTsChjgSIUnaE1je9lXPvViRGg1llMYRgKTttDu8umCEmYdNyZwXZ1/IqL
 d7Y3yZ+RyQUKcNNnWohHjFDpD9bi1GuncoklFDfq+CN1gK4LkJ1a0AT9e99TH1XI
 PoRoiS8dCsSxVh+HET5rF3XOwrURIGKjYPfv9gA48ROIqpGAkWEZdbf6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=cDZeZQL+b09+GUQUyDJVDayFVX+4X/q27psyF3f4DDc=; b=ZADJQN22
 F84ZYWslx/HHbb3VfZ2BQ9EDyEtnr0sSvJsxgGMwr1I2IDdSeNyypheDA0zA3lJh
 VSugbVLRHiuJzJQgXCoRQB+zjjEBO1sk1adWA3Wb3Gp99enKrlidfO8Wt/WTMX3p
 mnBxZ90fV5VzP76/Lhbd7GW5RBNcFYwTWJU0YDsUCnqOJW8RW86iFoHuNAGsSkXm
 Kf0IGlXiatP3P63SpuQmnaZb2ANozWCMzIu4cGyaOXWScAZvf4zaGKdqO1/e5Ke7
 RGR/nwthQ9vW2VsSct0fkXxZg71BsWWaIo/MPSIL6nE5OHIvndBF/vxfiPOTaWn0
 QYhdy0EXMoVNPw==
X-ME-Sender: <xms:U4TBYHOp-BA895Np86b5LqDps6YXh76yqDg8BTEzdGjXid3iUw3EPg>
 <xme:U4TBYB-UF9p76RIP0f2909urFLWptPYMIRSp-ljbYwZ00FBWsg23S2tB-HrDNL3fZ
 C7GdApNIEPuzMa_oyQ>
X-ME-Received: <xmr:U4TBYGRDEnGY19LN-_uYhofOZDDtD0R2lSBmChHaDHk-WLEiGCrt6lS5qh5Cij5BrkurBJoZcJcvjE1PmWjLFu8SM5dBlcVEJKo5WYY9e3W0-WmCzRy8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduvddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:U4TBYLv1ZaptLS5zHlaAObvUQNqaEIRkxrhjpqS0MNpEFj1CCZgkgA>
 <xmx:U4TBYPdm1xbZvZxPNqnHLl2puCqOw6DbX2qtlpMxYBlr3-JF0XJVcA>
 <xmx:U4TBYH1d095dzEgXEccmu1f4i3zA0rqfQxQjDbbBdyO8XeCzMHSMsQ>
 <xmx:U4TBYHHdIQ8Zuhbq2_CFGJTLzcerQviA7tHhkqYC7e2ZkXEeYnmpAA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 23:17:38 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 1/3] ALSA: pcm: add snd_pcm_period_elapsed() variant
 without acquiring lock of PCM substream
Date: Thu, 10 Jun 2021 12:17:31 +0900
Message-Id: <20210610031733.56297-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610031733.56297-1-o-takashi@sakamocchi.jp>
References: <20210610031733.56297-1-o-takashi@sakamocchi.jp>
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

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/sound/pcm.h  |  1 +
 sound/core/pcm_lib.c | 64 +++++++++++++++++++++++++++++++++-----------
 2 files changed, 50 insertions(+), 15 deletions(-)

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
index b7e3d8f44511..7d5883432085 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1778,27 +1778,38 @@ int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
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
  */
-void snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
+void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream)
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
@@ -1811,7 +1822,30 @@ void snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
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

