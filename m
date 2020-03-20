Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAB318D9AE
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 21:48:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A904A828;
	Fri, 20 Mar 2020 21:47:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A904A828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584737299;
	bh=BiqVLyNJO1hPbpVgb+zFK3osKPbrhOkEflzk8HnkoX0=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qoPeNIQ4i/Q0YEWIZFzjhYp8lRfi0dTAjQy4TUDbnTJkzNRASolZ/jEpqO0oJMQdd
	 vIMdXhqkyGCy1GWUBYzTrJlKgYA1R5sbagUvezz6LgiPXHPhDadl6TRPQLggnrMdf1
	 cuCpFt97DVTy6dUDHc+wJW4dBKQY7z67HPqBkeqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B753F8028E;
	Fri, 20 Mar 2020 21:46:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34F4BF80212; Fri, 20 Mar 2020 21:45:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 21438F80139
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 21:45:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21438F80139
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D35137FA;
 Fri, 20 Mar 2020 13:45:49 -0700 (PDT)
Received: from localhost (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89EFE3F792;
 Fri, 20 Mar 2020 13:45:49 -0700 (PDT)
Date: Fri, 20 Mar 2020 20:45:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: Merge for_each_rtd_cpu/codec_dais()" to the
 asoc tree
In-Reply-To: <87sgi8olet.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87sgi8olet.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

   ASoC: soc-pcm: Merge for_each_rtd_cpu/codec_dais()

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

From c840f7698d26b078695dbc863ccb6a14ca765f98 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 16 Mar 2020 15:37:14 +0900
Subject: [PATCH] ASoC: soc-pcm: Merge for_each_rtd_cpu/codec_dais()

Now we can use for_each_rtd_dais().
Let's use it instead of for_each_rtd_cpu/codec_dais().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87sgi8olet.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 311 +++++++++++---------------------------------
 1 file changed, 75 insertions(+), 236 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2b915f41e955..e256d438ee68 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -259,25 +259,15 @@ static int soc_rtd_trigger(struct snd_soc_pcm_runtime *rtd,
 static void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
 				   int stream, int action)
 {
-	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *dai;
 	int i;
 
 	lockdep_assert_held(&rtd->card->pcm_mutex);
 
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-		cpu_dai->stream_active[stream] += action;
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai)
-		codec_dai->stream_active[stream] += action;
-
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		cpu_dai->active += action;
-		cpu_dai->component->active += action;
-	}
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		codec_dai->active += action;
-		codec_dai->component->active += action;
+	for_each_rtd_dais(rtd, i, dai) {
+		dai->stream_active[stream] += action;
+		dai->active += action;
+		dai->component->active += action;
 	}
 }
 
@@ -446,8 +436,8 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *dai;
 	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_dai *codec_dai;
 	unsigned int rate, channels, sample_bits, symmetry, i;
 
 	rate = params_rate(params);
@@ -457,11 +447,8 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 	/* reject unmatched parameters when applying symmetry */
 	symmetry = rtd->dai_link->symmetric_rates;
 
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-		symmetry |= cpu_dai->driver->symmetric_rates;
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai)
-		symmetry |= codec_dai->driver->symmetric_rates;
+	for_each_rtd_cpu_dais(rtd, i, dai)
+		symmetry |= dai->driver->symmetric_rates;
 
 	if (symmetry) {
 		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
@@ -475,11 +462,8 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 
 	symmetry = rtd->dai_link->symmetric_channels;
 
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-		symmetry |= cpu_dai->driver->symmetric_channels;
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai)
-		symmetry |= codec_dai->driver->symmetric_channels;
+	for_each_rtd_dais(rtd, i, dai)
+		symmetry |= dai->driver->symmetric_channels;
 
 	if (symmetry) {
 		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
@@ -494,11 +478,8 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 
 	symmetry = rtd->dai_link->symmetric_samplebits;
 
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-		symmetry |= cpu_dai->driver->symmetric_samplebits;
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai)
-		symmetry |= codec_dai->driver->symmetric_samplebits;
+	for_each_rtd_dais(rtd, i, dai)
+		symmetry |= dai->driver->symmetric_samplebits;
 
 	if (symmetry) {
 		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
@@ -518,25 +499,18 @@ static bool soc_pcm_has_symmetry(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai_link *link = rtd->dai_link;
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *dai;
 	unsigned int symmetry, i;
 
 	symmetry = link->symmetric_rates ||
 		link->symmetric_channels ||
 		link->symmetric_samplebits;
 
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-		symmetry = symmetry ||
-			cpu_dai->driver->symmetric_rates ||
-			cpu_dai->driver->symmetric_channels ||
-			cpu_dai->driver->symmetric_samplebits;
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai)
+	for_each_rtd_dais(rtd, i, dai)
 		symmetry = symmetry ||
-			codec_dai->driver->symmetric_rates ||
-			codec_dai->driver->symmetric_channels ||
-			codec_dai->driver->symmetric_samplebits;
+			dai->driver->symmetric_rates ||
+			dai->driver->symmetric_channels ||
+			dai->driver->symmetric_samplebits;
 
 	return symmetry;
 }
