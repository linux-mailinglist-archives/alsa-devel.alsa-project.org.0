Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6A9163858
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:15:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E22CE1699;
	Wed, 19 Feb 2020 01:15:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E22CE1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071359;
	bh=m4MeKJYGqUG074xXIwPuo5vS0A4lJHFqeDeVjPkynaQ=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RcP5IsUu3jB0njQJn1VYYiWpfKb/HwYVRTCHlUaf82uOWB77MzDTU1hK0feeHuvlB
	 CeCmOKNCYI9vS9dnetgxGGD3kzWPkA6zi4kceMBnILBhKbAMFr1YYlrVcaAn0ERWJs
	 VdMvuChERsepE9/fG98zbjJkDMUQA8GdnQ4EXjS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBDFAF802DB;
	Wed, 19 Feb 2020 01:09:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19C74F8029A; Wed, 19 Feb 2020 01:09:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 748B8F8029A
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:09:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 748B8F8029A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89EA21FB;
 Tue, 18 Feb 2020 16:09:45 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D26E3F68F;
 Tue, 18 Feb 2020 16:09:44 -0800 (PST)
Date: Wed, 19 Feb 2020 00:09:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: merge playback/cature_active into
 stream_active" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

   ASoC: soc-pcm: merge playback/cature_active into stream_active

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

From 0f6011fd79a2fb92cb80177fd6bdc8aac3a3cd93 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 17 Feb 2020 17:28:15 +0900
Subject: [PATCH] ASoC: soc-pcm: merge playback/cature_active into
 stream_active

DAI has playback_active and capture_active to care usage count.
OTOH, we have SNDRV_PCM_STREAM_PLAYBACK/CAPTURE.
But because of this kind of implementation mismatch,
ALSA SoC has many verbose code.

To solve this issue, this patch merge playback_active/capture_active
into stream_active[2];

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/875zg5botu.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h   |  3 +--
 sound/soc/codecs/cs4271.c |  4 ++--
 sound/soc/dwc/dwc-i2s.c   |  4 ++--
 sound/soc/soc-core.c      | 17 +++++++++--------
 sound/soc/soc-pcm.c       | 25 ++++++++++++-------------
 5 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 04c23ac0dfff..7481e468be39 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -322,8 +322,7 @@ struct snd_soc_dai {
 	struct snd_soc_dai_driver *driver;
 
 	/* DAI runtime info */
-	unsigned int capture_active;		/* stream usage count */
-	unsigned int playback_active;		/* stream usage count */
+	unsigned int stream_active[SNDRV_PCM_STREAM_LAST + 1]; /* usage count */
 
 	unsigned int active;
 
diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 04b86a51e055..62f412d6f9f2 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -356,9 +356,9 @@ static int cs4271_hw_params(struct snd_pcm_substream *substream,
 		 */
 
 		if ((substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
-		     !dai->capture_active) ||
+		     !dai->stream_active[SNDRV_PCM_STREAM_CAPTURE]) ||
 		    (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
-		     !dai->playback_active)) {
+		     !dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK])) {
 			ret = regmap_update_bits(cs4271->regmap, CS4271_MODE2,
 						 CS4271_MODE2_PDN,
 						 CS4271_MODE2_PDN);
diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 7eeca2150b2d..a8bff6f08a69 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -427,9 +427,9 @@ static int dw_i2s_resume(struct snd_soc_component *component)
 		clk_enable(dev->clk);
 
 	for_each_component_dais(component, dai) {
-		if (dai->playback_active)
+		if (dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK])
 			dw_i2s_config(dev, SNDRV_PCM_STREAM_PLAYBACK);
-		if (dai->capture_active)
+		if (dai->stream_active[SNDRV_PCM_STREAM_CAPTURE])
 			dw_i2s_config(dev, SNDRV_PCM_STREAM_CAPTURE);
 	}
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6a58a8f6e3c4..f0ae1a7d7e09 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -365,19 +365,20 @@ EXPORT_SYMBOL_GPL(snd_soc_get_pcm_runtime);
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	int playback = SNDRV_PCM_STREAM_PLAYBACK;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	dev_dbg(rtd->dev,
 		"ASoC: pop wq checking: %s status: %s waiting: %s\n",
 		codec_dai->driver->playback.stream_name,
-		codec_dai->playback_active ? "active" : "inactive",
+		codec_dai->stream_active[playback] ? "active" : "inactive",
 		rtd->pop_wait ? "yes" : "no");
 
 	/* are we waiting on this codec DAI stream */
 	if (rtd->pop_wait == 1) {
 		rtd->pop_wait = 0;
-		snd_soc_dapm_stream_event(rtd, SNDRV_PCM_STREAM_PLAYBACK,
+		snd_soc_dapm_stream_event(rtd, playback,
 					  SND_SOC_DAPM_STREAM_STOP);
 	}
 
@@ -514,6 +515,7 @@ int snd_soc_suspend(struct device *dev)
 	struct snd_soc_card *card = dev_get_drvdata(dev);
 	struct snd_soc_component *component;
 	struct snd_soc_pcm_runtime *rtd;
+	int playback = SNDRV_PCM_STREAM_PLAYBACK;
 	int i;
 
 	/* If the card is not initialized yet there is nothing to do */
@@ -537,9 +539,8 @@ int snd_soc_suspend(struct device *dev)
 			continue;
 
 		for_each_rtd_codec_dai(rtd, i, dai) {
-			if (dai->playback_active)
-				snd_soc_dai_digital_mute(dai, 1,
-						SNDRV_PCM_STREAM_PLAYBACK);
+			if (dai->stream_active[playback])
+				snd_soc_dai_digital_mute(dai, 1, playback);
 		}
 	}
 
