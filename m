Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1893DD12E
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:32:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A9117DD;
	Mon,  2 Aug 2021 09:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A9117DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889543;
	bh=SBNcP0zu5LBbJH+UXyhEUB/X9Wc524hk5a/jUihg0/Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7drJFCCIVI8WF2zR/ZRWBsH1uvAMWW/AwHF3gVMGwcPS6ckcBPr7Ex5wMhgRkD+A
	 n9OPpaeNhhX9hJfCCXjQhat0rv6kRAkTOY1NFC1Yf0vZLFS7wLDwD/2NVZsjB3h+y9
	 e7wTmlZ28d/EmZQeVUPUVKA1X8q5wLixb4kWqVso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC2E8F80515;
	Mon,  2 Aug 2021 09:28:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DF76F8026A; Mon,  2 Aug 2021 09:28:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B74B3F80279
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B74B3F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="V9lYIt7g"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="k8ZowiOb"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D441221FDA;
 Mon,  2 Aug 2021 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozCkZLmvpdmaQshvbmGhcqYAxdD0R9xXhqgnkqKCLuI=;
 b=V9lYIt7gITykA95+Kolv0rI2zEAkymP8MaZgbimkN4VLrmaAmeXxIvZ/Yn3BNDk3wwpnOW
 A7yfnE+uwuzKcsfSf10S3H/H0GsHDEhHtaFY/0AflRfCwqMn4kzM42wQaf5rbmjGKnCekb
 6dT5+BrfNLTM5fJ2AkgUnLj4yg94BOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozCkZLmvpdmaQshvbmGhcqYAxdD0R9xXhqgnkqKCLuI=;
 b=k8ZowiObiHJR/f1NIWj9hXUgp09zeHc2pVYuCSx9U6ROXoTPIUsEdzcULZ/vQh5FGiO6Rg
 d7nI+exfNohjCkBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C3447A3BA8;
 Mon,  2 Aug 2021 07:28:17 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/15] ALSA: pcm: Allow exact buffer preallocation
Date: Mon,  2 Aug 2021 09:28:03 +0200
Message-Id: <20210802072815.13551-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210802072815.13551-1-tiwai@suse.de>
References: <20210802072815.13551-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

A few drivers want to have rather the exact buffer preallocation at
the driver probe time and keep using it for the whole operations
without allowing dynamic buffer allocation.  For satisfying the
demands, this patch extends the managed buffer allocation API
slightly.

Namely, when 0 is passed to max argument of the allocation helper
functions snd_pcm_set_managed_buffer*(), it treats as if the fixed
size allocation of the given size.  If the pre-allocation fails in
this mode, the function returns now -ENOMEM.  Otherwise, i.e. max
argument is non-zero, the function never returns -ENOMEM but tries to
fall back to the smaller chunks and allows the dynamic allocation
later -- which is still the default behavior until now.

For more intuitive use, also two new helpers are added for handling
the fixed size buffer allocation, too: snd_pcm_set_fixed_buffer() and
snd_pcm_set_fixed_buffer_all().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     | 47 ++++++++++++++++++++++++++---
 sound/core/pcm_memory.c | 67 +++++++++++++++++++++++++++++++----------
 2 files changed, 93 insertions(+), 21 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 938f36050a5e..33451f8ff755 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1204,11 +1204,48 @@ void snd_pcm_lib_preallocate_pages_for_all(struct snd_pcm *pcm,
 int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size);
 int snd_pcm_lib_free_pages(struct snd_pcm_substream *substream);
 
