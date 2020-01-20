Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC1A142B37
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 13:46:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F21C1668;
	Mon, 20 Jan 2020 13:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F21C1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579524382;
	bh=OoPhD4tokTdR0EKp4agldQntz2d//8sBcJwjYu0LASM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UfFmMHoI21UgAtqI80gJuFObVbq9n6wuGUv32Cqvo8M1wjbW/UapSbCtT4byLXj+F
	 Q+lerf/gYv+2k1p15rIXO/pfV+REwRilRhP6KfjZ6wOrGzh+xLq2GoDOqXTdwDpGDg
	 J9mRl1svOG7vHKByQV4oecdaW2ePydM1PvN5GxV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3288F80245;
	Mon, 20 Jan 2020 13:44:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EB0FF8020C; Mon, 20 Jan 2020 13:44:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7590AF8013E
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 13:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7590AF8013E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15E67AEE7;
 Mon, 20 Jan 2020 12:44:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon, 20 Jan 2020 13:44:22 +0100
Message-Id: <20200120124423.11862-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Keyon Jie <yang.jie@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/2] ALSA: pcm: Set per-card upper limit of PCM
	buffer allocations
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Currently, the available buffer allocation size for a PCM stream
depends on the preallocated size; when a buffer has been preallocated,
the max buffer size is set to that size, so that application won't
re-allocate too much memory.  OTOH, when no preallocation is done,
each substream may allocate arbitrary size of buffers as long as
snd_pcm_hardware.buffer_bytes_max allows -- which can be quite high,
HD-audio sets 1GB there.

It means that the system may consume a high amount of pages for PCM
buffers, and they are pinned and never swapped out.  This can lead to
OOM easily.

For avoiding such a situation, this patch adds the upper limit per
card.  Each snd_pcm_lib_malloc_pages() and _free_pages() calls are
tracked and it will return an error if the total amount of buffers
goes over the defined upper limit.  The default value is set to 32MB,
which should be really large enough for usual operations.

If larger buffers are needed for any specific usage, it can be
adjusted (also dynamically) via snd_pcm.max_alloc_per_card option.
Setting zero there means no chceck is performed, and again, unlimited
amount of buffers are allowed.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h    |  3 +++
 sound/core/init.c       |  1 +
 sound/core/pcm_memory.c | 69 ++++++++++++++++++++++++++++++++++++-------------
 3 files changed, 55 insertions(+), 18 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 0e14b7a3e67b..ac8b692b69b4 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -120,6 +120,9 @@ struct snd_card {
 	int sync_irq;			/* assigned irq, used for PCM sync */
 	wait_queue_head_t remove_sleep;
 
+	size_t total_pcm_alloc_bytes;	/* total amount of allocated buffers */
+	struct mutex memory_mutex;	/* protection for the above */
+
 #ifdef CONFIG_PM
 	unsigned int power_state;	/* power state */
 	wait_queue_head_t power_sleep;
diff --git a/sound/core/init.c b/sound/core/init.c
index faa9f03c01ca..b02a99766351 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -211,6 +211,7 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 	INIT_LIST_HEAD(&card->ctl_files);
 	spin_lock_init(&card->files_lock);
 	INIT_LIST_HEAD(&card->files_list);
+	mutex_init(&card->memory_mutex);
 #ifdef CONFIG_PM
 	init_waitqueue_head(&card->power_sleep);
 #endif
diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index d4702cc1d376..a18ebf2341ca 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -27,6 +27,38 @@ MODULE_PARM_DESC(maximum_substreams, "Maximum substreams with preallocated DMA m
 
 static const size_t snd_minimum_buffer = 16384;
 
+static unsigned long max_alloc_per_card = 32UL * 1024UL * 1024UL * 1024UL;
+module_param(max_alloc_per_card, ulong, 0644);
+MODULE_PARM_DESC(max_alloc_per_card, "Max total allocation bytes per card.");
+
+static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
+			  size_t size, struct snd_dma_buffer *dmab)
+{
+	int err;
+
+	if (max_alloc_per_card &&
+	    card->total_pcm_alloc_bytes + size > max_alloc_per_card)
+		return -ENOMEM;
+	err = snd_dma_alloc_pages(type, dev, size, dmab);
+	if (!err) {
+		mutex_lock(&card->memory_mutex);
+		card->total_pcm_alloc_bytes += dmab->bytes;
+		mutex_unlock(&card->memory_mutex);
+	}
+	return err;
+}
+
+static void do_free_pages(struct snd_card *card, struct snd_dma_buffer *dmab)
+{
+	if (!dmab->area)
+		return;
+	mutex_lock(&card->memory_mutex);
+	WARN_ON(card->total_pcm_alloc_bytes < dmab->bytes);
+	card->total_pcm_alloc_bytes -= dmab->bytes;
+	mutex_unlock(&card->memory_mutex);
+	snd_dma_free_pages(dmab);
+	dmab->area = NULL;
+}
 
 /*
  * try to allocate as the large pages as possible.
@@ -37,16 +69,15 @@ static const size_t snd_minimum_buffer = 16384;
 static int preallocate_pcm_pages(struct snd_pcm_substream *substream, size_t size)
 {
 	struct snd_dma_buffer *dmab = &substream->dma_buffer;
+	struct snd_card *card = substream->pcm->card;
 	size_t orig_size = size;
 	int err;
 
 	do {
-		if ((err = snd_dma_alloc_pages(dmab->dev.type, dmab->dev.dev,
-					       size, dmab)) < 0) {
-			if (err != -ENOMEM)
-				return err; /* fatal error */
-		} else
-			return 0;
+		err = do_alloc_pages(card, dmab->dev.type, dmab->dev.dev,
+				     size, dmab);
+		if (err != -ENOMEM)
+			return err;
 		size >>= 1;
 	} while (size >= snd_minimum_buffer);
 	dmab->bytes = 0; /* tell error */
