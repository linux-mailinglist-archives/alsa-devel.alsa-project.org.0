Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E29FD48D9A1
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 15:20:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 869B21F69;
	Thu, 13 Jan 2022 15:19:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 869B21F69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642083617;
	bh=ZKH/I5xHAy0gpNW1Xr6MCqwiEoGZErfDULMHVZYtms8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qbzumEthkc0HUAQGPxqORkDIxTiSsOT4l87K/nVlEySC5HnNVrH0FKArnWQMs8ixr
	 FY4lh0Tja4kprQPyvcNTiOtx2MyNWFUocI/RoQI2G2F04jtlRH9Q0jkzZNzxWCWWU2
	 pnvf1k+bn64kWcQzGvb2hsMlhV3ET1f8VhC6CAng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4173F80054;
	Thu, 13 Jan 2022 15:19:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8283EF80054; Thu, 13 Jan 2022 15:19:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A403F80088
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 15:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A403F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="H3oCf35B"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="b14CwFfL"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 548741F3BC;
 Thu, 13 Jan 2022 14:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642083540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yTo1UUckHz1uPc7/hfTvnjYNblB8RVMdA1JWpCR0WEM=;
 b=H3oCf35BQyFz1yqCa3BW3Yo6YlINk+gjQK4ueCa0/YWAWvO5CmyqGDWWl7d4rtC+w33VI1
 1O3+0fzBsrnMewwWvH3YV+3xGRjSnEZJBgbZHkuhMFSqqBwgDiFE8TCb79MeOBqXd8B/Ey
 ciHLp9TkdGiZsdkz2HBbqkXoeBlfkyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642083540;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yTo1UUckHz1uPc7/hfTvnjYNblB8RVMdA1JWpCR0WEM=;
 b=b14CwFfLfSh6TMMcwy/3XgIut7YY+KAGY3KzNZ1K8JGcuEpkBoZ8/ZDjWhKATcwshx9d97
 Q4px88Sab1esuODA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id BD729A3B88;
 Thu, 13 Jan 2022 14:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-pcm: Fix DPCM lockdep warning due to nested stream
 locks
Date: Thu, 13 Jan 2022 15:18:58 +0100
Message-Id: <20220113141858.10904-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

The recent change for DPCM locking caused spurious lockdep warnings.
Actually the warnings are false-positive, as those are triggered due
to the nested stream locks for FE and BE.  Since both locks belong to
the same lock class, lockdep sees it as if a deadlock.

For fixing this, we need take PCM stream locks for BE with the nested
lock primitives.  Since currently snd_pcm_stream_lock*() helper
assumes only the top-level single locking, a new helper function
snd_pcm_stream_lock_irqsave_nested() is defined for a single-depth
nested lock, which is now used in the BE DAI trigger that is always
performed inside a FE stream lock.

Fixes: b7898396f4bb ("ASoC: soc-pcm: Fix and cleanup DPCM locking")
Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/r/73018f3c-9769-72ea-0325-b3f8e2381e30@redhat.com
Link: https://lore.kernel.org/alsa-devel/9a0abddd-49e9-872d-2f00-a1697340f786@samsung.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     | 15 +++++++++++++++
 sound/core/pcm_native.c | 13 +++++++++++++
 sound/soc/soc-pcm.c     |  6 +++---
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 9b187d86e1bd..36da42cd0774 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -617,6 +617,7 @@ void snd_pcm_stream_unlock(struct snd_pcm_substream *substream);
 void snd_pcm_stream_lock_irq(struct snd_pcm_substream *substream);
 void snd_pcm_stream_unlock_irq(struct snd_pcm_substream *substream);
 unsigned long _snd_pcm_stream_lock_irqsave(struct snd_pcm_substream *substream);
+unsigned long _snd_pcm_stream_lock_irqsave_nested(struct snd_pcm_substream *substream);
 
 /**
  * snd_pcm_stream_lock_irqsave - Lock the PCM stream
@@ -635,6 +636,20 @@ unsigned long _snd_pcm_stream_lock_irqsave(struct snd_pcm_substream *substream);
 void snd_pcm_stream_unlock_irqrestore(struct snd_pcm_substream *substream,
 				      unsigned long flags);
 
+/**
+ * snd_pcm_stream_lock_irqsave_nested - Single-nested PCM stream locking
+ * @substream: PCM substream
+ * @flags: irq flags
+ *
+ * This locks the PCM stream like snd_pcm_stream_lock_irqsave() but with
+ * the single-depth lockdep subclass.
+ */
+#define snd_pcm_stream_lock_irqsave_nested(substream, flags)		\
+	do {								\
+		typecheck(unsigned long, flags);			\
+		flags = _snd_pcm_stream_lock_irqsave_nested(substream); \
+	} while (0)
+
 /**
  * snd_pcm_group_for_each_entry - iterate over the linked substreams
  * @s: the iterator
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 621883e71194..a056b3ef3c84 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -172,6 +172,19 @@ unsigned long _snd_pcm_stream_lock_irqsave(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL_GPL(_snd_pcm_stream_lock_irqsave);
 
+unsigned long _snd_pcm_stream_lock_irqsave_nested(struct snd_pcm_substream *substream)
+{
+	unsigned long flags = 0;
+	if (substream->pcm->nonatomic)
+		mutex_lock_nested(&substream->self_group.mutex,
+				  SINGLE_DEPTH_NESTING);
+	else
+		spin_lock_irqsave_nested(&substream->self_group.lock, flags,
+					 SINGLE_DEPTH_NESTING);
+	return flags;
+}
+EXPORT_SYMBOL_GPL(_snd_pcm_stream_lock_irqsave_nested);
+
 /**
  * snd_pcm_stream_unlock_irqrestore - Unlock the PCM stream
  * @substream: PCM substream
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7abfc48b26ca..e8876e65c649 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -46,8 +46,8 @@ static inline void snd_soc_dpcm_stream_lock_irq(struct snd_soc_pcm_runtime *rtd,
 	snd_pcm_stream_lock_irq(snd_soc_dpcm_get_substream(rtd, stream));
 }
 
-#define snd_soc_dpcm_stream_lock_irqsave(rtd, stream, flags) \
-	snd_pcm_stream_lock_irqsave(snd_soc_dpcm_get_substream(rtd, stream), flags)
+#define snd_soc_dpcm_stream_lock_irqsave_nested(rtd, stream, flags) \
+	snd_pcm_stream_lock_irqsave_nested(snd_soc_dpcm_get_substream(rtd, stream), flags)
 
 static inline void snd_soc_dpcm_stream_unlock_irq(struct snd_soc_pcm_runtime *rtd,
 						  int stream)
@@ -2094,7 +2094,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 		be = dpcm->be;
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
 
-		snd_soc_dpcm_stream_lock_irqsave(be, stream, flags);
+		snd_soc_dpcm_stream_lock_irqsave_nested(be, stream, flags);
 
 		/* is this op for this BE ? */
 		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
-- 
2.31.1

