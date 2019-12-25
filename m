Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553512AAC7
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Dec 2019 08:15:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F123A16FD;
	Thu, 26 Dec 2019 08:14:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F123A16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577344528;
	bh=nXeBvUWBd/DwQKWctZRH6mDOmPLEVgxLmqQ8ySr38vg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vE2TKueIQzFLhQewTAUFCr0MREBjLrWTiLjV67Wl3NyjT0UWq2t7b/Z5+mtRK5Tqz
	 54Z6Zj3+MM4zs3KEVds3z7lq+ASUhCSgTmx6XzWIEV+RkniONvhFAcqhlJkyWaNW4+
	 FShDlNfjgN6633k9j40sNUSqf/z8m1RnBCGIBqTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB81FF80277;
	Thu, 26 Dec 2019 08:12:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB937F80269; Thu, 26 Dec 2019 08:12:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E029BF8012E
 for <alsa-devel@alsa-project.org>; Thu, 26 Dec 2019 08:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E029BF8012E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Dec 2019 23:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,358,1571727600"; d="scan'208";a="300327223"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga001.jf.intel.com with ESMTP; 25 Dec 2019 23:11:52 -0800
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org
Date: Thu, 26 Dec 2019 03:15:00 +0800
Message-Id: <20191225191501.23848-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191225191501.23848-1-yung-chuan.liao@linux.intel.com>
References: <20191225191501.23848-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, bard.liao@intel.com
Subject: [alsa-devel] [PATCH RFC 2/3] ASoC: Add multiple CPU DAI support for
	PCM ops
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

From: Shreyas NC <shreyas.nc@intel.com>

Add support in PCM operations to invoke multiple cpu dais as we do
for multiple codec dais. Also the symmetry calculations are updated to
reflect multiple cpu dais.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Shreyas NC <shreyas.nc@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/soc-pcm.c | 432 +++++++++++++++++++++++++++++---------------
 1 file changed, 287 insertions(+), 145 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 01e7bc03d92f..f0c7f2d6df06 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -40,24 +40,28 @@
  */
 void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
 {
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
 
 	lockdep_assert_held(&rtd->card->pcm_mutex);
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		cpu_dai->playback_active++;
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+			cpu_dai->playback_active++;
 		for_each_rtd_codec_dai(rtd, i, codec_dai)
 			codec_dai->playback_active++;
 	} else {
-		cpu_dai->capture_active++;
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+			cpu_dai->capture_active++;
 		for_each_rtd_codec_dai(rtd, i, codec_dai)
 			codec_dai->capture_active++;
 	}
 
-	cpu_dai->active++;
-	cpu_dai->component->active++;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		cpu_dai->active++;
+		cpu_dai->component->active++;
+	}
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 		codec_dai->active++;
 		codec_dai->component->active++;
@@ -76,24 +80,28 @@ void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
  */
 void snd_soc_runtime_deactivate(struct snd_soc_pcm_runtime *rtd, int stream)
 {
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
 
 	lockdep_assert_held(&rtd->card->pcm_mutex);
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		cpu_dai->playback_active--;
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+			cpu_dai->playback_active--;
 		for_each_rtd_codec_dai(rtd, i, codec_dai)
 			codec_dai->playback_active--;
 	} else {
-		cpu_dai->capture_active--;
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+			cpu_dai->capture_active--;
 		for_each_rtd_codec_dai(rtd, i, codec_dai)
 			codec_dai->capture_active--;
 	}
 
-	cpu_dai->active--;
-	cpu_dai->component->active--;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		cpu_dai->active--;
+		cpu_dai->component->active--;
+	}
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 		codec_dai->component->active--;
 		codec_dai->active--;
@@ -233,7 +241,7 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	unsigned int rate, channels, sample_bits, symmetry, i;
 