@@ -62,10 +93,7 @@ static int preallocate_pcm_pages(struct snd_pcm_substream *substream, size_t siz
  */
 static void snd_pcm_lib_preallocate_dma_free(struct snd_pcm_substream *substream)
 {
-	if (substream->dma_buffer.area == NULL)
-		return;
-	snd_dma_free_pages(&substream->dma_buffer);
-	substream->dma_buffer.area = NULL;
+	do_free_pages(substream->pcm->card, &substream->dma_buffer);
 }
 
 /**
@@ -130,6 +158,7 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 					       struct snd_info_buffer *buffer)
 {
 	struct snd_pcm_substream *substream = entry->private_data;
+	struct snd_card *card = substream->pcm->card;
 	char line[64], str[64];
 	size_t size;
 	struct snd_dma_buffer new_dmab;
@@ -150,9 +179,10 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 		memset(&new_dmab, 0, sizeof(new_dmab));
 		new_dmab.dev = substream->dma_buffer.dev;
 		if (size > 0) {
-			if (snd_dma_alloc_pages(substream->dma_buffer.dev.type,
-						substream->dma_buffer.dev.dev,
-						size, &new_dmab) < 0) {
+			if (do_alloc_pages(card,
+					   substream->dma_buffer.dev.type,
+					   substream->dma_buffer.dev.dev,
+					   size, &new_dmab) < 0) {
 				buffer->error = -ENOMEM;
 				return;
 			}
@@ -161,7 +191,7 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 			substream->buffer_bytes_max = UINT_MAX;
 		}
 		if (substream->dma_buffer.area)
-			snd_dma_free_pages(&substream->dma_buffer);
+			do_free_pages(card, &substream->dma_buffer);
 		substream->dma_buffer = new_dmab;
 	} else {
 		buffer->error = -EINVAL;
@@ -346,6 +376,7 @@ struct page *snd_pcm_sgbuf_ops_page(struct snd_pcm_substream *substream, unsigne
  */
 int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size)
 {
+	struct snd_card *card = substream->pcm->card;
 	struct snd_pcm_runtime *runtime;
 	struct snd_dma_buffer *dmab = NULL;
 
@@ -374,9 +405,10 @@ int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size)
 		if (! dmab)
 			return -ENOMEM;
 		dmab->dev = substream->dma_buffer.dev;
-		if (snd_dma_alloc_pages(substream->dma_buffer.dev.type,
-					substream->dma_buffer.dev.dev,
-					size, dmab) < 0) {
+		if (do_alloc_pages(card,
+				   substream->dma_buffer.dev.type,
+				   substream->dma_buffer.dev.dev,
+				   size, dmab) < 0) {
 			kfree(dmab);
 			return -ENOMEM;
 		}
@@ -397,6 +429,7 @@ EXPORT_SYMBOL(snd_pcm_lib_malloc_pages);
  */
 int snd_pcm_lib_free_pages(struct snd_pcm_substream *substream)
 {
+	struct snd_card *card = substream->pcm->card;
 	struct snd_pcm_runtime *runtime;
 
 	if (PCM_RUNTIME_CHECK(substream))
@@ -406,7 +439,7 @@ int snd_pcm_lib_free_pages(struct snd_pcm_substream *substream)
 		return 0;
 	if (runtime->dma_buffer_p != &substream->dma_buffer) {
 		/* it's a newly allocated buffer.  release it now. */
-		snd_dma_free_pages(runtime->dma_buffer_p);
+		do_free_pages(card, runtime->dma_buffer_p);
 		kfree(runtime->dma_buffer_p);
 	}
 	snd_pcm_set_runtime_buffer(substream, NULL);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