@@ -680,14 +681,14 @@ static void soc_resume_deferred(struct work_struct *work)
 	/* unmute any active DACs */
 	for_each_card_rtds(card, rtd) {
 		struct snd_soc_dai *dai;
+		int playback = SNDRV_PCM_STREAM_PLAYBACK;
 
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
 		for_each_rtd_codec_dai(rtd, i, dai) {
-			if (dai->playback_active)
-				snd_soc_dai_digital_mute(dai, 0,
-						SNDRV_PCM_STREAM_PLAYBACK);
+			if (dai->stream_active[playback])
+				snd_soc_dai_digital_mute(dai, 0, playback);
 		}
 	}
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 5a79a830ee18..6fd69574ca31 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -100,15 +100,9 @@ static void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
 
 	lockdep_assert_held(&rtd->card->pcm_mutex);
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		cpu_dai->playback_active += action;
-		for_each_rtd_codec_dai(rtd, i, codec_dai)
-			codec_dai->playback_active += action;
-	} else {
-		cpu_dai->capture_active += action;
-		for_each_rtd_codec_dai(rtd, i, codec_dai)
-			codec_dai->capture_active += action;
-	}
+	cpu_dai->stream_active[stream] += action;
+	for_each_rtd_codec_dai(rtd, i, codec_dai)
+		codec_dai->stream_active[stream] += action;
 
 	cpu_dai->active += action;
 	cpu_dai->component->active += action;
@@ -967,8 +961,11 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 
 	/* apply codec digital mute */
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		if ((playback && codec_dai->playback_active == 1) ||
-		    (!playback && codec_dai->capture_active == 1))
+		int playback_active = codec_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK];
+		int capture_active  = codec_dai->stream_active[SNDRV_PCM_STREAM_CAPTURE];
+
+		if ((playback && playback_active == 1) ||
+		    (!playback && capture_active == 1))
 			snd_soc_dai_digital_mute(codec_dai, 1,
 						 substream->stream);
 	}
@@ -2634,7 +2631,8 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 		goto capture;
 
 	/* skip if FE isn't currently playing */
-	if (!fe->cpu_dai->playback_active || !fe->codec_dai->playback_active)
+	if (!fe->cpu_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK] ||
+	    !fe->codec_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK])
 		goto capture;
 
 	paths = dpcm_path_get(fe, SNDRV_PCM_STREAM_PLAYBACK, &list);
@@ -2665,7 +2663,8 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 		return 0;
 
 	/* skip if FE isn't currently capturing */
-	if (!fe->cpu_dai->capture_active || !fe->codec_dai->capture_active)
+	if (!fe->cpu_dai->stream_active[SNDRV_PCM_STREAM_CAPTURE] ||
+	    !fe->codec_dai->stream_active[SNDRV_PCM_STREAM_CAPTURE])
 		return 0;
 
 	paths = dpcm_path_get(fe, SNDRV_PCM_STREAM_CAPTURE, &list);
-- 
2.20.1