@@ -774,19 +748,15 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *dai;
 	int i;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	snd_soc_runtime_deactivate(rtd, substream->stream);
 
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-		snd_soc_dai_shutdown(cpu_dai, substream);
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai)
-		snd_soc_dai_shutdown(codec_dai, substream);
+	for_each_rtd_dais(rtd, i, dai)
+		snd_soc_dai_shutdown(dai, substream);
 
 	soc_rtd_shutdown(rtd, substream);
 
@@ -818,8 +788,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *dai;
 	const char *codec_dai_name = "multicodec";
 	const char *cpu_dai_name = "multicpu";
 	int i, ret = 0;
@@ -844,28 +813,19 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	}
 
 	/* startup the audio subsystem */
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		ret = snd_soc_dai_startup(cpu_dai, substream);
+	for_each_rtd_dais(rtd, i, dai) {
+		ret = snd_soc_dai_startup(dai, substream);
 		if (ret < 0) {
-			dev_err(cpu_dai->dev, "ASoC: can't open interface %s: %d\n",
-				cpu_dai->name, ret);
-			goto cpu_dai_err;
-		}
-	}
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_startup(codec_dai, substream);
-		if (ret < 0) {
-			dev_err(codec_dai->dev,
-				"ASoC: can't open codec %s: %d\n",
-				codec_dai->name, ret);
+			dev_err(dai->dev,
+				"ASoC: can't open DAI %s: %d\n",
+				dai->name, ret);
 			goto config_err;
 		}
 
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			codec_dai->tx_mask = 0;
+			dai->tx_mask = 0;
 		else
-			codec_dai->rx_mask = 0;
+			dai->rx_mask = 0;
 	}
 
 	/* Dynamic PCM DAI links compat checks use dynamic capabilities */
@@ -905,17 +865,9 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	soc_pcm_apply_msb(substream);
 
 	/* Symmetry only applies if we've already got an active stream. */
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		if (cpu_dai->active) {
-			ret = soc_pcm_apply_symmetry(substream, cpu_dai);
-			if (ret != 0)
-				goto config_err;
-		}
-	}
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		if (codec_dai->active) {
-			ret = soc_pcm_apply_symmetry(substream, codec_dai);
+	for_each_rtd_dais(rtd, i, dai) {
+		if (dai->active) {
+			ret = soc_pcm_apply_symmetry(substream, dai);
 			if (ret != 0)
 				goto config_err;
 		}
@@ -937,11 +889,8 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 
 config_err:
-	for_each_rtd_codec_dais(rtd, i, codec_dai)
-		snd_soc_dai_shutdown(codec_dai, substream);
-cpu_dai_err:
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-		snd_soc_dai_shutdown(cpu_dai, substream);
+	for_each_rtd_dais(rtd, i, dai)
+		snd_soc_dai_shutdown(dai, substream);
 
 	soc_rtd_shutdown(rtd, substream);
 rtd_startup_err:
@@ -980,8 +929,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *dai;
 	int i, ret = 0;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -1002,21 +950,11 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 		}
 	}
 
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_prepare(codec_dai, substream);
-		if (ret < 0) {
-			dev_err(codec_dai->dev,
-				"ASoC: codec DAI prepare error: %d\n",
-				ret);
-			goto out;
-		}
-	}
-
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		ret = snd_soc_dai_prepare(cpu_dai, substream);
+	for_each_rtd_dais(rtd, i, dai) {
+		ret = snd_soc_dai_prepare(dai, substream);
 		if (ret < 0) {
-			dev_err(cpu_dai->dev,
-				"ASoC: cpu DAI prepare error: %d\n", ret);
+			dev_err(dai->dev,
+				"ASoC: DAI prepare error: %d\n", ret);
 			goto out;
 		}
 	}