@@ -242,40 +250,54 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
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
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (symmetry && cpu_dai->rate && cpu_dai->rate != rate) {
+			dev_err(rtd->dev, "ASoC: unmatched rate symmetry: %d - %d\n",
 				cpu_dai->rate, rate);
-		return -EINVAL;
+			return -EINVAL;
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
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (symmetry && cpu_dai->channels &&
+		    cpu_dai->channels != channels) {
+			dev_err(rtd->dev, "ASoC: unmatched channel symmetry: %d - %d\n",
 				cpu_dai->channels, channels);
-		return -EINVAL;
+			return -EINVAL;
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
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (symmetry && cpu_dai->sample_bits &&
+		    cpu_dai->sample_bits != sample_bits) {
+			dev_err(rtd->dev, "ASoC: unmatched sample bits symmetry: %d - %d\n",
 				cpu_dai->sample_bits, sample_bits);
-		return -EINVAL;
+			return -EINVAL;
+		}
 	}
 
 	return 0;
@@ -287,11 +309,18 @@ static bool soc_pcm_has_symmetry(struct snd_pcm_substream *substream)
 	struct snd_soc_dai_driver *cpu_driver = rtd->cpu_dai->driver;
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
+			cpu_driver->symmetric_rates ||
+			cpu_driver->symmetric_channels ||
+			cpu_driver->symmetric_samplebits;
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		symmetry = symmetry ||
@@ -322,7 +351,7 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
-	unsigned int bits = 0, cpu_bits;
+	unsigned int bits = 0, cpu_bits = 0;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
@@ -332,7 +361,14 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 			}
 			bits = max(codec_dai->driver->playback.sig_bits, bits);
 		}
-		cpu_bits = cpu_dai->driver->playback.sig_bits;
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (cpu_dai->driver->playback.sig_bits == 0) {
+				cpu_bits = 0;
+				break;
+			}
+			cpu_bits = max(cpu_dai->driver->playback.sig_bits,
+				       bits);
+		}
 	} else {
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
 			if (codec_dai->driver->capture.sig_bits == 0) {
@@ -341,7 +377,13 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 			}
 			bits = max(codec_dai->driver->capture.sig_bits, bits);
 		}
-		cpu_bits = cpu_dai->driver->capture.sig_bits;
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (cpu_dai->driver->capture.sig_bits == 0) {
+				cpu_bits = 0;
+				break;
+			}
+			cpu_bits = max(cpu_dai->driver->capture.sig_bits, bits);
+		}
 	}
 
 	soc_pcm_set_msb(substream, bits);
@@ -354,22 +396,40 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai_driver *cpu_dai_drv = rtd->cpu_dai->driver;
+	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai_driver *cpu_dai_drv;
 	struct snd_soc_dai_driver *codec_dai_drv;
 	struct snd_soc_pcm_stream *codec_stream;
 	struct snd_soc_pcm_stream *cpu_stream;
 	unsigned int chan_min = 0, chan_max = UINT_MAX;
+	unsigned int cpu_chan_min = 0, cpu_chan_max = UINT_MAX;
 	unsigned int rate_min = 0, rate_max = UINT_MAX;
-	unsigned int rates = UINT_MAX;
+	unsigned int cpu_rate_min = 0, cpu_rate_max = UINT_MAX;
+	unsigned int rates = UINT_MAX, cpu_rates = UINT_MAX;
 	u64 formats = ULLONG_MAX;
 	int i;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		cpu_stream = &cpu_dai_drv->playback;
-	else
-		cpu_stream = &cpu_dai_drv->capture;
+	/* first calculate min/max only for CPUs in the DAI link */
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (!snd_soc_dai_stream_valid(cpu_dai,
+					      substream->stream))
+			continue;
+
+		cpu_dai_drv = cpu_dai->driver;
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			cpu_stream = &cpu_dai_drv->playback;
+		else
+			cpu_stream = &cpu_dai_drv->capture;
+		cpu_chan_min = max(cpu_chan_min, cpu_stream->channels_min);
+		cpu_chan_max = min(cpu_chan_max, cpu_stream->channels_max);
+		cpu_rate_min = max(cpu_rate_min, cpu_stream->rate_min);
+		cpu_rate_max = min_not_zero(cpu_rate_max, cpu_stream->rate_max);
+		formats &= cpu_stream->formats;
+		cpu_rates = snd_pcm_rate_mask_intersect(cpu_stream->rates,
+							rates);
+	}
 