-void snd_pcm_set_managed_buffer(struct snd_pcm_substream *substream, int type,
-				struct device *data, size_t size, size_t max);
-void snd_pcm_set_managed_buffer_all(struct snd_pcm *pcm, int type,
-				    struct device *data,
-				    size_t size, size_t max);
+int snd_pcm_set_managed_buffer(struct snd_pcm_substream *substream, int type,
+			       struct device *data, size_t size, size_t max);
+int snd_pcm_set_managed_buffer_all(struct snd_pcm *pcm, int type,
+				   struct device *data,
+				   size_t size, size_t max);
+
+/**
+ * snd_pcm_set_fixed_buffer - Preallocate and set up the fixed size PCM buffer
+ * @substream: the pcm substream instance
+ * @type: DMA type (SNDRV_DMA_TYPE_*)
+ * @data: DMA type dependent data
+ * @size: the requested pre-allocation size in bytes
+ *
+ * This is a variant of snd_pcm_set_managed_buffer(), but this pre-allocates
+ * only the given sized buffer and doesn't allow re-allocation nor dynamic
+ * allocation of a larger buffer unlike the standard one.
+ * The function may return -ENOMEM error, hence the caller must check it.
+ */
+static inline int __must_check
+snd_pcm_set_fixed_buffer(struct snd_pcm_substream *substream, int type,
+				 struct device *data, size_t size)
+{
+	return snd_pcm_set_managed_buffer(substream, type, data, size, 0);
+}
+
+/**
+ * snd_pcm_set_fixed_buffer_all - Preallocate and set up the fixed size PCM buffer
+ * @pcm: the pcm instance
+ * @type: DMA type (SNDRV_DMA_TYPE_*)
+ * @data: DMA type dependent data
+ * @size: the requested pre-allocation size in bytes
+ *
+ * Apply the set up of the fixed buffer via snd_pcm_set_fixed_buffer() for
+ * all substream.  If any of allocation fails, it returns -ENOMEM, hence the
+ * caller must check the return value.
+ */
+static inline int __must_check
+snd_pcm_set_fixed_buffer_all(struct snd_pcm *pcm, int type,
+			     struct device *data, size_t size)
+{
+	return snd_pcm_set_managed_buffer_all(pcm, type, data, size, 0);
+}
 
 int _snd_pcm_lib_alloc_vmalloc_buffer(struct snd_pcm_substream *substream,
 				      size_t size, gfp_t gfp_flags);
diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index d7621ed105bd..7fbd1ccbb5b0 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -67,7 +67,8 @@ static void do_free_pages(struct snd_card *card, struct snd_dma_buffer *dmab)
  *
  * the minimum size is snd_minimum_buffer.  it should be power of 2.
  */
-static int preallocate_pcm_pages(struct snd_pcm_substream *substream, size_t size)
+static int preallocate_pcm_pages(struct snd_pcm_substream *substream,
+				 size_t size, bool no_fallback)
 {
 	struct snd_dma_buffer *dmab = &substream->dma_buffer;
 	struct snd_card *card = substream->pcm->card;
@@ -79,6 +80,8 @@ static int preallocate_pcm_pages(struct snd_pcm_substream *substream, size_t siz
 				     size, dmab);
 		if (err != -ENOMEM)
 			return err;
+		if (no_fallback)
+			break;
 		size >>= 1;
 	} while (size >= snd_minimum_buffer);
 	dmab->bytes = 0; /* tell error */
@@ -86,7 +89,7 @@ static int preallocate_pcm_pages(struct snd_pcm_substream *substream, size_t siz
 		substream->pcm->card->number, substream->pcm->device,
 		substream->stream ? 'c' : 'p', substream->number,
 		substream->pcm->name, orig_size);
-	return 0;
+	return -ENOMEM;
 }
 
 /**
@@ -222,18 +225,31 @@ static inline void preallocate_info_init(struct snd_pcm_substream *substream)
 /*
  * pre-allocate the buffer and create a proc file for the substream
  */