@@ -1031,11 +969,8 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 	snd_soc_dapm_stream_event(rtd, substream->stream,
 			SND_SOC_DAPM_STREAM_START);
 
-	for_each_rtd_codec_dais(rtd, i, codec_dai)
-		snd_soc_dai_digital_mute(codec_dai, 0,
-					 substream->stream);
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-		snd_soc_dai_digital_mute(cpu_dai, 0, substream->stream);
+	for_each_rtd_dais(rtd, i, dai)
+		snd_soc_dai_digital_mute(dai, 0, substream->stream);
 
 out:
 	mutex_unlock(&rtd->card->pcm_mutex);
@@ -1219,44 +1154,23 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *dai;
 	int i;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	/* clear the corresponding DAIs parameters when going to be inactive */
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		if (cpu_dai->active == 1) {
-			cpu_dai->rate = 0;
-			cpu_dai->channels = 0;
-			cpu_dai->sample_bits = 0;
-		}
-	}
+	for_each_rtd_dais(rtd, i, dai) {
+		int active = dai->stream_active[substream->stream];
 
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		if (codec_dai->active == 1) {
-			codec_dai->rate = 0;
-			codec_dai->channels = 0;
-			codec_dai->sample_bits = 0;
+		if (dai->active == 1) {
+			dai->rate = 0;
+			dai->channels = 0;
+			dai->sample_bits = 0;
 		}
-	}
-
-	/* apply codec digital mute */
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		int active = codec_dai->stream_active[substream->stream];
 
 		if (active == 1)
-			snd_soc_dai_digital_mute(codec_dai, 1,
-						 substream->stream);
-	}
-
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		int active = cpu_dai->stream_active[substream->stream];
-
-		if (active == 1)
-			snd_soc_dai_digital_mute(cpu_dai, 1,
-						 substream->stream);
+			snd_soc_dai_digital_mute(dai, 1, substream->stream);
 	}
 
 	/* free any machine hw params */
@@ -1266,18 +1180,11 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 	soc_pcm_components_hw_free(substream, NULL);
 
 	/* now free hw params for the DAIs  */
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		if (!snd_soc_dai_stream_valid(codec_dai, substream->stream))
-			continue;
-
-		snd_soc_dai_hw_free(codec_dai, substream);
-	}
-
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
+	for_each_rtd_dais(rtd, i, dai) {
+		if (!snd_soc_dai_stream_valid(dai, substream->stream))
 			continue;
 
-		snd_soc_dai_hw_free(cpu_dai, substream);
+		snd_soc_dai_hw_free(dai, substream);
 	}
 
 	mutex_unlock(&rtd->card->pcm_mutex);
@@ -1288,8 +1195,7 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *dai;
 	int i, ret;
 
 	ret = soc_rtd_trigger(rtd, substream, cmd);
@@ -1302,14 +1208,8 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
 			return ret;
 	}
 
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
-		if (ret < 0)
-			return ret;
-	}
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
+	for_each_rtd_dais(rtd, i, dai) {
+		ret = snd_soc_dai_trigger(dai, substream, cmd);
 		if (ret < 0)
 			return ret;
 	}
@@ -1321,18 +1221,11 @@ static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *dai;
 	int i, ret;
 
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
-		if (ret < 0)
-			return ret;
-	}
-
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
+	for_each_rtd_dais(rtd, i, dai) {
+		ret = snd_soc_dai_trigger(dai, substream, cmd);
 		if (ret < 0)
 			return ret;
 	}
@@ -1376,18 +1269,11 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
 				   int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *dai;
 	int i, ret;
 
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_bespoke_trigger(codec_dai, substream, cmd);
-		if (ret < 0)
-			return ret;
-	}
-
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		ret = snd_soc_dai_bespoke_trigger(cpu_dai, substream, cmd);
+	for_each_rtd_dais(rtd, i, dai) {
+		ret = snd_soc_dai_bespoke_trigger(dai, substream, cmd);
 		if (ret < 0)
 			return ret;
 	}
@@ -1546,7 +1432,7 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 		if (!be->dai_link->no_pcm)
 			continue;
 
