Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2FA170814
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 19:53:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63C5482A;
	Wed, 26 Feb 2020 19:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63C5482A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582743222;
	bh=zsF8Qa2LRQPjcDwppVTyT1bQfTMreBNpd0aPXySBg78=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dCT9AFlw2F1AM9x8l+eFiyNJ0h5awNYqcqIeF9ASioyhH4ZqHY/1wGcnXZwL/9KdM
	 nBdfmGRY1kaR4GzZXlFGF8uWK42wiXfQKjV2mNZF7BFSggQ246oJuo8AHQ9A9mrZ47
	 HFXvqPYCS/VXnYV/FP7KV3yYcjYzUGdZUGpX+lfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB622F802E2;
	Wed, 26 Feb 2020 19:47:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6114F802D2; Wed, 26 Feb 2020 19:47:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C8F72F802BD
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 19:47:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8F72F802BD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B33C30E;
 Wed, 26 Feb 2020 10:47:48 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 958ED3F881;
 Wed, 26 Feb 2020 10:47:47 -0800 (PST)
Date: Wed, 26 Feb 2020 18:47:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Applied "ASoC: Return error if the function does not support
 multi-cpu" to the asoc tree
In-Reply-To: <20200225133917.21314-6-yung-chuan.liao@linux.intel.com>
Message-Id: <applied-20200225133917.21314-6-yung-chuan.liao@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, Mark Brown <broonie@kernel.org>,
 bard.liao@intel.com
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

   ASoC: Return error if the function does not support multi-cpu

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

From 6e1276a5e613d25af71e3494b2dcb331d24f06ce Mon Sep 17 00:00:00 2001
From: Bard Liao <yung-chuan.liao@linux.intel.com>
Date: Tue, 25 Feb 2020 21:39:16 +0800
Subject: [PATCH] ASoC: Return error if the function does not support multi-cpu

Multi cpu is not supported by all functions yet. Add an error message
and return.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20200225133917.21314-6-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-compress.c              |  5 +++--
 sound/soc/soc-generic-dmaengine-pcm.c | 18 ++++++++++++++++++
 sound/soc/soc-pcm.c                   | 18 ++++++++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 392a1c5b15d3..50062eb79adb 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -810,9 +810,10 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 	int playback = 0, capture = 0;
 	int i;
 
-	if (rtd->num_codecs > 1) {
+	if (rtd->num_cpus > 1 ||
+	    rtd->num_codecs > 1) {
 		dev_err(rtd->card->dev,
-			"Compress ASoC: Multicodec not supported\n");
+			"Compress ASoC: Multi CPU/Codec not supported\n");
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index d6b4831e8aec..facf1922a714 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -62,6 +62,12 @@ int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 
+	if (rtd->num_cpus > 1) {
+		dev_err(rtd->dev,
+			"%s doesn't support Multi CPU yet\n", __func__);
+		return -EINVAL;
+	}
+
 	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
 
 	ret = snd_hwparams_to_dma_slave_config(substream, params, slave_config);
@@ -118,6 +124,12 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct snd_pcm_hardware hw;
 
+	if (rtd->num_cpus > 1) {
+		dev_err(rtd->dev,
+			"%s doesn't support Multi CPU yet\n", __func__);
+		return -EINVAL;
+	}
+
 	if (pcm->config && pcm->config->pcm_hardware)
 		return snd_soc_set_runtime_hwparams(substream,
 				pcm->config->pcm_hardware);
@@ -185,6 +197,12 @@ static struct dma_chan *dmaengine_pcm_compat_request_channel(
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	dma_filter_fn fn = NULL;
 
+	if (rtd->num_cpus > 1) {
+		dev_err(rtd->dev,
+			"%s doesn't support Multi CPU yet\n", __func__);
+		return NULL;
+	}
+
 	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
 
 	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX) && pcm->chan[0])
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 44694e65fc4a..adbceaff07b8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -125,6 +125,12 @@ static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
 	int stream;
 	char *buf;
 
+	if (fe->num_cpus > 1) {
+		dev_err(fe->dev,
+			"%s doesn't support Multi CPU yet\n", __func__);
+		return -EINVAL;
+	}
+
 	buf = kmalloc(out_count, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
@@ -1550,6 +1556,12 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	struct snd_soc_dai *cpu_dai = fe->cpu_dai;
 	int paths;
 
+	if (fe->num_cpus > 1) {
+		dev_err(fe->dev,
+			"%s doesn't support Multi CPU yet\n", __func__);
+		return -EINVAL;
+	}
+
 	/* get number of valid DAI paths and their widgets */
 	paths = snd_soc_dapm_dai_get_connected_widgets(cpu_dai, stream, list,
 			dpcm_end_walk_at_be);
@@ -2834,6 +2846,12 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	int count, paths;
 	int ret;
 
+	if (fe->num_cpus > 1) {
+		dev_err(fe->dev,
+			"%s doesn't support Multi CPU yet\n", __func__);
+		return -EINVAL;
+	}
+
 	if (!fe->dai_link->dynamic)
 		return 0;
 
-- 
2.20.1

