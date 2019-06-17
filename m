Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B6948760
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 17:35:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9396117A8;
	Mon, 17 Jun 2019 17:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9396117A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560785726;
	bh=n6pPfg25Pw1q553+/uACY7X9cRx8cVk/eNFG1ZoSqok=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aXqxmL7HiiRog6Il+nrfWDW3aoqHYJWnR37FLS2P61uXI0QPr0InK7l3DI/kXdfq9
	 lXcYghm+fw61VvEtCX6ICQybeVrbii40nMZZXTLJiEissssTPEAwq4DUPvaehxqHMG
	 xVUqd6Rd3W12VYCZznFw7GeLfWE6rjVuGWnEJtAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9785F8977B;
	Mon, 17 Jun 2019 17:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5C0EF89737; Mon, 17 Jun 2019 17:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54D92F89717
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 17:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54D92F89717
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TqIrw+I9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=1MsCQ2hQ7izF7FO5bVAzO/2S9WbWG02IipvTL6MKXjM=; b=TqIrw+I9j8kC
 2pgfhQu0y+yV0lUr/s9CoQkEkUbZ8Id/m8i0LooUT7mUoneyERTrtxJfM/x+KQ2BeSaTTZSJ2U6CM
 S4ficvcW6n2zlRllvw4OWOmV7tUHkJCYUIucc18q2DNGdcTL99999s4TGqPx+/sbz0Sh3tyPRGWCD
 370UA=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hctUe-0001yQ-T9; Mon, 17 Jun 2019 15:24:24 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 5C143440046; Mon, 17 Jun 2019 16:24:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20190612172347.22338-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190617152424.5C143440046@finisterre.sirena.org.uk>
Date: Mon, 17 Jun 2019 16:24:24 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: release link DMA for
	paused streams during suspend" to the asoc tree
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

The patch

   ASoC: SOF: Intel: hda: release link DMA for paused streams during suspend

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 7077a07a72d38a78040873bbc13a77d1e45f8aa0 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 12 Jun 2019 12:23:38 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: release link DMA for paused streams
 during suspend

Paused streams do not get suspended when the system enters S3.
So, clear and release link DMA channel for such streams in the
hda_dsp_set_hw_params_upon_resume() callback. Also, invalidate
the link DMA channel in the DAI config before restoring the
dai config upon resume. Also, modify the signature for the
set_hw_params_upon_resume() op to return an int.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 29 ++++++++++++++++++++++++++++-
 sound/soc/sof/intel/hda.h     |  2 +-
 sound/soc/sof/ops.h           |  5 +++--
 sound/soc/sof/pm.c            | 24 ++++++++++++++++++++----
 sound/soc/sof/sof-priv.h      |  2 +-
 5 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 5b73115a0b78..c6eea3079ab7 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -454,18 +454,45 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, int state)
 	return 0;
 }
 
-void hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
+int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sof_intel_hda_stream *hda_stream;
 	struct hdac_ext_stream *stream;
 	struct hdac_stream *s;
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	struct snd_soc_pcm_runtime *rtd;
+	struct hdac_ext_link *link;
+	const char *name;
+	int stream_tag;
+#endif
+
 	/* set internal flag for BE */
 	list_for_each_entry(s, &bus->stream_list, list) {
 		stream = stream_to_hdac_ext_stream(s);
 		hda_stream = container_of(stream, struct sof_intel_hda_stream,
 					  hda_stream);
 		hda_stream->hw_params_upon_resume = 1;
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+		/*
+		 * clear and release stream. This should already be taken care
+		 * for running streams when the SUSPEND trigger is called.
+		 * But paused streams do not get suspended, so this needs to be
+		 * done explicitly during suspend.
+		 */
+		if (stream->link_substream) {
+			rtd = snd_pcm_substream_chip(stream->link_substream);
+			name = rtd->codec_dai->component->name;
+			link = snd_hdac_ext_bus_get_link(bus, name);
+			if (!link)
+				return -EINVAL;
+			stream_tag = hdac_stream(stream)->stream_tag;
+			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+			snd_hdac_ext_stream_release(stream,
+						    HDAC_EXT_STREAM_TYPE_LINK);
+		}
+#endif
 	}
+	return 0;
 }
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 2862b4b3b07c..327621ef5cf3 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -451,7 +451,7 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, int state);
 int hda_dsp_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev, int state);
 int hda_dsp_runtime_resume(struct snd_sof_dev *sdev);
-void hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
+int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
 void hda_dsp_dump_skl(struct snd_sof_dev *sdev, u32 flags);
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
 void hda_ipc_dump(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 80fc3b374c2b..a23297353750 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -134,10 +134,11 @@ static inline int snd_sof_dsp_runtime_suspend(struct snd_sof_dev *sdev,
 	return 0;
 }
 
-static inline void snd_sof_dsp_hw_params_upon_resume(struct snd_sof_dev *sdev)
+static inline int snd_sof_dsp_hw_params_upon_resume(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev)->set_hw_params_upon_resume)
-		sof_ops(sdev)->set_hw_params_upon_resume(sdev);
+		return sof_ops(sdev)->set_hw_params_upon_resume(sdev);
+	return 0;
 }
 
 static inline int snd_sof_dsp_set_clk(struct snd_sof_dev *sdev, u32 freq)
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index b7843f02ef67..8eeb3a1029f2 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -153,6 +153,15 @@ static int sof_restore_pipelines(struct snd_sof_dev *sdev)
 			continue;
 		}
 
+		/*
+		 * The link DMA channel would be invalidated for running
+		 * streams but not for streams that were in the PAUSED
+		 * state during suspend. So invalidate it here before setting
+		 * the dai config in the DSP.
+		 */
+		if (config->type == SOF_DAI_INTEL_HDA)
+			config->hda.link_dma_ch = DMA_CHAN_INVALID;
+
 		ret = sof_ipc_tx_message(sdev->ipc,
 					 config->hdr.cmd, config,
 					 config->hdr.size,
@@ -204,7 +213,7 @@ static int sof_send_pm_ipc(struct snd_sof_dev *sdev, int cmd)
 				 sizeof(pm_ctx), &reply, sizeof(reply));
 }
 
-static void sof_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
+static int sof_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_sof_pcm *spcm;
@@ -229,7 +238,7 @@ static void sof_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 	}
 
 	/* set internal flag for BE */
-	snd_sof_dsp_hw_params_upon_resume(sdev);
+	return snd_sof_dsp_hw_params_upon_resume(sdev);
 }
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
@@ -333,8 +342,15 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	snd_sof_release_trace(sdev);
 
 	/* set restore_stream for all streams during system suspend */
-	if (!runtime_suspend)
-		sof_set_hw_params_upon_resume(sdev);
+	if (!runtime_suspend) {
+		ret = sof_set_hw_params_upon_resume(sdev);
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"error: setting hw_params flag during suspend %d\n",
+				ret);
+			return ret;
+		}
+	}
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
 	/* cache debugfs contents during runtime suspend */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index b80d93e5df2f..cf1b047f8cb6 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -172,7 +172,7 @@ struct snd_sof_dsp_ops {
 	int (*runtime_suspend)(struct snd_sof_dev *sof_dev,
 			       int state); /* optional */
 	int (*runtime_resume)(struct snd_sof_dev *sof_dev); /* optional */
-	void (*set_hw_params_upon_resume)(struct snd_sof_dev *sdev); /* optional */
+	int (*set_hw_params_upon_resume)(struct snd_sof_dev *sdev); /* optional */
 
 	/* DSP clocking */
 	int (*set_clk)(struct snd_sof_dev *sof_dev, u32 freq); /* optional */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
