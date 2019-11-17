Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85DFF89A
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Nov 2019 09:59:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FFDF168B;
	Sun, 17 Nov 2019 09:58:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FFDF168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573981184;
	bh=IYf2W5fiQ1vZmglvST5ygxxtn2rwKYSOcurjZp6fPxw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d8M1VkYf0d/K3Gj9dUsNIyy4vFWP2oUMDt0kmai9IbWKK0/XltepnbYH1DLKddlfk
	 CO9e0wnzWNUmW2mHfA3JhqXk2dVIxVN6ViMyB1IneJ36BgGU8lYUDYH0854lyoKWlR
	 LE/wRczpXH9eoaBW6thKl9YecF2bne2qxltGudCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D1AFF801F2;
	Sun, 17 Nov 2019 09:53:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B8B6F80137; Sun, 17 Nov 2019 09:53:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D8A3F80131
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 09:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D8A3F80131
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CEE48B1C3
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 08:53:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 17 Nov 2019 09:53:01 +0100
Message-Id: <20191117085308.23915-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191117085308.23915-1-tiwai@suse.de>
References: <20191117085308.23915-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 1/8] ALSA: pcm: Introduce managed buffer
	allocation mode
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

This patch adds the support for the feature to automatically allocate
and free PCM buffers, so called "managed buffer allocation" mode.
It's set up via new PCM helpers, snd_pcm_set_managed_buffer() and
snd_pcm_set_managed_buffer_all(), both of which correspond to the
existing preallocator helpers, snd_pcm_lib_preallocate_pages() and
snd_pcm_lib_preallocate_pages_for_all().  When the new helper is used,
it not only performs the pre-allocation of buffers, but also it
manages to call snd_pcm_lib_malloc_pages() before the PCM hw_params
ops and snd_lib_pcm_free() after the PCM hw_free ops inside PCM core,
respectively.  This allows drivers to drop the explicit calls of the
memory allocation / release functions, and it will be a good amount of
code reduction in the end of this patch series.

When the PCM substream is set to the managed buffer allocation mode,
the managed_buffer_alloc flag is set in the substream object.  Since
some drivers want to know when a buffer is newly allocated or
re-allocated at hw_params callback (e.g. want to set up the additional
stuff for the given buffer only at allocation time), now PCM core
turns on buffer_changed flag when the buffer has changed.

The standard conversions to use the new API will be straightforward:
- Replace snd_pcm_lib_preallocate*() calls with the corresponding
  snd_pcm_set_managed_buffer*(); the arguments should be unchanged
- Drop superfluous snd_pcm_lib_malloc() and snd_pcm_lib_free() calls;
  the check of snd_pcm_lib_malloc() returns should be replaced with
  the check of runtime->buffer_changed flag.
