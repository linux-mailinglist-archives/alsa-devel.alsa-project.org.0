Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9614B2F7
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 11:48:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5756A1674;
	Tue, 28 Jan 2020 11:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5756A1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580208526;
	bh=KM7+a0G9ASW1enpJmogmnBtFW8hiYVmO+FKaEZMIYYI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=StJj5IZ82zQt84SHCbrEUyf0QoXC53oDUXPlK0dJEiFs5Kh/6lGqBzZcsGmYPBvc+
	 oHWTwj7WcFgiYC16wCH9y9O+s5CvTNq0WAiQVDb4vol+GsNRDsexJGxtMI8da/Xe3Q
	 2ROE9Yr2DzJFiDOmNS8uGslvhRdN/JbUg5egAmI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97097F8028F;
	Tue, 28 Jan 2020 11:44:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC2E6F80273; Tue, 28 Jan 2020 11:44:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDC9BF80150
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 11:44:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC9BF80150
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 02:44:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,373,1574150400"; d="scan'208";a="429292897"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2020 02:44:13 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 28 Jan 2020 11:43:50 +0100
Message-Id: <20200128104356.16570-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128104356.16570-1-cezary.rojewski@intel.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Divya Prakash <divya1.prakash@intel.com>, lgirdwood@gmail.com, tiwai@suse.com,
 broonie@kernel.org
Subject: [alsa-devel] [PATCH v3 05/11] ALSA: core: Implement compress page
	allocation and free routines
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

Add simple malloc and free methods for memory management for compress
streams. Based on snd_pcm_lib_malloc_pages and snd_pcm_lib_free_pages
implementation.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Divya Prakash <divya1.prakash@intel.com>
---
 include/sound/compress_driver.h |  5 ++++
 sound/core/compress_offload.c   | 42 +++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index 00f633c0c3ba..6ce8effa0b12 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -67,6 +67,7 @@ struct snd_compr_runtime {
  * @metadata_set: metadata set flag, true when set
  * @next_track: has userspace signal next track transition, true when set
  * @private_data: pointer to DSP private data
+ * @dma_buffer: allocated buffer if any
  */
 struct snd_compr_stream {
 	const char *name;
@@ -78,6 +79,7 @@ struct snd_compr_stream {
 	bool metadata_set;
 	bool next_track;
 	void *private_data;
+	struct snd_dma_buffer dma_buffer;
 };
 
 /**
@@ -212,6 +214,9 @@ snd_compr_set_runtime_buffer(struct snd_compr_stream *stream,
 	}
 }
 
+int snd_compr_malloc_pages(struct snd_compr_stream *stream, size_t size);
+int snd_compr_free_pages(struct snd_compr_stream *stream);
+
 int snd_compr_stop_error(struct snd_compr_stream *stream,
 			 snd_pcm_state_t state);
 
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index f34ce564d92c..638c9314284f 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -488,6 +488,48 @@ snd_compr_get_codec_caps(struct snd_compr_stream *stream, unsigned long arg)
 }
 #endif /* !COMPR_CODEC_CAPS_OVERFLOW */
 
+int snd_compr_malloc_pages(struct snd_compr_stream *stream, size_t size)
+{
+	struct snd_dma_buffer *dmab;
+	int ret;
+
+	if (snd_BUG_ON(!(stream) || !(stream)->runtime))
+		return -EINVAL;
+	dmab = kzalloc(sizeof(*dmab), GFP_KERNEL);
+	if (!dmab)
+		return -ENOMEM;
+	dmab->dev = stream->dma_buffer.dev;
+	ret = snd_dma_alloc_pages(dmab->dev.type, dmab->dev.dev, size, dmab);
+	if (ret < 0) {
+		kfree(dmab);
+		return ret;
+	}
+
+	snd_compr_set_runtime_buffer(stream, dmab);
+	stream->runtime->dma_bytes = size;
+	return 1;
+}
+EXPORT_SYMBOL(snd_compr_malloc_pages);
+
+int snd_compr_free_pages(struct snd_compr_stream *stream)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+
+	if (snd_BUG_ON(!(stream) || !(stream)->runtime))
+		return -EINVAL;
+	if (runtime->dma_area == NULL)
+		return 0;
+	if (runtime->dma_buffer_p != &stream->dma_buffer) {
+		/* It's a newly allocated buffer. Release it now. */
+		snd_dma_free_pages(runtime->dma_buffer_p);
+		kfree(runtime->dma_buffer_p);
+	}
+
+	snd_compr_set_runtime_buffer(stream, NULL);
+	return 0;
+}
+EXPORT_SYMBOL(snd_compr_free_pages);
+
 /* revisit this with snd_pcm_preallocate_xxx */
 static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
 		struct snd_compr_params *params)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
