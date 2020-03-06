Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F35AE17C147
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 16:09:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9761710E;
	Fri,  6 Mar 2020 16:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9761710E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583507383;
	bh=ieXPLfTZ7OQWhIj0ednsZMlHpGSE1FvRtKcDq6szjsE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=duckHgICzk/4PpbzKyidqrcE0e7KCDpwdhGC2NY2I94rGSJ0LeW9K4R1y5o8KVbXr
	 tI8WqgP+0wSVbsiWZH+h24hBZWw+rUAQmFIoRP4Uki3yXUit54yIz5ritH0vD8Sarv
	 ClBUrX93o57l7Qy0MSMDXWlg9c6POO7NeqVplFk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2532FF802EC;
	Fri,  6 Mar 2020 16:03:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C32BAF802EB; Fri,  6 Mar 2020 16:03:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9777EF802E0
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 16:03:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9777EF802E0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 684D44B2;
 Fri,  6 Mar 2020 07:03:39 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE7EB3F237;
 Fri,  6 Mar 2020 07:03:38 -0800 (PST)
Date: Fri, 06 Mar 2020 15:03:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Applied "ASoC: pcm: Export parameter intersection logic" to the asoc
 tree
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

   ASoC: pcm: Export parameter intersection logic

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

From 5854a46486ad5b8d73766735fb0d77f05956b22c Mon Sep 17 00:00:00 2001
From: Samuel Holland <samuel@sholland.org>
Date: Wed, 4 Mar 2020 23:11:42 -0600
Subject: [PATCH] ASoC: pcm: Export parameter intersection logic

The logic to calculate the subset of stream parameters supported by all
DAIs associated with a PCM stream is nontrivial. Export a helper
function so it can be used to set up simple codec2codec DAI links.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Link: https://lore.kernel.org/r/20200305051143.60691-3-samuel@sholland.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h |  3 +++
 sound/soc/soc-pcm.c | 56 ++++++++++++++++++++++++++++++---------------
 2 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 81e5d17be935..9543d9246ca4 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -471,6 +471,9 @@ bool snd_soc_runtime_ignore_pmdown_time(struct snd_soc_pcm_runtime *rtd);
 void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream);
 void snd_soc_runtime_deactivate(struct snd_soc_pcm_runtime *rtd, int stream);
 
+int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_pcm_hardware *hw, int stream);
+
 int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	unsigned int dai_fmt);
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e3a2c4f7757b..de4226357e2b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -587,11 +587,18 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 	soc_pcm_set_msb(substream, cpu_bits);
 }
 
-static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
+/**
+ * snd_soc_runtime_calc_hw() - Calculate hw limits for a PCM stream
+ * @rtd: ASoC PCM runtime
+ * @hw: PCM hardware parameters (output)
+ * @stream: Direction of the PCM stream
+ *
+ * Calculates the subset of stream parameters supported by all DAIs
+ * associated with the PCM stream.
+ */
+int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_pcm_hardware *hw, int stream)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_pcm_hardware *hw = &runtime->hw;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_pcm_stream *codec_stream;
@@ -602,7 +609,6 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 	unsigned int cpu_rate_min = 0, cpu_rate_max = UINT_MAX;
 	unsigned int rates = UINT_MAX, cpu_rates = UINT_MAX;
 	u64 formats = ULLONG_MAX;
-	int stream = substream->stream;
 	int i;
 
 	/* first calculate min/max only for CPUs in the DAI link */
@@ -613,12 +619,8 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 		 * Otherwise, since the rate, channel, and format values will
 		 * zero in that case, we would have no usable settings left,
 		 * causing the resulting setup to fail.
-		 * At least one CPU should match, otherwise we should have
-		 * bailed out on a higher level, since there would be no
-		 * CPU to support the transfer direction in that case.
 		 */
-		if (!snd_soc_dai_stream_valid(cpu_dai,
-					      substream->stream))
+		if (!snd_soc_dai_stream_valid(cpu_dai, stream))
 			continue;
 
 		cpu_stream = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
@@ -640,9 +642,6 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 		 * Otherwise, since the rate, channel, and format values will
 		 * zero in that case, we would have no usable settings left,
 		 * causing the resulting setup to fail.
-		 * At least one CODEC should match, otherwise we should have
-		 * bailed out on a higher level, since there would be no
-		 * CODEC to support the transfer direction in that case.
 		 */
 		if (!snd_soc_dai_stream_valid(codec_dai, stream))
 			continue;
@@ -657,6 +656,10 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 		rates = snd_pcm_rate_mask_intersect(codec_stream->rates, rates);
 	}
 
+	/* Verify both a valid CPU DAI and a valid CODEC DAI were found */
+	if (!chan_min || !cpu_chan_min)
+		return -EINVAL;
+
 	/*
 	 * chan min/max cannot be enforced if there are multiple CODEC DAIs
 	 * connected to CPU DAI(s), use CPU DAI's directly and let
@@ -670,18 +673,35 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 	/* finally find a intersection between CODECs and CPUs */
 	hw->channels_min = max(chan_min, cpu_chan_min);
 	hw->channels_max = min(chan_max, cpu_chan_max);
-	if (hw->formats)
-		hw->formats &= formats;
-	else
-		hw->formats = formats;
+	hw->formats = formats;
 	hw->rates = snd_pcm_rate_mask_intersect(rates, cpu_rates);
 
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_hw_limit_rates(hw);
 
 	hw->rate_min = max(hw->rate_min, cpu_rate_min);
 	hw->rate_min = max(hw->rate_min, rate_min);
 	hw->rate_max = min_not_zero(hw->rate_max, cpu_rate_max);
 	hw->rate_max = min_not_zero(hw->rate_max, rate_max);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_runtime_calc_hw);
+
+static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_hardware *hw = &substream->runtime->hw;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	u64 formats = hw->formats;
+
+	/*
+	 * At least one CPU and one CODEC should match. Otherwise, we should
+	 * have bailed out on a higher level, since there would be no CPU or
+	 * CODEC to support the transfer direction in that case.
+	 */
+	snd_soc_runtime_calc_hw(rtd, hw, substream->stream);
+
+	if (formats)
+		hw->formats &= formats;
 }
 
 static int soc_pcm_components_open(struct snd_pcm_substream *substream)
-- 
2.20.1