- If hw_params or hw_free becomes empty, drop them from PCM ops

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     |  8 +++++
 sound/core/pcm_memory.c | 83 +++++++++++++++++++++++++++++++++++++++++--------
 sound/core/pcm_native.c | 12 +++++++
 3 files changed, 90 insertions(+), 13 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2c0aa884f5f1..253d15c61ce2 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -414,6 +414,7 @@ struct snd_pcm_runtime {
 	size_t dma_bytes;		/* size of DMA area */
 
 	struct snd_dma_buffer *dma_buffer_p;	/* allocated buffer */
+	unsigned int buffer_changed:1;	/* buffer allocation changed; set only in managed mode */
 
 	/* -- audio timestamp config -- */
 	struct snd_pcm_audio_tstamp_config audio_tstamp_config;
@@ -475,6 +476,7 @@ struct snd_pcm_substream {
 #endif /* CONFIG_SND_VERBOSE_PROCFS */
 	/* misc flags */
 	unsigned int hw_opened: 1;
+	unsigned int managed_buffer_alloc:1;
 };
 
 #define SUBSTREAM_BUSY(substream) ((substream)->ref_count > 0)
@@ -1186,6 +1188,12 @@ void snd_pcm_lib_preallocate_pages_for_all(struct snd_pcm *pcm,
 int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size);
 int snd_pcm_lib_free_pages(struct snd_pcm_substream *substream);
 
+void snd_pcm_set_managed_buffer(struct snd_pcm_substream *substream, int type,
+				struct device *data, size_t size, size_t max);
+void snd_pcm_set_managed_buffer_all(struct snd_pcm *pcm, int type,
+				    struct device *data,
+				    size_t size, size_t max);
+
 int _snd_pcm_lib_alloc_vmalloc_buffer(struct snd_pcm_substream *substream,
 				      size_t size, gfp_t gfp_flags);
 int snd_pcm_lib_free_vmalloc_buffer(struct snd_pcm_substream *substream);
diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 286f333f8e4c..73b770db2372 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -193,9 +193,15 @@ static inline void preallocate_info_init(struct snd_pcm_substream *substream)
 /*
  * pre-allocate the buffer and create a proc file for the substream
  */
-static void snd_pcm_lib_preallocate_pages1(struct snd_pcm_substream *substream,
-					  size_t size, size_t max)
+static void preallocate_pages(struct snd_pcm_substream *substream,
+			      int type, struct device *data,
+			      size_t size, size_t max, bool managed)
 {
+	if (snd_BUG_ON(substream->dma_buffer.dev.type))
+		return;
+
+	substream->dma_buffer.dev.type = type;
+	substream->dma_buffer.dev.dev = data;
 
 	if (size > 0 && preallocate_dma && substream->number < maximum_substreams)
 		preallocate_pcm_pages(substream, size);
@@ -205,8 +211,23 @@ static void snd_pcm_lib_preallocate_pages1(struct snd_pcm_substream *substream,
 	substream->dma_max = max;
 	if (max > 0)
 		preallocate_info_init(substream);
+	if (managed)
+		substream->managed_buffer_alloc = 1;
 }
 
+static void preallocate_pages_for_all(struct snd_pcm *pcm, int type,
+				      void *data, size_t size, size_t max,
+				      bool managed)
+{
+	struct snd_pcm_substream *substream;
+	int stream;
+
+	for (stream = 0; stream < 2; stream++)
+		for (substream = pcm->streams[stream].substream; substream;
+		     substream = substream->next)
+			preallocate_pages(substream, type, data, size, max,
+					  managed);
+}
 
 /**
  * snd_pcm_lib_preallocate_pages - pre-allocation for the given DMA type
@@ -222,11 +243,7 @@ void snd_pcm_lib_preallocate_pages(struct snd_pcm_substream *substream,
 				  int type, struct device *data,
 				  size_t size, size_t max)
 {
-	if (snd_BUG_ON(substream->dma_buffer.dev.type))
-		return;
-	substream->dma_buffer.dev.type = type;
-	substream->dma_buffer.dev.dev = data;
-	snd_pcm_lib_preallocate_pages1(substream, size, max);
+	preallocate_pages(substream, type, data, size, max, false);
 }
 EXPORT_SYMBOL(snd_pcm_lib_preallocate_pages);
 
@@ -245,15 +262,55 @@ void snd_pcm_lib_preallocate_pages_for_all(struct snd_pcm *pcm,
 					  int type, void *data,
 					  size_t size, size_t max)
 {
-	struct snd_pcm_substream *substream;
-	int stream;
-
-	for (stream = 0; stream < 2; stream++)
-		for (substream = pcm->streams[stream].substream; substream; substream = substream->next)
-			snd_pcm_lib_preallocate_pages(substream, type, data, size, max);
+	preallocate_pages_for_all(pcm, type, data, size, max, false);
 }
 EXPORT_SYMBOL(snd_pcm_lib_preallocate_pages_for_all);
 
+/**
+ * snd_pcm_set_managed_buffer - set up buffer management for a substream
+ * @substream: the pcm substream instance
+ * @type: DMA type (SNDRV_DMA_TYPE_*)
+ * @data: DMA type dependent data
+ * @size: the requested pre-allocation size in bytes
+ * @max: the max. allowed pre-allocation size
+ *
+ * Do pre-allocation for the given DMA buffer type, and set the managed
+ * buffer allocation mode to the given substream.
+ * In this mode, PCM core will allocate a buffer automatically before PCM
+ * hw_params ops call, and release the buffer after PCM hw_free ops call
+ * as well, so that the driver doesn't need to invoke the allocation and
+ * the release explicitly in its callback.
+ * When a buffer is actually allocated before the PCM hw_params call, it
+ * turns on the runtime buffer_changed flag for drivers changing their h/w
+ * parameters accordingly.
+ */
+void snd_pcm_set_managed_buffer(struct snd_pcm_substream *substream, int type,
+				struct device *data, size_t size, size_t max)
+{
+	preallocate_pages(substream, type, data, size, max, true);
+}
+EXPORT_SYMBOL(snd_pcm_set_managed_buffer);
+
+/**
+ * snd_pcm_set_managed_buffer_all - set up buffer management for all substreams
+ *	for all substreams
+ * @pcm: the pcm instance
+ * @type: DMA type (SNDRV_DMA_TYPE_*)
+ * @data: DMA type dependent data
+ * @size: the requested pre-allocation size in bytes
+ * @max: the max. allowed pre-allocation size
+ *
+ * Do pre-allocation to all substreams of the given pcm for the specified DMA
+ * type and size, and set the managed_buffer_alloc flag to each substream.
+ */
+void snd_pcm_set_managed_buffer_all(struct snd_pcm *pcm, int type,
+				    struct device *data,
+				    size_t size, size_t max)
+{
+	preallocate_pages_for_all(pcm, type, data, size, max, true);
+}
+EXPORT_SYMBOL(snd_pcm_set_managed_buffer_all);
+
 #ifdef CONFIG_SND_DMA_SGBUF
 /*
  * snd_pcm_sgbuf_ops_page - get the page struct at the given offset
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 0c27009dc3df..f1646735bde6 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -662,6 +662,14 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (err < 0)
 		goto _error;
 
+	if (substream->managed_buffer_alloc) {
+		err = snd_pcm_lib_malloc_pages(substream,
+					       params_buffer_bytes(params));
+		if (err < 0)
+			goto _error;
+		runtime->buffer_changed = err > 0;
+	}
+
 	if (substream->ops->hw_params != NULL) {
 		err = substream->ops->hw_params(substream, params);
 		if (err < 0)
@@ -723,6 +731,8 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
 	if (substream->ops->hw_free != NULL)
 		substream->ops->hw_free(substream);
+	if (substream->managed_buffer_alloc)
+		snd_pcm_lib_free_pages(substream);
 	return err;
 }
 
@@ -769,6 +779,8 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
 		return -EBADFD;
 	if (substream->ops->hw_free)
 		result = substream->ops->hw_free(substream);
+	if (substream->managed_buffer_alloc)
+		snd_pcm_lib_free_pages(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
 	pm_qos_remove_request(&substream->latency_pm_qos_req);
 	return result;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
