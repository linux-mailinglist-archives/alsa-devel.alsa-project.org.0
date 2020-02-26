Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E217081C
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 19:55:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E17E416A9;
	Wed, 26 Feb 2020 19:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E17E416A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582743334;
	bh=Y1pw03pV16tKHtf458SuNbgIoPGXbW2kermQ8jXby+U=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pcYYV+Y6LmVyYAkjgOww65BO0qHC1sCiZyOhrpiuX3BYnzR0H9A9Qw5tEzFv/6OfU
	 /qG+FzhZNIOJ9DcZ9APXFKHwIbjjsYqMRKj/MP3c03ZE67CaQVF7qxkKtUFoPYGAHw
	 c6vsPfP9ML6AWYT9th8g+7jueRC0ldlykCjJmU/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B5ACF80303;
	Wed, 26 Feb 2020 19:48:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC972F80303; Wed, 26 Feb 2020 19:48:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 37F03F802FE
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 19:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37F03F802FE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82F454B2;
 Wed, 26 Feb 2020 10:48:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C11703F881;
 Wed, 26 Feb 2020 10:48:01 -0800 (PST)
Date: Wed, 26 Feb 2020 18:48:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Shreyas NC <shreyas.nc@intel.com>
Subject: Applied "ASoC: Add multiple CPU DAI support for PCM ops" to the asoc
 tree
In-Reply-To: <20200225133917.21314-3-yung-chuan.liao@linux.intel.com>
Message-Id: <applied-20200225133917.21314-3-yung-chuan.liao@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
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

   ASoC: Add multiple CPU DAI support for PCM ops

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

From 19bdcc7aeed4169820be6a683c422fc06d030136 Mon Sep 17 00:00:00 2001
From: Shreyas NC <shreyas.nc@intel.com>
Date: Tue, 25 Feb 2020 21:39:13 +0800
Subject: [PATCH] ASoC: Add multiple CPU DAI support for PCM ops

Add support in PCM operations to invoke multiple cpu dais as we do
for multiple codec dais. Also the symmetry calculations are updated to
reflect multiple cpu dais.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Shreyas NC <shreyas.nc@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20200225133917.21314-3-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 396 +++++++++++++++++++++++++++++---------------
 1 file changed, 261 insertions(+), 135 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 4c27c77206f1..44694e65fc4a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -253,18 +253,22 @@ static int soc_rtd_trigger(struct snd_soc_pcm_runtime *rtd,
 static void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
 				   int stream, int action)
 {
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
 
 	lockdep_assert_held(&rtd->card->pcm_mutex);
 
-	cpu_dai->stream_active[stream] += action;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		cpu_dai->stream_active[stream] += action;
+
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		codec_dai->stream_active[stream] += action;
 
-	cpu_dai->active += action;
-	cpu_dai->component->active += action;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		cpu_dai->active += action;
+		cpu_dai->component->active += action;
+	}
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 		codec_dai->active += action;
 		codec_dai->component->active += action;
@@ -434,7 +438,7 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	unsigned int rate, channels, sample_bits, symmetry, i;
 
@@ -443,40 +447,60 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 	sample_bits = snd_pcm_format_physical_width(params_format(params));
 
 	/* reject unmatched parameters when applying symmetry */
-	symmetry = cpu_dai->driver->symmetric_rates ||
-		rtd->dai_link->symmetric_rates;
+	symmetry = rtd->dai_link->symmetric_rates;
+
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		symmetry |= cpu_dai->driver->symmetric_rates;
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		symmetry |= codec_dai->driver->symmetric_rates;
 
-	if (symmetry && cpu_dai->rate && cpu_dai->rate != rate) {
-		dev_err(rtd->dev, "ASoC: unmatched rate symmetry: %d - %d\n",
-				cpu_dai->rate, rate);
-		return -EINVAL;
+	if (symmetry) {
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (cpu_dai->rate && cpu_dai->rate != rate) {
+				dev_err(rtd->dev, "ASoC: unmatched rate symmetry: %d - %d\n",
+					cpu_dai->rate, rate);
+				return -EINVAL;
+			}
+		}
 	}
 