-		for_each_rtd_cpu_dais(be, i, dai) {
+		for_each_rtd_dais(be, i, dai) {
 			w = snd_soc_dai_get_widget(dai, stream);
 
 			dev_dbg(card->dev, "ASoC: try BE : %s\n",
@@ -1555,13 +1441,6 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 			if (w == widget)
 				return be;
 		}
-
-		for_each_rtd_codec_dais(be, i, dai) {
-			w = snd_soc_dai_get_widget(dai, stream);
-
-			if (w == widget)
-				return be;
-		}
 	}
 
 	/* Widget provided is not a BE */
@@ -1635,27 +1514,18 @@ static bool dpcm_be_is_active(struct snd_soc_dpcm *dpcm, int stream,
 	struct snd_soc_dai *dai;
 	unsigned int i;
 
-	/* is there a valid CPU DAI widget for this BE */
-	for_each_rtd_cpu_dais(dpcm->be, i, dai) {
+	/* is there a valid DAI widget for this BE */
+	for_each_rtd_dais(dpcm->be, i, dai) {
 		widget = snd_soc_dai_get_widget(dai, stream);
 
 		/*
-		 * The BE is pruned only if none of the cpu_dai
+		 * The BE is pruned only if none of the dai
 		 * widgets are in the active list.
 		 */
 		if (widget && widget_in_list(list, widget))
 			return true;
 	}
 
-	/* is there a valid CODEC DAI widget for this BE */
-	for_each_rtd_codec_dais(dpcm->be, i, dai) {
-		widget = snd_soc_dai_get_widget(dai, stream);
-
-		/* prune the BE if it's no longer in our active list */
-		if (widget && widget_in_list(list, widget))
-			return true;
-	}
-
 	return false;
 }
 
@@ -2001,43 +1871,23 @@ static void dpcm_runtime_merge_rate(struct snd_pcm_substream *substream,
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_pcm_stream *codec_stream;
-		struct snd_soc_pcm_stream *cpu_stream;
+		struct snd_soc_pcm_stream *pcm;
 		struct snd_soc_dai *dai;
 		int i;
 
-		for_each_rtd_cpu_dais(be, i, dai) {
+		for_each_rtd_dais(be, i, dai) {
 			/*
-			 * Skip CPUs which don't support the current stream
+			 * Skip DAIs which don't support the current stream
 			 * type. See soc_pcm_init_runtime_hw() for more details
 			 */
 			if (!snd_soc_dai_stream_valid(dai, stream))
 				continue;
 
-			cpu_stream = snd_soc_dai_get_pcm_stream(dai, stream);
+			pcm = snd_soc_dai_get_pcm_stream(dai, stream);
 
-			*rate_min = max(*rate_min, cpu_stream->rate_min);
-			*rate_max = min_not_zero(*rate_max,
-						 cpu_stream->rate_max);
-			*rates = snd_pcm_rate_mask_intersect(*rates,
-						cpu_stream->rates);
-		}
-
-		for_each_rtd_codec_dais(be, i, dai) {
-			/*
-			 * Skip CODECs which don't support the current stream
-			 * type. See soc_pcm_init_runtime_hw() for more details
-			 */
-			if (!snd_soc_dai_stream_valid(dai, stream))
-				continue;
-
-			codec_stream = snd_soc_dai_get_pcm_stream(dai, stream);
-
-			*rate_min = max(*rate_min, codec_stream->rate_min);
-			*rate_max = min_not_zero(*rate_max,
-						 codec_stream->rate_max);
-			*rates = snd_pcm_rate_mask_intersect(*rates,
-						codec_stream->rates);
+			*rate_min = max(*rate_min, pcm->rate_min);
+			*rate_max = min_not_zero(*rate_max, pcm->rate_max);
+			*rates = snd_pcm_rate_mask_intersect(*rates, pcm->rates);
 		}
 	}
 }
@@ -2120,8 +1970,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 		struct snd_pcm_substream *be_substream =
 			snd_soc_dpcm_get_substream(be, stream);
 		struct snd_soc_pcm_runtime *rtd;
-		struct snd_soc_dai *codec_dai;
-		struct snd_soc_dai *cpu_dai;
+		struct snd_soc_dai *dai;
 		int i;
 
 		/* A backend may not have the requested substream */
@@ -2136,19 +1985,9 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 			be_substream->runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
 
 		/* Symmetry only applies if we've got an active stream. */
-		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-			if (cpu_dai->active) {
-				err = soc_pcm_apply_symmetry(fe_substream,
-							     cpu_dai);
-				if (err < 0)
-					return err;
-			}
-		}
-
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (codec_dai->active) {
-				err = soc_pcm_apply_symmetry(fe_substream,
-							     codec_dai);
+		for_each_rtd_dais(rtd, i, dai) {
+			if (dai->active) {
+				err = soc_pcm_apply_symmetry(fe_substream, dai);
 				if (err < 0)
 					return err;
 			}
-- 
2.20.1

