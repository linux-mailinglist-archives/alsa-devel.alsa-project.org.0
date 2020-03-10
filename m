Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D34C117FF92
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 14:55:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E17B1655;
	Tue, 10 Mar 2020 14:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E17B1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583848526;
	bh=bsC9DLNLncBa8IHaizQrDTj8QcB5F84KQsIk2ql9q2Q=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Vclzeyr3Hzfrp5X8UpZHVGlAirHTnUEr4dH17GoZXcD1p2aV99P0An27G+Qx2gCaW
	 5jFz/ApUow5hcNUQdTKAzJYc4BEfGzYA94vqp1DXGEhX71cVn6rI0JHFn/Dn2Px8iK
	 unJ1UYIaFkerTxpsQEaNR1gV/Am6igCxSG8HG8ns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 921A4F8029A;
	Tue, 10 Mar 2020 14:51:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C878FF80299; Tue, 10 Mar 2020 14:51:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 69B16F8028E
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 14:51:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69B16F8028E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F242F30E;
 Tue, 10 Mar 2020 06:51:29 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D56E3F6CF;
 Tue, 10 Mar 2020 06:51:29 -0700 (PDT)
Date: Tue, 10 Mar 2020 13:51:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc: use for_each_rtd_codecs/cpus_dai() macro" to the
 asoc tree
In-Reply-To: <87v9negogr.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87v9negogr.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: soc: use for_each_rtd_codecs/cpus_dai() macro

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

From a4be4187b2bfc66f4be8a6d35f497eb53a2c8d76 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 9 Mar 2020 13:08:04 +0900
Subject: [PATCH] ASoC: soc: use for_each_rtd_codecs/cpus_dai() macro

This patch switch to use plural form macro.

	- for_each_rtd_codec_dai()
	+ for_each_rtd_codec_dais()

	- for_each_rtd_codec_dai_rollback()
	+ for_each_rtd_codec_dais_rollback()

	- for_each_rtd_cpu_dai()
	+ for_each_rtd_cpu_dais()

	- for_each_rtd_cpu_dai_rollback()
	+ for_each_rtd_cpu_dais_rollback()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87v9negogr.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c |  16 +++---
 sound/soc/soc-dapm.c |  10 ++--
 sound/soc/soc-pcm.c  | 124 +++++++++++++++++++++----------------------
 3 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f2cfbf182f49..4e0f55555e37 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -547,7 +547,7 @@ int snd_soc_suspend(struct device *dev)
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		for_each_rtd_codec_dai(rtd, i, dai) {
+		for_each_rtd_codec_dais(rtd, i, dai) {
 			if (dai->stream_active[playback])
 				snd_soc_dai_digital_mute(dai, 1, playback);
 		}
@@ -689,7 +689,7 @@ static void soc_resume_deferred(struct work_struct *work)
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		for_each_rtd_codec_dai(rtd, i, dai) {
+		for_each_rtd_codec_dais(rtd, i, dai) {
 			if (dai->stream_active[playback])
 				snd_soc_dai_digital_mute(dai, 0, playback);
 		}
@@ -1321,10 +1321,10 @@ static void soc_remove_link_dais(struct snd_soc_card *card)
 	for_each_comp_order(order) {
 		for_each_card_rtds(card, rtd) {
 			/* remove the CODEC DAI */
-			for_each_rtd_codec_dai(rtd, i, codec_dai)
+			for_each_rtd_codec_dais(rtd, i, codec_dai)
 				soc_remove_dai(codec_dai, order);
 
-			for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
 				soc_remove_dai(cpu_dai, order);
 		}
 	}
@@ -1344,14 +1344,14 @@ static int soc_probe_link_dais(struct snd_soc_card *card)
 				card->name, rtd->num, order);
 
 			/* probe the CPU DAI */
-			for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 				ret = soc_probe_dai(cpu_dai, order);
 				if (ret)
 					return ret;
 			}
 
 			/* probe the CODEC DAI */