-	symmetry = cpu_dai->driver->symmetric_channels ||
-		rtd->dai_link->symmetric_channels;
+	symmetry = rtd->dai_link->symmetric_channels;
+
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		symmetry |= cpu_dai->driver->symmetric_channels;
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		symmetry |= codec_dai->driver->symmetric_channels;
 
-	if (symmetry && cpu_dai->channels && cpu_dai->channels != channels) {
-		dev_err(rtd->dev, "ASoC: unmatched channel symmetry: %d - %d\n",
-				cpu_dai->channels, channels);
-		return -EINVAL;
+	if (symmetry) {
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (cpu_dai->channels &&
+			    cpu_dai->channels != channels) {
+				dev_err(rtd->dev, "ASoC: unmatched channel symmetry: %d - %d\n",
+					cpu_dai->channels, channels);
+				return -EINVAL;
+			}
+		}
 	}
 
-	symmetry = cpu_dai->driver->symmetric_samplebits ||
-		rtd->dai_link->symmetric_samplebits;
+	symmetry = rtd->dai_link->symmetric_samplebits;
+
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		symmetry |= cpu_dai->driver->symmetric_samplebits;
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		symmetry |= codec_dai->driver->symmetric_samplebits;
 
-	if (symmetry && cpu_dai->sample_bits && cpu_dai->sample_bits != sample_bits) {
-		dev_err(rtd->dev, "ASoC: unmatched sample bits symmetry: %d - %d\n",
-				cpu_dai->sample_bits, sample_bits);
-		return -EINVAL;
+	if (symmetry) {
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (cpu_dai->sample_bits &&
+			    cpu_dai->sample_bits != sample_bits) {
+				dev_err(rtd->dev, "ASoC: unmatched sample bits symmetry: %d - %d\n",
+					cpu_dai->sample_bits, sample_bits);
+				return -EINVAL;
+			}
+		}
 	}
 
 	return 0;
@@ -485,14 +509,20 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 static bool soc_pcm_has_symmetry(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai_driver *cpu_driver = rtd->cpu_dai->driver;
 	struct snd_soc_dai_link *link = rtd->dai_link;
 	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai;
 	unsigned int symmetry, i;
 
-	symmetry = cpu_driver->symmetric_rates || link->symmetric_rates ||
-		cpu_driver->symmetric_channels || link->symmetric_channels ||
-		cpu_driver->symmetric_samplebits || link->symmetric_samplebits;
+	symmetry = link->symmetric_rates ||
+		link->symmetric_channels ||
+		link->symmetric_samplebits;
+
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		symmetry = symmetry ||
+			cpu_dai->driver->symmetric_rates ||
+			cpu_dai->driver->symmetric_channels ||
+			cpu_dai->driver->symmetric_samplebits;
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		symmetry = symmetry ||
@@ -520,12 +550,12 @@ static void soc_pcm_set_msb(struct snd_pcm_substream *substream, int bits)
 static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_pcm_stream *pcm_codec, *pcm_cpu;
 	int stream = substream->stream;
 	int i;
-	unsigned int bits = 0, cpu_bits;
+	unsigned int bits = 0, cpu_bits = 0;
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 		pcm_codec = snd_soc_dai_get_pcm_stream(codec_dai, stream);
@@ -537,8 +567,15 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 		bits = max(pcm_codec->sig_bits, bits);
 	}
 
-	pcm_cpu = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
-	cpu_bits = pcm_cpu->sig_bits;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		pcm_cpu = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
+
+		if (pcm_cpu->sig_bits == 0) {
+			cpu_bits = 0;
+			break;
+		}
+		cpu_bits = max(pcm_cpu->sig_bits, cpu_bits);
+	}
 
 	soc_pcm_set_msb(substream, bits);
 	soc_pcm_set_msb(substream, cpu_bits);
