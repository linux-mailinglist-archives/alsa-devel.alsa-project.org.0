Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763B4311FFC
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 21:40:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B9EB1684;
	Sat,  6 Feb 2021 21:39:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B9EB1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612644003;
	bh=QOnpIPmwnSuImfarM4vLZGN+HcfVIbKHQ1hSlGq8whY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PtgFW4Bu27okE9Q0GHuTrJJmxVHRQwaX8Z2obrYH6H3J3YMaOYdFjSqzI8a+w2fKS
	 BPVUBsoCllf+pkwxbSPtqYRXURNsJJDDG4G+l9idHpsemzYYYRpdZVa7CVYWqkW8Ho
	 bl/UzELusKoIU8mIJ9hUPwM7UWn5K+lKp3rXKlJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40A15F80290;
	Sat,  6 Feb 2021 21:37:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48654F80264; Sat,  6 Feb 2021 21:37:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EEEDF80171
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 21:37:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EEEDF80171
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19D13ACD4
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 20:37:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ALSA: pcm: Call sync_stop at disconnection
Date: Sat,  6 Feb 2021 21:36:53 +0100
Message-Id: <20210206203656.15959-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210206203656.15959-1-tiwai@suse.de>
References: <20210206203656.15959-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The PCM core should perform the sync for the pending stop operations
at disconnection.  Otherwise it may lead to unexpected access.

Currently the old user of sync_stop, USB-audio driver, has its own
sync, so this isn't needed, but it's better to guarantee the sync in
the PCM core level.

This patch adds the missing sync_stop call at PCM disconnection
callback.  It also assures the IRQ sync if it's specified in the
card.  snd_pcm_sync_stop() is slightly modified to be called also for
any PCM substream object now.

Fixes: 1e850beea278 ("ALSA: pcm: Add the support for sync-stop operation")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c       |  4 ++++
 sound/core/pcm.c        |  4 ++++
 sound/core/pcm_local.h  |  1 +
 sound/core/pcm_native.c | 16 ++++++++--------
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 84b573e9c1f9..45f4b01de23f 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -15,6 +15,7 @@
 #include <linux/pm.h>
 #include <linux/debugfs.h>
 #include <linux/completion.h>
+#include <linux/interrupt.h>
 
 #include <sound/core.h>
 #include <sound/control.h>
@@ -426,6 +427,9 @@ int snd_card_disconnect(struct snd_card *card)
 	/* notify all devices that we are disconnected */
 	snd_device_disconnect_all(card);
 
+	if (card->sync_irq > 0)
+		synchronize_irq(card->sync_irq);
+
 	snd_info_card_disconnect(card);
 	if (card->registered) {
 		device_del(&card->card_dev);
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index e5947281e5fc..50eb29fcdfe7 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -1111,6 +1111,10 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 		}
 	}
 
+	for (cidx = 0; cidx < 2; cidx++)
+		for (substream = pcm->streams[cidx].substream; substream; substream = substream->next)
+			snd_pcm_sync_stop(substream, false);
+
 	pcm_call_notify(pcm, n_disconnect);
 	for (cidx = 0; cidx < 2; cidx++) {
 		snd_unregister_device(&pcm->streams[cidx].dev);
diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
index 17a1a5d87098..b3e8be5aeafb 100644
--- a/sound/core/pcm_local.h
+++ b/sound/core/pcm_local.h
@@ -63,6 +63,7 @@ static inline void snd_pcm_timer_done(struct snd_pcm_substream *substream) {}
 
 void __snd_pcm_xrun(struct snd_pcm_substream *substream);
 void snd_pcm_group_init(struct snd_pcm_group *group);
+void snd_pcm_sync_stop(struct snd_pcm_substream *substream, bool sync_irq);
 
 #ifdef CONFIG_SND_DMA_SGBUF
 struct page *snd_pcm_sgbuf_ops_page(struct snd_pcm_substream *substream,
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 893c2abb2f63..1f5acf08cdcd 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -583,13 +583,13 @@ static inline void snd_pcm_timer_notify(struct snd_pcm_substream *substream,
 #endif
 }
 
-static void snd_pcm_sync_stop(struct snd_pcm_substream *substream)
+void snd_pcm_sync_stop(struct snd_pcm_substream *substream, bool sync_irq)
 {
-	if (substream->runtime->stop_operating) {
+	if (substream->runtime && substream->runtime->stop_operating) {
 		substream->runtime->stop_operating = false;
-		if (substream->ops->sync_stop)
+		if (substream->ops && substream->ops->sync_stop)
 			substream->ops->sync_stop(substream);
-		else if (substream->pcm->card->sync_irq > 0)
+		else if (sync_irq && substream->pcm->card->sync_irq > 0)
 			synchronize_irq(substream->pcm->card->sync_irq);
 	}
 }
@@ -686,7 +686,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 		if (atomic_read(&substream->mmap_count))
 			return -EBADFD;
 
-	snd_pcm_sync_stop(substream);
+	snd_pcm_sync_stop(substream, true);
 
 	params->rmask = ~0U;
 	err = snd_pcm_hw_refine(substream, params);
@@ -809,7 +809,7 @@ static int do_hw_free(struct snd_pcm_substream *substream)
 {
 	int result = 0;
 
-	snd_pcm_sync_stop(substream);
+	snd_pcm_sync_stop(substream, true);
 	if (substream->ops->hw_free)
 		result = substream->ops->hw_free(substream);
 	if (substream->managed_buffer_alloc)
@@ -1736,7 +1736,7 @@ static void snd_pcm_post_resume(struct snd_pcm_substream *substream,
 	snd_pcm_trigger_tstamp(substream);
 	runtime->status->state = runtime->status->suspended_state;
 	snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MRESUME);
-	snd_pcm_sync_stop(substream);
+	snd_pcm_sync_stop(substream, true);
 }
 
 static const struct action_ops snd_pcm_action_resume = {
@@ -1866,7 +1866,7 @@ static int snd_pcm_do_prepare(struct snd_pcm_substream *substream,
 			      snd_pcm_state_t state)
 {
 	int err;
-	snd_pcm_sync_stop(substream);
+	snd_pcm_sync_stop(substream, true);
 	err = substream->ops->prepare(substream);
 	if (err < 0)
 		return err;
-- 
2.26.2