-			for_each_rtd_codec_dai(rtd, i, codec_dai) {
+			for_each_rtd_codec_dais(rtd, i, codec_dai) {
 				ret = soc_probe_dai(codec_dai, order);
 				if (ret)
 					return ret;
@@ -1486,7 +1486,7 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	unsigned int i;
 	int ret;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt);
 		if (ret != 0 && ret != -ENOTSUPP) {
 			dev_warn(codec_dai->dev,
@@ -1514,7 +1514,7 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 		inv_dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
 		break;
 	}
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		unsigned int fmt = dai_fmt;
 
 		if (cpu_dai->component->driver->non_legacy_dai_naming)
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 09fa437fc33e..7374829c6675 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2437,7 +2437,7 @@ static ssize_t dapm_widget_show(struct device *dev,
 
 	mutex_lock(&rtd->card->dapm_mutex);
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		struct snd_soc_component *cmpnt = codec_dai->component;
 
 		count += dapm_widget_show_component(cmpnt, buf + count);
@@ -4362,11 +4362,11 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 	int i;
 
 	if (rtd->num_cpus == 1) {
-		for_each_rtd_codec_dai(rtd, i, codec_dai)
+		for_each_rtd_codec_dais(rtd, i, codec_dai)
 			dapm_add_valid_dai_widget(card, rtd, codec_dai,
 						  rtd->cpu_dais[0]);
 	} else if (rtd->num_codecs == rtd->num_cpus) {
-		for_each_rtd_codec_dai(rtd, i, codec_dai)
+		for_each_rtd_codec_dais(rtd, i, codec_dai)
 			dapm_add_valid_dai_widget(card, rtd, codec_dai,
 						  rtd->cpu_dais[i]);
 	} else {
@@ -4437,9 +4437,9 @@ static void soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
 	struct snd_soc_dai *cpu_dai;
 	int i;
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
 		soc_dapm_dai_stream_event(cpu_dai, stream, event);
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
 		soc_dapm_dai_stream_event(codec_dai, stream, event);
 
 	dapm_power_widgets(rtd->card, event);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e7915adaaf0a..fbea005043de 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -265,17 +265,17 @@ static void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
 
 	lockdep_assert_held(&rtd->card->pcm_mutex);
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
 		cpu_dai->stream_active[stream] += action;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
 		codec_dai->stream_active[stream] += action;
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		cpu_dai->active += action;
 		cpu_dai->component->active += action;
 	}
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		codec_dai->active += action;
 		codec_dai->component->active += action;
 	}
@@ -455,14 +455,14 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 	/* reject unmatched parameters when applying symmetry */
 	symmetry = rtd->dai_link->symmetric_rates;
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
 		symmetry |= cpu_dai->driver->symmetric_rates;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
 		symmetry |= codec_dai->driver->symmetric_rates;
 
 	if (symmetry) {
-		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 			if (cpu_dai->rate && cpu_dai->rate != rate) {
 				dev_err(rtd->dev, "ASoC: unmatched rate symmetry: %d - %d\n",
 					cpu_dai->rate, rate);
@@ -473,14 +473,14 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 
 	symmetry = rtd->dai_link->symmetric_channels;
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
 		symmetry |= cpu_dai->driver->symmetric_channels;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
 		symmetry |= codec_dai->driver->symmetric_channels;
 
 	if (symmetry) {
-		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 			if (cpu_dai->channels &&
 			    cpu_dai->channels != channels) {
 				dev_err(rtd->dev, "ASoC: unmatched channel symmetry: %d - %d\n",
@@ -492,14 +492,14 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 
 	symmetry = rtd->dai_link->symmetric_samplebits;
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
 		symmetry |= cpu_dai->driver->symmetric_samplebits;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
 		symmetry |= codec_dai->driver->symmetric_samplebits;
 
 	if (symmetry) {
-		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 			if (cpu_dai->sample_bits &&
 			    cpu_dai->sample_bits != sample_bits) {
 				dev_err(rtd->dev, "ASoC: unmatched sample bits symmetry: %d - %d\n",
@@ -524,13 +524,13 @@ static bool soc_pcm_has_symmetry(struct snd_pcm_substream *substream)
 		link->symmetric_channels ||
 		link->symmetric_samplebits;
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
 		symmetry = symmetry ||
 			cpu_dai->driver->symmetric_rates ||
 			cpu_dai->driver->symmetric_channels ||
 			cpu_dai->driver->symmetric_samplebits;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
 		symmetry = symmetry ||
 			codec_dai->driver->symmetric_rates ||
 			codec_dai->driver->symmetric_channels ||
@@ -563,7 +563,7 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 	int i;
 	unsigned int bits = 0, cpu_bits = 0;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		pcm_codec = snd_soc_dai_get_pcm_stream(codec_dai, stream);
 
 		if (pcm_codec->sig_bits == 0) {
@@ -573,7 +573,7 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 		bits = max(pcm_codec->sig_bits, bits);
 	}
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		pcm_cpu = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
 
 		if (pcm_cpu->sig_bits == 0) {
@@ -612,7 +612,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 	int i;
 
 	/* first calculate min/max only for CPUs in the DAI link */
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 
 		/*
 		 * Skip CPUs which don't support the current stream type.
@@ -635,7 +635,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	/* second calculate min/max only for CODECs in the DAI link */
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 
 		/*
 		 * Skip CODECs which don't support the current stream type.
@@ -780,10 +780,10 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 
 	snd_soc_runtime_deactivate(rtd, substream->stream);
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
 		snd_soc_dai_shutdown(cpu_dai, substream);
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
 		snd_soc_dai_shutdown(codec_dai, substream);
 
 	soc_rtd_shutdown(rtd, substream);
@@ -842,7 +842,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	}
 
 	/* startup the audio subsystem */
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		ret = snd_soc_dai_startup(cpu_dai, substream);
 		if (ret < 0) {
 			dev_err(cpu_dai->dev, "ASoC: can't open interface %s: %d\n",
@@ -851,7 +851,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 		}
 	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_startup(codec_dai, substream);
 		if (ret < 0) {
 			dev_err(codec_dai->dev,
@@ -903,7 +903,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	soc_pcm_apply_msb(substream);
 
 	/* Symmetry only applies if we've already got an active stream. */
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		if (cpu_dai->active) {
 			ret = soc_pcm_apply_symmetry(substream, cpu_dai);
 			if (ret != 0)
@@ -911,7 +911,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 		}
 	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		if (codec_dai->active) {
 			ret = soc_pcm_apply_symmetry(substream, codec_dai);
 			if (ret != 0)
@@ -935,10 +935,10 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 
 config_err:
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
 		snd_soc_dai_shutdown(codec_dai, substream);
 cpu_dai_err:
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
 		snd_soc_dai_shutdown(cpu_dai, substream);
 
 	soc_rtd_shutdown(rtd, substream);
@@ -1000,7 +1000,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 		}
 	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_prepare(codec_dai, substream);
 		if (ret < 0) {
 			dev_err(codec_dai->dev,
@@ -1010,7 +1010,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 		}
 	}
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		ret = snd_soc_dai_prepare(cpu_dai, substream);
 		if (ret < 0) {
 			dev_err(cpu_dai->dev,
@@ -1029,10 +1029,10 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 	snd_soc_dapm_stream_event(rtd, substream->stream,
 			SND_SOC_DAPM_STREAM_START);
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
 		snd_soc_dai_digital_mute(codec_dai, 0,
 					 substream->stream);
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
 		snd_soc_dai_digital_mute(cpu_dai, 0, substream->stream);
 
 out:
@@ -1097,7 +1097,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 		goto out;
 	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		struct snd_pcm_hw_params codec_params;
 
 		/*
@@ -1144,7 +1144,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_dapm_update_dai(substream, &codec_params, codec_dai);
 	}
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		/*
 		 * Skip CPUs which don't support the current stream
 		 * type. See soc_pcm_init_runtime_hw() for more details
@@ -1186,7 +1186,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	i = rtd->num_cpus;
 
 interface_err:
-	for_each_rtd_cpu_dai_rollback(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais_rollback(rtd, i, cpu_dai) {
 		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
 			continue;
 
@@ -1197,7 +1197,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	i = rtd->num_codecs;
 
 codec_err:
-	for_each_rtd_codec_dai_rollback(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais_rollback(rtd, i, codec_dai) {
 		if (!snd_soc_dai_stream_valid(codec_dai, substream->stream))
 			continue;
 
@@ -1224,7 +1224,7 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	/* clear the corresponding DAIs parameters when going to be inactive */
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		if (cpu_dai->active == 1) {
 			cpu_dai->rate = 0;
 			cpu_dai->channels = 0;
@@ -1232,7 +1232,7 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 		}
 	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		if (codec_dai->active == 1) {
 			codec_dai->rate = 0;
 			codec_dai->channels = 0;
@@ -1241,7 +1241,7 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 	}
 
 	/* apply codec digital mute */
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		int active = codec_dai->stream_active[substream->stream];
 
 		if (active == 1)
@@ -1249,7 +1249,7 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 						 substream->stream);
 	}
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		int active = cpu_dai->stream_active[substream->stream];
 
 		if (active == 1)
@@ -1264,14 +1264,14 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 	soc_pcm_components_hw_free(substream, NULL);
 
 	/* now free hw params for the DAIs  */
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		if (!snd_soc_dai_stream_valid(codec_dai, substream->stream))
 			continue;
 
 		snd_soc_dai_hw_free(codec_dai, substream);
 	}
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
 			continue;
 
@@ -1300,13 +1300,13 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
 			return ret;
 	}
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
 		if (ret < 0)
 			return ret;
 	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
 		if (ret < 0)
 			return ret;
@@ -1323,13 +1323,13 @@ static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
 		if (ret < 0)
 			return ret;
 	}
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
 		if (ret < 0)
 			return ret;
@@ -1378,13 +1378,13 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_bespoke_trigger(codec_dai, substream, cmd);
 		if (ret < 0)
 			return ret;
 	}
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		ret = snd_soc_dai_bespoke_trigger(cpu_dai, substream, cmd);
 		if (ret < 0)
 			return ret;
@@ -1417,13 +1417,13 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
 	/* base delay if assigned in pointer callback */
 	delay = runtime->delay;
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		cpu_delay = max(cpu_delay,
 				snd_soc_dai_delay(cpu_dai, substream));
 	}
 	delay += cpu_delay;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		codec_delay = max(codec_delay,
 				  snd_soc_dai_delay(codec_dai, substream));
 	}
@@ -1544,7 +1544,7 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 		if (!be->dai_link->no_pcm)
 			continue;
 
-		for_each_rtd_cpu_dai(be, i, dai) {
+		for_each_rtd_cpu_dais(be, i, dai) {
 			w = snd_soc_dai_get_widget(dai, stream);
 
 			dev_dbg(card->dev, "ASoC: try BE : %s\n",
@@ -1554,7 +1554,7 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 				return be;
 		}
 
-		for_each_rtd_codec_dai(be, i, dai) {
+		for_each_rtd_codec_dais(be, i, dai) {
 			w = snd_soc_dai_get_widget(dai, stream);
 
 			if (w == widget)
@@ -1642,7 +1642,7 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 
 		/* is there a valid CPU DAI widget for this BE */
 		do_prune = 1;
-		for_each_rtd_cpu_dai(dpcm->be, i, dai) {
+		for_each_rtd_cpu_dais(dpcm->be, i, dai) {
 			widget = snd_soc_dai_get_widget(dai, stream);
 
 			/*
@@ -1657,7 +1657,7 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 
 		/* is there a valid CODEC DAI widget for this BE */
 		do_prune = 1;
-		for_each_rtd_codec_dai(dpcm->be, i, dai) {
+		for_each_rtd_codec_dais(dpcm->be, i, dai) {
 			widget = snd_soc_dai_get_widget(dai, stream);
 
 			/* prune the BE if it's no longer in our active list */
@@ -1910,7 +1910,7 @@ static void dpcm_runtime_merge_format(struct snd_pcm_substream *substream,
 		struct snd_soc_pcm_stream *codec_stream;
 		int i;
 
-		for_each_rtd_codec_dai(be, i, dai) {
+		for_each_rtd_codec_dais(be, i, dai) {
 			/*
 			 * Skip CODECs which don't support the current stream
 			 * type. See soc_pcm_init_runtime_hw() for more details
@@ -1948,7 +1948,7 @@ static void dpcm_runtime_merge_chan(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai;
 		int i;
 
-		for_each_rtd_cpu_dai(be, i, dai) {
+		for_each_rtd_cpu_dais(be, i, dai) {
 			/*
 			 * Skip CPUs which don't support the current stream
 			 * type. See soc_pcm_init_runtime_hw() for more details
@@ -2003,7 +2003,7 @@ static void dpcm_runtime_merge_rate(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai;
 		int i;
 
-		for_each_rtd_cpu_dai(be, i, dai) {
+		for_each_rtd_cpu_dais(be, i, dai) {
 			/*
 			 * Skip CPUs which don't support the current stream
 			 * type. See soc_pcm_init_runtime_hw() for more details
@@ -2020,7 +2020,7 @@ static void dpcm_runtime_merge_rate(struct snd_pcm_substream *substream,
 						cpu_stream->rates);
 		}
 
-		for_each_rtd_codec_dai(be, i, dai) {
+		for_each_rtd_codec_dais(be, i, dai) {
 			/*
 			 * Skip CODECs which don't support the current stream
 			 * type. See soc_pcm_init_runtime_hw() for more details
@@ -2046,7 +2046,7 @@ static void dpcm_set_fe_runtime(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *cpu_dai;
 	int i;
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		/*
 		 * Skip CPUs which don't support the current stream
 		 * type. See soc_pcm_init_runtime_hw() for more details
@@ -2102,7 +2102,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 	if (soc_pcm_has_symmetry(fe_substream))
 		fe_substream->runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
 
-	for_each_rtd_cpu_dai (fe, i, fe_cpu_dai) {
+	for_each_rtd_cpu_dais (fe, i, fe_cpu_dai) {
 		/* Symmetry only applies if we've got an active stream. */
 		if (fe_cpu_dai->active) {
 			err = soc_pcm_apply_symmetry(fe_substream, fe_cpu_dai);
@@ -2133,7 +2133,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 			be_substream->runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
 
 		/* Symmetry only applies if we've got an active stream. */
-		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 			if (cpu_dai->active) {
 				err = soc_pcm_apply_symmetry(fe_substream,
 							     cpu_dai);
@@ -2142,7 +2142,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 			}
 		}
 
-		for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			if (codec_dai->active) {
 				err = soc_pcm_apply_symmetry(fe_substream,
 							     codec_dai);
@@ -3075,7 +3075,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		int cpu_playback = rtd->dai_link->params ?
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
-		for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			if (rtd->num_cpus == 1) {
 				cpu_dai = rtd->cpu_dais[0];
 			} else if (rtd->num_cpus == rtd->num_codecs) {
-- 
2.20.1