@@ -550,18 +587,32 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_pcm_stream *codec_stream;
 	struct snd_soc_pcm_stream *cpu_stream;
 	unsigned int chan_min = 0, chan_max = UINT_MAX;
+	unsigned int cpu_chan_min = 0, cpu_chan_max = UINT_MAX;
 	unsigned int rate_min = 0, rate_max = UINT_MAX;
-	unsigned int rates = UINT_MAX;
+	unsigned int cpu_rate_min = 0, cpu_rate_max = UINT_MAX;
+	unsigned int rates = UINT_MAX, cpu_rates = UINT_MAX;
 	u64 formats = ULLONG_MAX;
 	int stream = substream->stream;
 	int i;
 
-	cpu_stream = snd_soc_dai_get_pcm_stream(rtd->cpu_dai, stream);
+	/* first calculate min/max only for CPUs in the DAI link */
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		cpu_stream = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
+
+		cpu_chan_min = max(cpu_chan_min, cpu_stream->channels_min);
+		cpu_chan_max = min(cpu_chan_max, cpu_stream->channels_max);
+		cpu_rate_min = max(cpu_rate_min, cpu_stream->rate_min);
+		cpu_rate_max = min_not_zero(cpu_rate_max, cpu_stream->rate_max);
+		formats &= cpu_stream->formats;
+		cpu_rates = snd_pcm_rate_mask_intersect(cpu_stream->rates,
+							cpu_rates);
+	}
 
-	/* first calculate min/max only for CODECs in the DAI link */
+	/* second calculate min/max only for CODECs in the DAI link */
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 
 		/*
@@ -589,27 +640,28 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
 	/*
 	 * chan min/max cannot be enforced if there are multiple CODEC DAIs
-	 * connected to a single CPU DAI, use CPU DAI's directly and let
+	 * connected to CPU DAI(s), use CPU DAI's directly and let
 	 * channel allocation be fixed up later
 	 */
 	if (rtd->num_codecs > 1) {
-		chan_min = cpu_stream->channels_min;
-		chan_max = cpu_stream->channels_max;
+		chan_min = cpu_chan_min;
+		chan_max = cpu_chan_max;
 	}
 
-	hw->channels_min = max(chan_min, cpu_stream->channels_min);
-	hw->channels_max = min(chan_max, cpu_stream->channels_max);
+	/* finally find a intersection between CODECs and CPUs */
+	hw->channels_min = max(chan_min, cpu_chan_min);
+	hw->channels_max = min(chan_max, cpu_chan_max);
 	if (hw->formats)
-		hw->formats &= formats & cpu_stream->formats;
+		hw->formats &= formats;
 	else
-		hw->formats = formats & cpu_stream->formats;
-	hw->rates = snd_pcm_rate_mask_intersect(rates, cpu_stream->rates);
+		hw->formats = formats;
+	hw->rates = snd_pcm_rate_mask_intersect(rates, cpu_rates);
 
 	snd_pcm_limit_hw_rates(runtime);
 
-	hw->rate_min = max(hw->rate_min, cpu_stream->rate_min);
+	hw->rate_min = max(hw->rate_min, cpu_rate_min);
 	hw->rate_min = max(hw->rate_min, rate_min);
-	hw->rate_max = min_not_zero(hw->rate_max, cpu_stream->rate_max);
+	hw->rate_max = min_not_zero(hw->rate_max, cpu_rate_max);
 	hw->rate_max = min_not_zero(hw->rate_max, rate_max);
 }
 
@@ -681,7 +733,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
 
@@ -689,9 +741,11 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 
 	snd_soc_runtime_deactivate(rtd, substream->stream);
 
-	snd_soc_dai_digital_mute(cpu_dai, 1, substream->stream);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		snd_soc_dai_digital_mute(cpu_dai, 1, substream->stream);
 