-	/* first calculate min/max only for CODECs in the DAI link */
+	/* second calculate min/max only for CODECs in the DAI link */
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 
 		/*
@@ -400,27 +460,28 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
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
 
@@ -485,12 +546,14 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	const char *codec_dai_name = "multicodec";
+	const char *cpu_dai_name = "multicpu";
 	int i, ret = 0;
 
-	pinctrl_pm_select_default_state(cpu_dai->dev);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		pinctrl_pm_select_default_state(cpu_dai->dev);
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		pinctrl_pm_select_default_state(codec_dai->dev);
 
@@ -501,11 +564,13 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	/* startup the audio subsystem */
-	ret = snd_soc_dai_startup(cpu_dai, substream);
-	if (ret < 0) {
-		dev_err(cpu_dai->dev, "ASoC: can't open interface %s: %d\n",
-			cpu_dai->name, ret);
-		goto out;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		ret = snd_soc_dai_startup(cpu_dai, substream);
+		if (ret < 0) {
+			dev_err(cpu_dai->dev, "ASoC: can't open interface %s: %d\n",
+				cpu_dai_name, ret);
+			goto interface_err;
+		}
 	}
 
 	ret = soc_pcm_components_open(substream, &component);
@@ -546,34 +611,39 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	if (rtd->num_codecs == 1)
 		codec_dai_name = rtd->codec_dai->name;
 
+	if (rtd->num_cpu_dai == 1)
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
@@ -585,7 +655,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	}
 
 	pr_debug("ASoC: %s <-> %s info:\n",
-			codec_dai_name, cpu_dai->name);
+			codec_dai_name, cpu_dai_name);
 	pr_debug("ASoC: rate mask 0x%x\n", runtime->hw.rates);
 	pr_debug("ASoC: min ch %d max ch %d\n", runtime->hw.channels_min,
 		 runtime->hw.channels_max);
@@ -613,8 +683,12 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 component_err:
 	soc_pcm_components_close(substream, component);
 
-	snd_soc_dai_shutdown(cpu_dai, substream);
-out:
+	i = rtd->num_cpu_dai;
+
+interface_err:
+	for_each_rtd_cpu_dai_rollback(rtd, i, cpu_dai)
+		snd_soc_dai_shutdown(cpu_dai, substream);
+
 	mutex_unlock(&rtd->card->pcm_mutex);
 
 	for_each_rtd_components(rtd, rtdcom, component) {
@@ -626,8 +700,11 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 		if (!codec_dai->active)
 			pinctrl_pm_select_sleep_state(codec_dai->dev);
 	}
-	if (!cpu_dai->active)
-		pinctrl_pm_select_sleep_state(cpu_dai->dev);
+
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (!cpu_dai->active)
+			pinctrl_pm_select_sleep_state(cpu_dai->dev);
+	}
 
 	return ret;
 }
@@ -678,7 +755,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
 
@@ -687,17 +764,21 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 	snd_soc_runtime_deactivate(rtd, substream->stream);
 
 	/* clear the corresponding DAIs rate when inactive */
-	if (!cpu_dai->active)
-		cpu_dai->rate = 0;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (!cpu_dai->active)
+			cpu_dai->rate = 0;
+	}
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 		if (!codec_dai->active)
 			codec_dai->rate = 0;
 	}
 
-	snd_soc_dai_digital_mute(cpu_dai, 1, substream->stream);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		snd_soc_dai_digital_mute(cpu_dai, 1, substream->stream);
 
-	snd_soc_dai_shutdown(cpu_dai, substream);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		snd_soc_dai_shutdown(cpu_dai, substream);
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		snd_soc_dai_shutdown(codec_dai, substream);
@@ -737,8 +818,11 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 		if (!codec_dai->active)
 			pinctrl_pm_select_sleep_state(codec_dai->dev);
 	}
