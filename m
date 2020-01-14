Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E7613B939
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 06:52:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FB1D17A5;
	Wed, 15 Jan 2020 06:51:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FB1D17A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579067520;
	bh=b5LxtlpK6e52zgaFFXeJ9bl2IXU7UEfrr8kaNbIyCZI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LErnlJrGDnu0LvwfT8GROHZDkQHYeNSQUOqB93wlTu+lVcve/OSfXZKQ3EJja1Ah2
	 /snWKbRgTzxYZoK9So4wc4E67oObrkI4KhFV/TE1mUGz//8HJJM2FDwUel4HLHGrZB
	 wokpy+/T2uobp170zRxh/l5fcqzCX71Ddxb3ShME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0BFAF8027C;
	Wed, 15 Jan 2020 06:48:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31580F80271; Wed, 15 Jan 2020 06:48:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A44ABF8014B
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 06:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A44ABF8014B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 21:48:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; d="scan'208";a="225452752"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga003.jf.intel.com with ESMTP; 14 Jan 2020 21:48:08 -0800
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Wed, 15 Jan 2020 01:51:50 +0800
Message-Id: <20200114175152.3291-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114175152.3291-1-yung-chuan.liao@linux.intel.com>
References: <20200114175152.3291-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH RFC v2 2/4] ASoC: Add multiple CPU DAI support
	for PCM ops
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
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/soc-pcm.c | 535 +++++++++++++++++++++++++++++---------------
 1 file changed, 357 insertions(+), 178 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 74d340d1c9f7..52c6f3c3ab63 100644
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
 
@@ -242,40 +250,60 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
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
@@ -284,14 +312,20 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
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
@@ -319,10 +353,10 @@ static void soc_pcm_set_msb(struct snd_pcm_substream *substream, int bits)
 static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
-	unsigned int bits = 0, cpu_bits;
+	unsigned int bits = 0, cpu_bits = 0;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
@@ -332,7 +366,14 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
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
@@ -341,7 +382,13 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
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
@@ -354,22 +401,40 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
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
 