-	snd_soc_dai_shutdown(cpu_dai, substream);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		snd_soc_dai_shutdown(cpu_dai, substream);
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		snd_soc_dai_shutdown(codec_dai, substream);
@@ -726,9 +780,10 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	const char *codec_dai_name = "multicodec";
+	const char *cpu_dai_name = "multicpu";
 	int i, ret = 0;
 
 	for_each_rtd_components(rtd, i, component)
@@ -751,11 +806,13 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	}
 
 	/* startup the audio subsystem */
-	ret = snd_soc_dai_startup(cpu_dai, substream);
-	if (ret < 0) {
-		dev_err(cpu_dai->dev, "ASoC: can't open interface %s: %d\n",
-			cpu_dai->name, ret);
-		goto cpu_dai_err;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		ret = snd_soc_dai_startup(cpu_dai, substream);
+		if (ret < 0) {
+			dev_err(cpu_dai->dev, "ASoC: can't open interface %s: %d\n",
+				cpu_dai->name, ret);
+			goto cpu_dai_err;
+		}
 	}
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
@@ -783,34 +840,39 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	if (rtd->num_codecs == 1)
 		codec_dai_name = rtd->codec_dai->name;
 
+	if (rtd->num_cpus == 1)
+		cpu_dai_name = rtd->cpu_dai->name;
+
 	if (soc_pcm_has_symmetry(substream))
 		runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
 
 	ret = -EINVAL;
 	if (!runtime->hw.rates) {
 		printk(KERN_ERR "ASoC: %s <-> %s No matching rates\n",
-			codec_dai_name, cpu_dai->name);
+			codec_dai_name, cpu_dai_name);
 		goto config_err;
 	}
 	if (!runtime->hw.formats) {
 		printk(KERN_ERR "ASoC: %s <-> %s No matching formats\n",
-			codec_dai_name, cpu_dai->name);
+			codec_dai_name, cpu_dai_name);
 		goto config_err;
 	}
 	if (!runtime->hw.channels_min || !runtime->hw.channels_max ||
 	    runtime->hw.channels_min > runtime->hw.channels_max) {
 		printk(KERN_ERR "ASoC: %s <-> %s No matching channels\n",
-				codec_dai_name, cpu_dai->name);
+				codec_dai_name, cpu_dai_name);
 		goto config_err;
 	}
 
 	soc_pcm_apply_msb(substream);
 
 	/* Symmetry only applies if we've already got an active stream. */
-	if (cpu_dai->active) {
-		ret = soc_pcm_apply_symmetry(substream, cpu_dai);
-		if (ret != 0)
-			goto config_err;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (cpu_dai->active) {
+			ret = soc_pcm_apply_symmetry(substream, cpu_dai);
+			if (ret != 0)
+				goto config_err;
+		}
 	}
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
@@ -822,7 +884,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	}
 
 	pr_debug("ASoC: %s <-> %s info:\n",
-			codec_dai_name, cpu_dai->name);
+		 codec_dai_name, cpu_dai_name);
 	pr_debug("ASoC: rate mask 0x%x\n", runtime->hw.rates);
 	pr_debug("ASoC: min ch %d max ch %d\n", runtime->hw.channels_min,
 		 runtime->hw.channels_max);
@@ -840,7 +902,8 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		snd_soc_dai_shutdown(codec_dai, substream);
 cpu_dai_err:
-	snd_soc_dai_shutdown(cpu_dai, substream);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		snd_soc_dai_shutdown(cpu_dai, substream);
 
 	soc_rtd_shutdown(rtd, substream);
 rtd_startup_err:
@@ -879,7 +942,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret = 0;
 
@@ -911,11 +974,13 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 		}
 	}
 
-	ret = snd_soc_dai_prepare(cpu_dai, substream);
-	if (ret < 0) {
-		dev_err(cpu_dai->dev,
-			"ASoC: cpu DAI prepare error: %d\n", ret);
-		goto out;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		ret = snd_soc_dai_prepare(cpu_dai, substream);
+		if (ret < 0) {
+			dev_err(cpu_dai->dev,
+				"ASoC: cpu DAI prepare error: %d\n", ret);
+			goto out;
+		}
 	}
 
 	/* cancel any delayed stream shutdown that is pending */