-	if (!cpu_dai->active)
-		pinctrl_pm_select_sleep_state(cpu_dai->dev);
+
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (!cpu_dai->active)
+			pinctrl_pm_select_sleep_state(cpu_dai->dev);
+	}
 
 	return 0;
 }
@@ -753,7 +837,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret = 0;
 
@@ -787,11 +871,13 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
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
@@ -807,7 +893,8 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		snd_soc_dai_digital_mute(codec_dai, 0,
 					 substream->stream);
-	snd_soc_dai_digital_mute(cpu_dai, 0, substream->stream);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		snd_soc_dai_digital_mute(cpu_dai, 0, substream->stream);
 
 out:
 	mutex_unlock(&rtd->card->pcm_mutex);
@@ -854,7 +941,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret = 0;
 
@@ -920,17 +1007,19 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
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
 
 	for_each_rtd_components(rtd, rtdcom, component) {
 		ret = snd_soc_component_hw_params(component, substream, params);
@@ -950,10 +1039,17 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 component_err:
 	soc_pcm_components_hw_free(substream, component);
 
-	snd_soc_dai_hw_free(cpu_dai, substream);
-	cpu_dai->rate = 0;
+	i = rtd->num_cpu_dai;
 
 interface_err:
+	for_each_rtd_cpu_dai_rollback(rtd, i, cpu_dai) {
+		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
+			continue;
+
+		snd_soc_dai_hw_free(cpu_dai, substream);
+		cpu_dai->rate = 0;
+	}
+
 	i = rtd->num_codecs;
 
 codec_err:
@@ -978,20 +1074,23 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	bool playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	int i;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
-	/* clear the corresponding DAIs parameters when going to be inactive */
-	if (cpu_dai->active == 1) {
-		cpu_dai->rate = 0;
-		cpu_dai->channels = 0;
-		cpu_dai->sample_bits = 0;
+	/* clear all CPU DAIs parameters when inactive */
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (cpu_dai->active == 1) {
+			cpu_dai->rate = 0;
+			cpu_dai->channels = 0;
+			cpu_dai->sample_bits = 0;
+		}
 	}
 
+	/* clear all CODEC DAIs parameters when inactive */
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 		if (codec_dai->active == 1) {
 			codec_dai->rate = 0;
@@ -1023,7 +1122,12 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 		snd_soc_dai_hw_free(codec_dai, substream);
 	}
 
-	snd_soc_dai_hw_free(cpu_dai, substream);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
+			continue;
+
+		snd_soc_dai_hw_free(cpu_dai, substream);
+	}
 
 	mutex_unlock(&rtd->card->pcm_mutex);
 	return 0;