-	/* first calculate min/max only for CODECs in the DAI link */
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
+							cpu_rates);
+	}
+
+	/* second calculate min/max only for CODECs in the DAI link */
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 
 		/*
@@ -400,27 +465,28 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
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
 
@@ -482,9 +548,10 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
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
@@ -496,11 +563,13 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
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
+				cpu_dai->name, ret);
+			goto interface_err;
+		}
 	}
 
 	ret = soc_pcm_components_open(substream, &component);
@@ -541,34 +610,39 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
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
@@ -580,7 +654,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	}
 
 	pr_debug("ASoC: %s <-> %s info:\n",
-			codec_dai_name, cpu_dai->name);
+		 codec_dai_name, cpu_dai_name);
 	pr_debug("ASoC: rate mask 0x%x\n", runtime->hw.rates);
 	pr_debug("ASoC: min ch %d max ch %d\n", runtime->hw.channels_min,
 		 runtime->hw.channels_max);
@@ -608,8 +682,12 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 component_err:
 	soc_pcm_components_close(substream, component);
 
-	snd_soc_dai_shutdown(cpu_dai, substream);
-out:
+	i = rtd->num_cpus;
+
+interface_err:
+	for_each_rtd_cpu_dai_rollback(rtd, i, cpu_dai)
+		snd_soc_dai_shutdown(cpu_dai, substream);
+
 	mutex_unlock(&rtd->card->pcm_mutex);
 
 	for_each_rtd_components(rtd, i, component) {
@@ -643,7 +721,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
 
@@ -652,17 +730,21 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
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
@@ -697,7 +779,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret = 0;
 
@@ -731,11 +813,13 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
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
@@ -751,7 +835,8 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		snd_soc_dai_digital_mute(codec_dai, 0,
 					 substream->stream);
-	snd_soc_dai_digital_mute(cpu_dai, 0, substream->stream);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		snd_soc_dai_digital_mute(cpu_dai, 0, substream->stream);
 
 out:
 	mutex_unlock(&rtd->card->pcm_mutex);
@@ -796,7 +881,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret = 0;
 
@@ -862,17 +947,19 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
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
@@ -892,10 +979,17 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 component_err:
 	soc_pcm_components_hw_free(substream, component);
 
-	snd_soc_dai_hw_free(cpu_dai, substream);
-	cpu_dai->rate = 0;
+	i = rtd->num_cpus;
 
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
@@ -920,20 +1014,23 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
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
@@ -965,7 +1062,12 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
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
@@ -975,7 +1077,7 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -991,9 +1093,11 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
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
@@ -1008,7 +1112,7 @@ static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -1018,9 +1122,11 @@ static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
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
@@ -1063,7 +1169,7 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
 				   int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -1073,9 +1179,11 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
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
@@ -1087,12 +1195,13 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
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
@@ -1103,7 +1212,11 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
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
@@ -1229,6 +1342,7 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 {
 	struct snd_soc_pcm_runtime *be;
 	struct snd_soc_dai *dai;
+	struct snd_soc_dai *cpu_dai;
 	int i;
 
 	dev_dbg(card->dev, "ASoC: find BE for widget %s\n", widget->name);
@@ -1239,12 +1353,15 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
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
@@ -1258,12 +1375,15 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
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
@@ -1313,8 +1433,10 @@ static bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget,
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
@@ -1326,8 +1448,10 @@ static bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget,
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
@@ -1370,10 +1494,18 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
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
@@ -1672,18 +1804,32 @@ static void dpcm_runtime_merge_chan(struct snd_pcm_substream *substream,
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_dai_driver *cpu_dai_drv =  be->cpu_dai->driver;
+		struct snd_soc_dai_driver *cpu_dai_drv;
 		struct snd_soc_dai_driver *codec_dai_drv;
 		struct snd_soc_pcm_stream *codec_stream;
 		struct snd_soc_pcm_stream *cpu_stream;
+		struct snd_soc_dai *dai;
+		int i;
 
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-			cpu_stream = &cpu_dai_drv->playback;
-		else
-			cpu_stream = &cpu_dai_drv->capture;
+		for_each_rtd_cpu_dai(be, i, dai) {
+			/*
+			 * Skip CPUs which don't support the current stream
+			 * type. See soc_pcm_init_runtime_hw() for more details
+			 */
+			if (!snd_soc_dai_stream_valid(dai, stream))
+				continue;
 
-		*channels_min = max(*channels_min, cpu_stream->channels_min);
-		*channels_max = min(*channels_max, cpu_stream->channels_max);
+			cpu_dai_drv =  dai->driver;
+			if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+				cpu_stream = &cpu_dai_drv->playback;
+			else
+				cpu_stream = &cpu_dai_drv->capture;
+
+			*channels_min = max(*channels_min,
+					    cpu_stream->channels_min);
+			*channels_max = min(*channels_max,
+					    cpu_stream->channels_max);
+		}
 
 		/*
 		 * chan min/max cannot be enforced if there are multiple CODEC
@@ -1724,21 +1870,33 @@ static void dpcm_runtime_merge_rate(struct snd_pcm_substream *substream,
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_dai_driver *cpu_dai_drv =  be->cpu_dai->driver;
+		struct snd_soc_dai_driver *cpu_dai_drv;
 		struct snd_soc_dai_driver *codec_dai_drv;
 		struct snd_soc_pcm_stream *codec_stream;
 		struct snd_soc_pcm_stream *cpu_stream;
 		struct snd_soc_dai *dai;
 		int i;
 
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-			cpu_stream = &cpu_dai_drv->playback;
-		else
-			cpu_stream = &cpu_dai_drv->capture;
+		for_each_rtd_cpu_dai(be, i, dai) {
+			/*
+			 * Skip CPUs which don't support the current stream
+			 * type. See soc_pcm_init_runtime_hw() for more details
+			 */
+			if (!snd_soc_dai_stream_valid(dai, stream))
+				continue;
 
