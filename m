Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79410163884
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:26:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B89D1710;
	Wed, 19 Feb 2020 01:25:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B89D1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582072004;
	bh=lBrjVPTM7mDqKc4wY6qVXf08/jb58DXMPLFWGCnF2Rw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QvNYu+4umO9eHFrZmL+zF+Y7mCB45jlP4N0egS6gjobZJmwqRgqiRs/FBMcTsepfz
	 b4p+bBcuw7DmA4Jv4baVTUK/sNxDSCW5KdWg62h53NQQd6Qu5GEBXvsBtHteI3sPx6
	 2dIfDTgB3MIASoXnVMvplw4ecfBtDb6b1EgtdBLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAE61F8038C;
	Wed, 19 Feb 2020 01:11:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E9F9F8038D; Wed, 19 Feb 2020 01:11:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 03FFFF80368
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:11:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03FFFF80368
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71AD2FEC;
 Tue, 18 Feb 2020 16:11:06 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E89403F68F;
 Tue, 18 Feb 2020 16:11:05 -0800 (PST)
Date: Wed, 19 Feb 2020 00:11:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Applied "ALSA: core: Implement compress page allocation and free
 routines" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: Divya Prakash <divya1.prakash@intel.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

The patch

   ALSA: core: Implement compress page allocation and free routines

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From b9759ef2fd1acb0d3f3dce7991c44a4c5e9e68a3 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Tue, 18 Feb 2020 15:39:17 +0100
Subject: [PATCH] ALSA: core: Implement compress page allocation and free
 routines

Add simple malloc and free methods for memory management for compress
streams. Based on snd_pcm_lib_malloc_pages and snd_pcm_lib_free_pages
implementation.

Signed-off-by: Divya Prakash <divya1.prakash@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Vinod Koul <vkoul@kernel.org>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200218143924.10565-3-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
index 9de1c9a0173e..509290f2efa8 100644
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
2.20.1