@@ -1034,7 +1138,7 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -1050,9 +1154,11 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
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
@@ -1068,7 +1174,7 @@ static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -1078,9 +1184,11 @@ static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
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
 
 	for_each_rtd_components(rtd, rtdcom, component) {
 		ret = snd_soc_component_trigger(component, substream, cmd);
@@ -1147,12 +1255,13 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
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
@@ -1163,7 +1272,11 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
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
@@ -1289,6 +1402,7 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 {
 	struct snd_soc_pcm_runtime *be;
 	struct snd_soc_dai *dai;
+	struct snd_soc_dai *cpu_dai;
 	int i;
 
 	dev_dbg(card->dev, "ASoC: find BE for widget %s\n", widget->name);
@@ -1299,12 +1413,15 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 			if (!be->dai_link->no_pcm)
 				continue;
 
-			dev_dbg(card->dev, "ASoC: try BE : %s\n",
-				be->cpu_dai->playback_widget ?
-				be->cpu_dai->playback_widget->name : "(not set)");
+			for_each_rtd_cpu_dai(be, i, cpu_dai) {
+				dev_dbg(card->dev, "ASoC: try BE : %s\n",
+					cpu_dai->playback_widget ?
+					cpu_dai->playback_widget->name :
+					"(not set)");
 
-			if (be->cpu_dai->playback_widget == widget)
-				return be;
+				if (cpu_dai->playback_widget == widget)
+					return be;
+			}
 
 			for_each_rtd_codec_dai(be, i, dai) {
 				if (dai->playback_widget == widget)
@@ -1318,12 +1435,15 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 			if (!be->dai_link->no_pcm)
 				continue;
 
-			dev_dbg(card->dev, "ASoC: try BE %s\n",
-				be->cpu_dai->capture_widget ?
-				be->cpu_dai->capture_widget->name : "(not set)");
+			for_each_rtd_cpu_dai(be, i, cpu_dai) {
+				dev_dbg(card->dev, "ASoC: try BE %s\n",
+					cpu_dai->capture_widget ?
+					cpu_dai->capture_widget->name :
+					"(not set)");
 
-			if (be->cpu_dai->capture_widget == widget)
-				return be;
+				if (cpu_dai->capture_widget == widget)
+					return be;
+			}
 
 			for_each_rtd_codec_dai(be, i, dai) {
 				if (dai->capture_widget == widget)
@@ -1373,8 +1493,10 @@ static bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget,
 			if (!rtd->dai_link->no_pcm)
 				continue;
 
-			if (rtd->cpu_dai->playback_widget == widget)
-				return true;
+			for_each_rtd_cpu_dai(rtd, i, dai) {
+				if (dai->playback_widget == widget)
+					return true;
+			}
 
 			for_each_rtd_codec_dai(rtd, i, dai) {
 				if (dai->playback_widget == widget)
@@ -1386,8 +1508,10 @@ static bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget,
 			if (!rtd->dai_link->no_pcm)
 				continue;
 
-			if (rtd->cpu_dai->capture_widget == widget)
-				return true;
+			for_each_rtd_cpu_dai(rtd, i, dai) {
+				if (dai->capture_widget == widget)
+					return true;
+			}
 
 			for_each_rtd_codec_dai(rtd, i, dai) {
 				if (dai->capture_widget == widget)
@@ -1430,10 +1554,18 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		unsigned int i;
 
 		/* is there a valid CPU DAI widget for this BE */
-		widget = dai_get_widget(dpcm->be->cpu_dai, stream);
+		do_prune = 1;
+		for_each_rtd_cpu_dai(dpcm->be, i, dai) {
+			widget = dai_get_widget(dai, stream);
 
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
@@ -1827,13 +1959,17 @@ static void dpcm_set_fe_runtime(struct snd_pcm_substream *substream)
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
@@ -1870,18 +2006,21 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
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
 
 	/* Symmetry only applies if we've got an active stream. */
-	if (fe_cpu_dai->active) {
-		err = soc_pcm_apply_symmetry(fe_substream, fe_cpu_dai);
-		if (err < 0)
-			return err;
+	for_each_rtd_cpu_dai(fe, i, fe_cpu_dai) {
+		if (fe_cpu_dai->active) {
+			err = soc_pcm_apply_symmetry(fe_substream, fe_cpu_dai);
+			if (err < 0)
+				return err;
+		}
 	}
 
 	/* apply symmetry for BE */
@@ -1891,6 +2030,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 			snd_soc_dpcm_get_substream(be, stream);
 		struct snd_soc_pcm_runtime *rtd;
 		struct snd_soc_dai *codec_dai;
+		struct snd_soc_dai *cpu_dai;
 		int i;
 
 		/* A backend may not have the requested substream */
@@ -1905,11 +2045,13 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
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
@@ -3038,7 +3180,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 out:
 	dev_info(rtd->card->dev, "%s <-> %s mapping ok\n",
 		 (rtd->num_codecs > 1) ? "multicodec" : rtd->codec_dai->name,
-		 cpu_dai->name);
+		 (rtd->num_cpu_dai > 1) ? "multicpu" : rtd->cpu_dai->name);
 	return ret;
 }
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