-		*rate_min = max(*rate_min, cpu_stream->rate_min);
-		*rate_max = min_not_zero(*rate_max, cpu_stream->rate_max);
-		*rates = snd_pcm_rate_mask_intersect(*rates, cpu_stream->rates);
+			cpu_dai_drv =  dai->driver;
+			if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+				cpu_stream = &cpu_dai_drv->playback;
+			else
+				cpu_stream = &cpu_dai_drv->capture;
+
+			*rate_min = max(*rate_min, cpu_stream->rate_min);
+			*rate_max = min_not_zero(*rate_max,
+						 cpu_stream->rate_max);
+			*rates = snd_pcm_rate_mask_intersect(*rates,
+						cpu_stream->rates);
+		}
 
 		for_each_rtd_codec_dai(be, i, dai) {
 			/*
@@ -1767,13 +1925,17 @@ static void dpcm_set_fe_runtime(struct snd_pcm_substream *substream)
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
@@ -1810,18 +1972,22 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
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
+	/* Do we need to support Multi cpu for FE? */
+	for_each_rtd_cpu_dai(fe, i, fe_cpu_dai) {
+		if (fe_cpu_dai->active) {
+			err = soc_pcm_apply_symmetry(fe_substream, fe_cpu_dai);
+			if (err < 0)
+				return err;
+		}
 	}
 
 	/* apply symmetry for BE */
@@ -1831,6 +1997,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 			snd_soc_dpcm_get_substream(be, stream);
 		struct snd_soc_pcm_runtime *rtd;
 		struct snd_soc_dai *codec_dai;
+		struct snd_soc_dai *cpu_dai;
 		int i;
 
 		/* A backend may not have the requested substream */
@@ -1845,11 +2012,13 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
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
@@ -2836,7 +3005,7 @@ static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 {
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_component *component;
 	struct snd_pcm *pcm;
 	char new_name[64];
@@ -2847,23 +3016,33 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		playback = rtd->dai_link->dpcm_playback;
 		capture = rtd->dai_link->dpcm_capture;
 	} else {
+		int stream_playback;
+		int stream_capture;
 		/* Adapt stream for codec2codec links */
-		struct snd_soc_pcm_stream *cpu_capture = rtd->dai_link->params ?
-			&cpu_dai->driver->playback : &cpu_dai->driver->capture;
-		struct snd_soc_pcm_stream *cpu_playback = rtd->dai_link->params ?
-			&cpu_dai->driver->capture : &cpu_dai->driver->playback;
+		if (rtd->dai_link->params) {
+			stream_playback = SNDRV_PCM_STREAM_CAPTURE;
+			stream_capture  = SNDRV_PCM_STREAM_PLAYBACK;
+		} else {
+			stream_playback = SNDRV_PCM_STREAM_PLAYBACK;
+			stream_capture  = SNDRV_PCM_STREAM_CAPTURE;
+		}
 
-		for_each_rtd_codec_dai(rtd, i, codec_dai) {
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
-				playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
-				capture = 1;
+		playback = 1;
+		capture = 1;
+
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (!snd_soc_dai_stream_valid(cpu_dai, stream_playback))
+				playback = 0;
+			if (!snd_soc_dai_stream_valid(cpu_dai, stream_capture))
+				capture = 0;
 		}
 
-		capture = capture && cpu_capture->channels_min;
-		playback = playback && cpu_playback->channels_min;
+		for_each_rtd_codec_dai(rtd, i, codec_dai) {
+			if (!snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
+				playback = 0;
+			if (!snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
+				capture = 0;
+		}
 	}
 
 	if (rtd->dai_link->playback_only) {
@@ -2977,7 +3156,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 out:
 	dev_info(rtd->card->dev, "%s <-> %s mapping ok\n",
 		 (rtd->num_codecs > 1) ? "multicodec" : rtd->codec_dai->name,
-		 cpu_dai->name);
+		 (rtd->num_cpus > 1) ? "multicpu" : rtd->cpu_dai->name);
 	return ret;
 }
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
