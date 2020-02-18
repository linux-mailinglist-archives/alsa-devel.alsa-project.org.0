Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EBB1628BA
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 15:42:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 282EA16A1;
	Tue, 18 Feb 2020 15:41:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 282EA16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582036956;
	bh=Jga+DtnG16EUCuO/99/hqg3NIJ5KianmYE3G0GFEGvI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KpxYPbOSKHSLEPZoa2LghnjYzAJUrmt1Cw/wzizS88qlmu8HVdi5/OB/LwIdUroUc
	 0YBZ2xod6mMWO3NF/BtLvEXyQ2qkDV9xZJm7n6qu9Tzh9ON+DYdO0wCBnEV+zhfsIr
	 tir2N30P4sUHDLQ5YITSp2TYIP81t5YpOvtq8tj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE15FF8015C;
	Tue, 18 Feb 2020 15:40:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD0D0F80135; Tue, 18 Feb 2020 15:40:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3690F80135
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 15:40:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3690F80135
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 06:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="235549768"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2020 06:39:59 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 1/9] ALSA: core: Expand DMA buffer information
Date: Tue, 18 Feb 2020 15:39:16 +0100
Message-Id: <20200218143924.10565-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218143924.10565-1-cezary.rojewski@intel.com>
References: <20200218143924.10565-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
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