@@ -931,7 +996,8 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		snd_soc_dai_digital_mute(codec_dai, 0,
 					 substream->stream);
-	snd_soc_dai_digital_mute(cpu_dai, 0, substream->stream);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		snd_soc_dai_digital_mute(cpu_dai, 0, substream->stream);
 
 out:
 	mutex_unlock(&rtd->card->pcm_mutex);
@@ -978,7 +1044,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret = 0;
 
@@ -1042,17 +1108,19 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_dapm_update_dai(substream, &codec_params, codec_dai);
 	}
 
-	ret = snd_soc_dai_hw_params(cpu_dai, substream, params);
-	if (ret < 0)
-		goto interface_err;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		ret = snd_soc_dai_hw_params(cpu_dai, substream, params);
+		if (ret < 0)
+			goto interface_err;
 
-	/* store the parameters for each DAIs */
-	cpu_dai->rate = params_rate(params);
-	cpu_dai->channels = params_channels(params);
-	cpu_dai->sample_bits =
-		snd_pcm_format_physical_width(params_format(params));
+		/* store the parameters for each DAI */
+		cpu_dai->rate = params_rate(params);
+		cpu_dai->channels = params_channels(params);
+		cpu_dai->sample_bits =
+			snd_pcm_format_physical_width(params_format(params));
 
-	snd_soc_dapm_update_dai(substream, params, cpu_dai);
+		snd_soc_dapm_update_dai(substream, params, cpu_dai);
+	}
 
 	for_each_rtd_components(rtd, i, component) {
 		ret = snd_soc_component_hw_params(component, substream, params);
@@ -1072,10 +1140,14 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 component_err:
 	soc_pcm_components_hw_free(substream, component);
 
-	snd_soc_dai_hw_free(cpu_dai, substream);
-	cpu_dai->rate = 0;
+	i = rtd->num_cpus;
 
 interface_err:
+	for_each_rtd_cpu_dai_rollback(rtd, i, cpu_dai) {
+		snd_soc_dai_hw_free(cpu_dai, substream);
+		cpu_dai->rate = 0;
+	}
+
 	i = rtd->num_codecs;
 
 codec_err:
@@ -1099,7 +1171,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	bool playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	int i;
@@ -1107,10 +1179,12 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	/* clear the corresponding DAIs parameters when going to be inactive */
-	if (cpu_dai->active == 1) {
-		cpu_dai->rate = 0;
-		cpu_dai->channels = 0;
-		cpu_dai->sample_bits = 0;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (cpu_dai->active == 1) {
+			cpu_dai->rate = 0;
+			cpu_dai->channels = 0;
+			cpu_dai->sample_bits = 0;
+		}
 	}
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
@@ -1146,7 +1220,8 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 		snd_soc_dai_hw_free(codec_dai, substream);
 	}
 
-	snd_soc_dai_hw_free(cpu_dai, substream);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		snd_soc_dai_hw_free(cpu_dai, substream);
 
 	mutex_unlock(&rtd->card->pcm_mutex);
 	return 0;
@@ -1156,7 +1231,7 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -1170,9 +1245,11 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
 			return ret;
 	}
 
-	ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
-	if (ret < 0)
-		return ret;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
+		if (ret < 0)
+			return ret;
+	}
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
@@ -1187,7 +1264,7 @@ static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -1197,9 +1274,11 @@ static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
 			return ret;
 	}
 
-	ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
-	if (ret < 0)
-		return ret;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
+		if (ret < 0)
+			return ret;
+	}
 
 	for_each_rtd_components(rtd, i, component) {
 		ret = snd_soc_component_trigger(component, substream, cmd);
@@ -1240,7 +1319,7 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
 				   int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -1250,9 +1329,11 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	ret = snd_soc_dai_bespoke_trigger(cpu_dai, substream, cmd);
-	if (ret < 0)
-		return ret;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		ret = snd_soc_dai_bespoke_trigger(cpu_dai, substream, cmd);
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
 }