-static void preallocate_pages(struct snd_pcm_substream *substream,
+static int preallocate_pages(struct snd_pcm_substream *substream,
 			      int type, struct device *data,
 			      size_t size, size_t max, bool managed)
 {
+	int err;
+
 	if (snd_BUG_ON(substream->dma_buffer.dev.type))
-		return;
+		return -EINVAL;
 
 	substream->dma_buffer.dev.type = type;
 	substream->dma_buffer.dev.dev = data;
 
-	if (size > 0 && preallocate_dma && substream->number < maximum_substreams)
-		preallocate_pcm_pages(substream, size);
+	if (size > 0) {
+		if (!max) {
+			/* no fallback, only also inform -ENOMEM */
+			err = preallocate_pcm_pages(substream, size, true);
+			if (err < 0)
+				return err;
+		} else if (preallocate_dma &&
+			   substream->number < maximum_substreams) {
+			err = preallocate_pcm_pages(substream, size, false);
+			if (err < 0 && err != -ENOMEM)
+				return err;
+		}
+	}
 
 	if (substream->dma_buffer.bytes > 0)
 		substream->buffer_bytes_max = substream->dma_buffer.bytes;
@@ -242,17 +258,22 @@ static void preallocate_pages(struct snd_pcm_substream *substream,
 		preallocate_info_init(substream);
 	if (managed)
 		substream->managed_buffer_alloc = 1;
+	return 0;
 }
 
-static void preallocate_pages_for_all(struct snd_pcm *pcm, int type,
+static int preallocate_pages_for_all(struct snd_pcm *pcm, int type,
 				      void *data, size_t size, size_t max,
 				      bool managed)
 {
 	struct snd_pcm_substream *substream;
-	int stream;
+	int stream, err;
 
-	for_each_pcm_substream(pcm, stream, substream)
-		preallocate_pages(substream, type, data, size, max, managed);
+	for_each_pcm_substream(pcm, stream, substream) {
+		err = preallocate_pages(substream, type, data, size, max, managed);
+		if (err < 0)
+			return err;
+	}
+	return 0;
 }
 
 /**
@@ -309,11 +330,22 @@ EXPORT_SYMBOL(snd_pcm_lib_preallocate_pages_for_all);
  * When a buffer is actually allocated before the PCM hw_params call, it
  * turns on the runtime buffer_changed flag for drivers changing their h/w
  * parameters accordingly.
+ *
+ * When @size is non-zero and @max is zero, this tries to allocate for only
+ * the exact buffer size without fallback, and may return -ENOMEM.
+ * Otherwise, the function tries to allocate smaller chunks if the allocation
+ * fails.  This is the behavior of snd_pcm_set_fixed_buffer().
+ *
+ * When both @size and @max are zero, the function only sets up the buffer
+ * for later dynamic allocations. It's used typically for buffers with
+ * SNDRV_DMA_TYPE_VMALLOC type.
+ *
+ * Upon successful buffer allocation and setup, the function returns 0.
  */
-void snd_pcm_set_managed_buffer(struct snd_pcm_substream *substream, int type,
+int snd_pcm_set_managed_buffer(struct snd_pcm_substream *substream, int type,
 				struct device *data, size_t size, size_t max)
 {
-	preallocate_pages(substream, type, data, size, max, true);
+	return preallocate_pages(substream, type, data, size, max, true);
 }
 EXPORT_SYMBOL(snd_pcm_set_managed_buffer);
 
@@ -329,11 +361,11 @@ EXPORT_SYMBOL(snd_pcm_set_managed_buffer);
  * Do pre-allocation to all substreams of the given pcm for the specified DMA
  * type and size, and set the managed_buffer_alloc flag to each substream.
  */
-void snd_pcm_set_managed_buffer_all(struct snd_pcm *pcm, int type,
-				    struct device *data,
-				    size_t size, size_t max)
+int snd_pcm_set_managed_buffer_all(struct snd_pcm *pcm, int type,
+				   struct device *data,
+				   size_t size, size_t max)
 {
-	preallocate_pages_for_all(pcm, type, data, size, max, true);
+	return preallocate_pages_for_all(pcm, type, data, size, max, true);
 }
 EXPORT_SYMBOL(snd_pcm_set_managed_buffer_all);
 
@@ -376,6 +408,9 @@ int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size)
 	    substream->dma_buffer.bytes >= size) {
 		dmab = &substream->dma_buffer; /* use the pre-allocated buffer */
 	} else {
+		/* dma_max=0 means the fixed size preallocation */
+		if (substream->dma_buffer.area && !substream->dma_max)
+			return -ENOMEM;
 		dmab = kzalloc(sizeof(*dmab), GFP_KERNEL);
 		if (! dmab)
 			return -ENOMEM;
-- 
2.26.2

