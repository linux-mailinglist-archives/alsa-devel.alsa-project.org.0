Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D4A195A43
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:50:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61C80169A;
	Fri, 27 Mar 2020 16:49:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61C80169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324200;
	bh=t2DdIcpSigJsMbnPueF2nfmkSguSDO3cnWxvmTKRcZk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=o5P/Z4TL4WeS6qBbScqEaXiYPYHFJZ32j+zZ+jDXfaeErIqREfBG7JA+NE150EyX8
	 STEIJA7M5sn8tG8lHvMHbUgCCvXutuoY1qdGHlDuz9LGjl7QQDV5J6hLJ00dXbM9O5
	 XtwdsZWc3NB5M8OB4Buh0nW6dh9IXE21xJR5hfXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2FFFF80290;
	Fri, 27 Mar 2020 16:35:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54A90F8038F; Fri, 27 Mar 2020 16:35:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1D10BF8011E
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:35:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D10BF8011E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E7DA1FB;
 Fri, 27 Mar 2020 08:35:19 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 116B93F71F;
 Fri, 27 Mar 2020 08:35:18 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:35:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: sh: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer" to the asoc tree
In-Reply-To: <87eetjir4x.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87eetjir4x.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

   ASoC: sh: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From 34a43780622ace5a495d1dd661e5d493123d4e3f Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:20:30 +0900
Subject: [PATCH] ASoC: sh: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87eetjir4x.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/dma-sh7760.c | 16 ++++++++--------
 sound/soc/sh/fsi.c        |  2 +-
 sound/soc/sh/migor.c      |  6 +++---
 sound/soc/sh/rcar/core.c  |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/sh/dma-sh7760.c
index eee1a1e994cb..a35de78f14a9 100644
--- a/sound/soc/sh/dma-sh7760.c
+++ b/sound/soc/sh/dma-sh7760.c
@@ -119,7 +119,7 @@ static int camelot_pcm_open(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct camelot_pcm *cam = &cam_pcm_data[rtd->cpu_dai->id];
+	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 	int ret, dmairq;
 
@@ -132,7 +132,7 @@ static int camelot_pcm_open(struct snd_soc_component *component,
 		ret = dmabrg_request_irq(dmairq, camelot_rxdma, cam);
 		if (unlikely(ret)) {
 			pr_debug("audio unit %d irqs already taken!\n",
-			     rtd->cpu_dai->id);
+			     asoc_rtd_to_cpu(rtd, 0)->id);
 			return -EBUSY;
 		}
 		(void)dmabrg_request_irq(dmairq + 1,camelot_rxdma, cam);
@@ -141,7 +141,7 @@ static int camelot_pcm_open(struct snd_soc_component *component,
 		ret = dmabrg_request_irq(dmairq, camelot_txdma, cam);
 		if (unlikely(ret)) {
 			pr_debug("audio unit %d irqs already taken!\n",
-			     rtd->cpu_dai->id);
+			     asoc_rtd_to_cpu(rtd, 0)->id);
 			return -EBUSY;
 		}
 		(void)dmabrg_request_irq(dmairq + 1, camelot_txdma, cam);
@@ -153,7 +153,7 @@ static int camelot_pcm_close(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct camelot_pcm *cam = &cam_pcm_data[rtd->cpu_dai->id];
+	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 	int dmairq;
 
@@ -175,7 +175,7 @@ static int camelot_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct camelot_pcm *cam = &cam_pcm_data[rtd->cpu_dai->id];
+	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 	int ret;
 
@@ -194,7 +194,7 @@ static int camelot_prepare(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct camelot_pcm *cam = &cam_pcm_data[rtd->cpu_dai->id];
+	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
 
 	pr_debug("PCM data: addr 0x%08lx len %d\n",
 		 (u32)runtime->dma_addr, runtime->dma_bytes);
@@ -242,7 +242,7 @@ static int camelot_trigger(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct camelot_pcm *cam = &cam_pcm_data[rtd->cpu_dai->id];
+	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 
 	switch (cmd) {
@@ -270,7 +270,7 @@ static snd_pcm_uframes_t camelot_pos(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct camelot_pcm *cam = &cam_pcm_data[rtd->cpu_dai->id];
+	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 	unsigned long pos;
 
diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 5ef4221be6c3..1c3c4fdc9bef 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -408,7 +408,7 @@ static struct snd_soc_dai *fsi_get_dai(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 
-	return  rtd->cpu_dai;
+	return  asoc_rtd_to_cpu(rtd, 0);
 }
 
 static struct fsi_priv *fsi_get_priv_frm_dai(struct snd_soc_dai *dai)
diff --git a/sound/soc/sh/migor.c b/sound/soc/sh/migor.c
index 991557e25eba..d5702fbf176b 100644
--- a/sound/soc/sh/migor.c
+++ b/sound/soc/sh/migor.c
@@ -46,7 +46,7 @@ static int migor_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 	unsigned int rate = params_rate(params);
 
@@ -67,7 +67,7 @@ static int migor_hw_params(struct snd_pcm_substream *substream,
 	clk_set_rate(&siumckb_clk, codec_freq);
 	dev_dbg(codec_dai->dev, "%s: configure %luHz\n", __func__, codec_freq);
 
-	ret = snd_soc_dai_set_sysclk(rtd->cpu_dai, SIU_CLKB_EXT,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), SIU_CLKB_EXT,
 				     codec_freq / 2, SND_SOC_CLOCK_IN);
 
 	if (!ret)
@@ -79,7 +79,7 @@ static int migor_hw_params(struct snd_pcm_substream *substream,
 static int migor_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	if (use_count) {
 		use_count--;
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 0bfcb77e5f65..4349f2fb823f 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -696,7 +696,7 @@ struct snd_soc_dai *rsnd_substream_to_dai(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 
-	return  rtd->cpu_dai;
+	return  asoc_rtd_to_cpu(rtd, 0);
 }
 
 static
-- 
2.20.1