@@ -1264,12 +1345,13 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
 static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_uframes_t offset = 0;
 	snd_pcm_sframes_t delay = 0;
 	snd_pcm_sframes_t codec_delay = 0;
+	snd_pcm_sframes_t cpu_delay = 0;
 	int i;
 
 	/* clearing the previous total delay */
@@ -1280,7 +1362,11 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
 	/* base delay if assigned in pointer callback */
 	delay = runtime->delay;
 
-	delay += snd_soc_dai_delay(cpu_dai, substream);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		cpu_delay = max(cpu_delay,
+				snd_soc_dai_delay(cpu_dai, substream));
+	}
+	delay += cpu_delay;
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 		codec_delay = max(codec_delay,
@@ -1403,13 +1489,15 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 		if (!be->dai_link->no_pcm)
 			continue;
 
-		w = snd_soc_dai_get_widget(be->cpu_dai, stream);
+		for_each_rtd_cpu_dai(be, i, dai) {
+			w = snd_soc_dai_get_widget(dai, stream);
 
-		dev_dbg(card->dev, "ASoC: try BE : %s\n",
-			w ? w->name : "(not set)");
+			dev_dbg(card->dev, "ASoC: try BE : %s\n",
+				w ? w->name : "(not set)");
 
-		if (w == widget)
-			return be;
+			if (w == widget)
+				return be;
+		}
 
 		for_each_rtd_codec_dai(be, i, dai) {
 			w = snd_soc_dai_get_widget(dai, stream);
@@ -1492,10 +1580,18 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		unsigned int i;
 
 		/* is there a valid CPU DAI widget for this BE */
-		widget = snd_soc_dai_get_widget(dpcm->be->cpu_dai, stream);
+		do_prune = 1;
+		for_each_rtd_cpu_dai(dpcm->be, i, dai) {
+			widget = snd_soc_dai_get_widget(dai, stream);
 
-		/* prune the BE if it's no longer in our active list */
-		if (widget && widget_in_list(list, widget))
+			/*
+			 * The BE is pruned only if none of the cpu_dai
+			 * widgets are in the active list.
+			 */
+			if (widget && widget_in_list(list, widget))
+				do_prune = 0;
+		}
+		if (!do_prune)
 			continue;
 
 		/* is there a valid CODEC DAI widget for this BE */
@@ -1792,11 +1888,17 @@ static void dpcm_runtime_merge_chan(struct snd_pcm_substream *substream,
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_soc_pcm_stream *codec_stream;
 		struct snd_soc_pcm_stream *cpu_stream;
+		struct snd_soc_dai *dai;
+		int i;
 
-		cpu_stream = snd_soc_dai_get_pcm_stream(be->cpu_dai, stream);
+		for_each_rtd_cpu_dai(be, i, dai) {
+			cpu_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
-		*channels_min = max(*channels_min, cpu_stream->channels_min);
-		*channels_max = min(*channels_max, cpu_stream->channels_max);
+			*channels_min = max(*channels_min,
+					    cpu_stream->channels_min);
+			*channels_max = min(*channels_max,
+					    cpu_stream->channels_max);
+		}
 
 		/*
 		 * chan min/max cannot be enforced if there are multiple CODEC
@@ -1837,11 +1939,15 @@ static void dpcm_runtime_merge_rate(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai;
 		int i;
 
-		cpu_stream = snd_soc_dai_get_pcm_stream(be->cpu_dai, stream);
+		for_each_rtd_cpu_dai(be, i, dai) {
+			cpu_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
-		*rate_min = max(*rate_min, cpu_stream->rate_min);
-		*rate_max = min_not_zero(*rate_max, cpu_stream->rate_max);
-		*rates = snd_pcm_rate_mask_intersect(*rates, cpu_stream->rates);
+			*rate_min = max(*rate_min, cpu_stream->rate_min);
+			*rate_max = min_not_zero(*rate_max,
+						 cpu_stream->rate_max);
+			*rates = snd_pcm_rate_mask_intersect(*rates,
+						cpu_stream->rates);
+		}
 
 		for_each_rtd_codec_dai(be, i, dai) {
 			/*
@@ -1866,13 +1972,17 @@ static void dpcm_set_fe_runtime(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai_driver *cpu_dai_drv = cpu_dai->driver;
+	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai_driver *cpu_dai_drv;
+	int i;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dpcm_init_runtime_hw(runtime, &cpu_dai_drv->playback);
-	else
-		dpcm_init_runtime_hw(runtime, &cpu_dai_drv->capture);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		cpu_dai_drv = cpu_dai->driver;
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			dpcm_init_runtime_hw(runtime, &cpu_dai_drv->playback);
+		else
+			dpcm_init_runtime_hw(runtime, &cpu_dai_drv->capture);
+	}
 
 	dpcm_runtime_merge_format(substream, &runtime->hw.formats);
 	dpcm_runtime_merge_chan(substream, &runtime->hw.channels_min,
@@ -1909,18 +2019,21 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 {
 	struct snd_soc_dpcm *dpcm;
 	struct snd_soc_pcm_runtime *fe = fe_substream->private_data;
-	struct snd_soc_dai *fe_cpu_dai = fe->cpu_dai;
+	struct snd_soc_dai *fe_cpu_dai;
 	int err;
+	int i;
 
 	/* apply symmetry for FE */
 	if (soc_pcm_has_symmetry(fe_substream))
 		fe_substream->runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
 
-	/* Symmetry only applies if we've got an active stream. */
-	if (fe_cpu_dai->active) {
-		err = soc_pcm_apply_symmetry(fe_substream, fe_cpu_dai);
-		if (err < 0)
-			return err;
+	for_each_rtd_cpu_dai (fe, i, fe_cpu_dai) {
+		/* Symmetry only applies if we've got an active stream. */
+		if (fe_cpu_dai->active) {
+			err = soc_pcm_apply_symmetry(fe_substream, fe_cpu_dai);
+			if (err < 0)
+				return err;
+		}
 	}
 
 	/* apply symmetry for BE */
@@ -1930,6 +2043,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 			snd_soc_dpcm_get_substream(be, stream);
 		struct snd_soc_pcm_runtime *rtd;
 		struct snd_soc_dai *codec_dai;
+		struct snd_soc_dai *cpu_dai;
 		int i;
 
 		/* A backend may not have the requested substream */
@@ -1944,11 +2058,13 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 			be_substream->runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
 
 		/* Symmetry only applies if we've got an active stream. */
-		if (rtd->cpu_dai->active) {
-			err = soc_pcm_apply_symmetry(fe_substream,
-						     rtd->cpu_dai);
-			if (err < 0)
-				return err;
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (cpu_dai->active) {
+				err = soc_pcm_apply_symmetry(fe_substream,
+							     cpu_dai);
+				if (err < 0)
+					return err;
+			}
 		}
 
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
@@ -2863,7 +2979,7 @@ static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 {
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_component *component;
 	struct snd_pcm *pcm;
 	char new_name[64];
@@ -2881,6 +2997,16 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
+			if (rtd->num_cpus == 1) {
+				cpu_dai = rtd->cpu_dais[0];
+			} else if (rtd->num_cpus == rtd->num_codecs) {
+				cpu_dai = rtd->cpu_dais[i];
+			} else {
+				dev_err(rtd->card->dev,
+					"N cpus to M codecs link is not supported yet\n");
+				return -EINVAL;
+			}
+
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
 				playback = 1;
@@ -3001,7 +3127,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 out:
 	dev_info(rtd->card->dev, "%s <-> %s mapping ok\n",
 		 (rtd->num_codecs > 1) ? "multicodec" : rtd->codec_dai->name,
-		 cpu_dai->name);
+		 (rtd->num_cpus > 1) ? "multicpu" : rtd->cpu_dai->name);
 	return ret;
 }
 
-- 
2.20.1

