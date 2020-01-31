Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B9114EC8B
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 13:35:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18E1E1683;
	Fri, 31 Jan 2020 13:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18E1E1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580474152;
	bh=svIfnC7OyFxQo0I4KRDOODb5+EdBF/XalsmdKwDRqJo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wr7iadh14/5ZxwnqNDCkhFMOj7Sp07R7p3TEdvhyUuYdp7auv6CJzpvIkxmFRHD0Q
	 SberitKj5Mt5yC2qfkkq3e4vEjV9CF5bnzzYtmSo5LLTrkZgpwKYN/tkkHagm2DPPO
	 nsgaAUnITVAk5Kz+zsmrmRhX4gglzprE6o5SD79w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 266B5F8028A;
	Fri, 31 Jan 2020 13:31:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 795C3F80276; Fri, 31 Jan 2020 13:31:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D1F8F80218
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 13:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D1F8F80218
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 04:31:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,385,1574150400"; d="scan'208";a="262532381"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2020 04:31:40 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 31 Jan 2020 13:31:08 +0100
Message-Id: <20200131123115.14247-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131123115.14247-1-cezary.rojewski@intel.com>
References: <20200131123115.14247-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
Subject: [alsa-devel] [PATCH v4 04/11] ALSA: core: Expand DMA buffer
	information
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

Update DMA buffer definition for snd_compr_runtime so it is represented
similarly as in snd_pcm_runtime. While at it, modify
snd_compr_set_runtime_buffer to account for newly added members.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 include/sound/compress_driver.h | 35 ++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index bc88d6f964da..00f633c0c3ba 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -23,7 +23,6 @@ struct snd_compr_ops;
  * struct snd_compr_runtime: runtime stream description
  * @state: stream state
  * @ops: pointer to DSP callbacks
- * @dma_buffer_p: runtime dma buffer pointer
  * @buffer: pointer to kernel buffer, valid only when not in mmap mode or
  *	DSP doesn't implement copy
  * @buffer_size: size of the above buffer
@@ -34,11 +33,14 @@ struct snd_compr_ops;
  * @total_bytes_transferred: cumulative bytes transferred by offload DSP
  * @sleep: poll sleep
  * @private_data: driver private data pointer
+ * @dma_area: virtual buffer address
+ * @dma_addr: physical buffer address (not accessible from main CPU)
+ * @dma_bytes: size of DMA area
+ * @dma_buffer_p: runtime dma buffer pointer
  */
 struct snd_compr_runtime {
 	snd_pcm_state_t state;
 	struct snd_compr_ops *ops;
-	struct snd_dma_buffer *dma_buffer_p;
 	void *buffer;
 	u64 buffer_size;
 	u32 fragment_size;
@@ -47,6 +49,11 @@ struct snd_compr_runtime {
 	u64 total_bytes_transferred;
 	wait_queue_head_t sleep;
 	void *private_data;
+
+	unsigned char *dma_area;
+	dma_addr_t dma_addr;
+	size_t dma_bytes;
+	struct snd_dma_buffer *dma_buffer_p;
 };
 
 /**
@@ -180,19 +187,29 @@ static inline void snd_compr_drain_notify(struct snd_compr_stream *stream)
 
 /**
  * snd_compr_set_runtime_buffer - Set the Compress runtime buffer
- * @substream: compress substream to set
+ * @stream: compress stream to set
  * @bufp: the buffer information, NULL to clear
  *
  * Copy the buffer information to runtime buffer when @bufp is non-NULL.
  * Otherwise it clears the current buffer information.
  */
-static inline void snd_compr_set_runtime_buffer(
-					struct snd_compr_stream *substream,
-					struct snd_dma_buffer *bufp)
+static inline void
+snd_compr_set_runtime_buffer(struct snd_compr_stream *stream,
+			     struct snd_dma_buffer *bufp)
 {
-	struct snd_compr_runtime *runtime = substream->runtime;
-
-	runtime->dma_buffer_p = bufp;
+	struct snd_compr_runtime *runtime = stream->runtime;
+
+	if (bufp) {
+		runtime->dma_buffer_p = bufp;
+		runtime->dma_area = bufp->area;
+		runtime->dma_addr = bufp->addr;
+		runtime->dma_bytes = bufp->bytes;
+	} else {
+		runtime->dma_buffer_p = NULL;
+		runtime->dma_area = NULL;
+		runtime->dma_addr = 0;
+		runtime->dma_bytes = 0;
+	}
 }
 
 int snd_compr_stop_error(struct snd_compr_stream *stream,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
