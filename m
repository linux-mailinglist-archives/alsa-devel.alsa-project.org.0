Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6534089F6E
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:18:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9F4C167F;
	Mon, 12 Aug 2019 15:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9F4C167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565615881;
	bh=FJqFglHLYVnCHCBhpWbbLQREeq/O1hkMFkjFOueiHOc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=scyEqhFBiWlEQvuY2dI09+8RFR8LPiwjM3Klez0XONyIuNUiu8UoQO+hfrxC13OWM
	 /IQHdOmz8lGPe0+Yng6+OBJ3DIMbWtaT7GLSRSdkgFWBK3U5wV5gmUwhlcwQ1KKwK1
	 20ASLdbxenYcd221APFFZJg1mXsSFZua86vCTdkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB3BF800F6;
	Mon, 12 Aug 2019 15:15:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9415FF8060F; Mon, 12 Aug 2019 15:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 521DCF80213
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 521DCF80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jyOKkgRR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=De1jL7Clx+3mIn/mKrW9MBaSFxvpjqzDDaqe0A+a0zM=; b=jyOKkgRRw81s
 7syQBqKfM3hYSpLnrAVVz+1de7CLnY83I30lEBipy7OO44hOU91ocsmya37YoUvq5kvtm5I4Epcud
 VGKShbc9t9AAafEvh7W/yr8eJSm7neUqb5G/9f07IhWT4fyTWrUNsINIE+pGH5OE/XfcT7utut2qK
 WerCU=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxA58-0001Lo-08; Mon, 12 Aug 2019 13:09:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 64AF82740CB7; Mon, 12 Aug 2019 14:09:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: 
X-Patchwork-Hint: ignore
Message-Id: <20190812130949.64AF82740CB7@ypsilon.sirena.org.uk>
Date: Mon, 12 Aug 2019 14:09:49 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: pcm3168a: Retain the independence of
	DAC and ADC side of the codec" to the asoc tree
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

   ASoC: pcm3168a: Retain the independence of DAC and ADC side of the codec

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

From abe51c351827e0086dad079dfe02918fecdf4830 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Mon, 12 Aug 2019 12:52:25 +0300
Subject: [PATCH] ASoC: pcm3168a: Retain the independence of DAC and ADC side
 of the codec

The DAC and ADC path of the codec is independent, have dedicated LRCK (FS)
and BCK for DAC/ADC.

They can be configured to use different format, TDM slots and slot_width if
needed.

Move these parameters under dedicated io_params structure and manage them
independently based on the dai.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190812095226.18870-2-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm3168a.c | 125 ++++++++++++++++--------------------
 1 file changed, 54 insertions(+), 71 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index e84a1509fe65..75fa8e9ee894 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -44,18 +44,25 @@ static const char *const pcm3168a_supply_names[PCM3168A_NUM_SUPPLIES] = {
 	"VCCDA2"
 };
 
+#define PCM3168A_DAI_DAC		0
+#define PCM3168A_DAI_ADC		1
+
+/* ADC/DAC side parameters */
+struct pcm3168a_io_params {
+	bool master_mode;
+	unsigned int fmt;
+	int tdm_slots;
+	u32 tdm_mask;
+	int slot_width;
+};
+
 struct pcm3168a_priv {
 	struct regulator_bulk_data supplies[PCM3168A_NUM_SUPPLIES];
 	struct regmap *regmap;
 	struct clk *scki;
-	bool adc_master_mode;
-	bool dac_master_mode;
 	unsigned long sysclk;
-	unsigned int adc_fmt;
-	unsigned int dac_fmt;
-	int tdm_slots;
-	u32 tdm_mask[2];
-	int slot_width;
+
+	struct pcm3168a_io_params io_params[2];
 };
 
 static const char *const pcm3168a_roll_off[] = { "Sharp", "Slow" };
@@ -308,8 +315,7 @@ static int pcm3168a_set_dai_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int pcm3168a_set_dai_fmt(struct snd_soc_dai *dai,
-			       unsigned int format, bool dac)
+static int pcm3168a_set_dai_fmt(struct snd_soc_dai *dai, unsigned int format)
 {
 	struct snd_soc_component *component = dai->component;
 	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
@@ -356,43 +362,31 @@ static int pcm3168a_set_dai_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	if (dac) {
+	if (dai->id == PCM3168A_DAI_DAC) {
 		reg = PCM3168A_DAC_PWR_MST_FMT;
 		mask = PCM3168A_DAC_FMT_MASK;
 		shift = PCM3168A_DAC_FMT_SHIFT;
-		pcm3168a->dac_master_mode = master_mode;
-		pcm3168a->dac_fmt = fmt;
 	} else {
 		reg = PCM3168A_ADC_MST_FMT;
 		mask = PCM3168A_ADC_FMTAD_MASK;
 		shift = PCM3168A_ADC_FMTAD_SHIFT;
-		pcm3168a->adc_master_mode = master_mode;
-		pcm3168a->adc_fmt = fmt;
 	}
 
+	pcm3168a->io_params[dai->id].master_mode = master_mode;
+	pcm3168a->io_params[dai->id].fmt = fmt;
+
 	regmap_update_bits(pcm3168a->regmap, reg, mask, fmt << shift);
 
 	return 0;
 }
 
-static int pcm3168a_set_dai_fmt_dac(struct snd_soc_dai *dai,
-			       unsigned int format)
-{
-	return pcm3168a_set_dai_fmt(dai, format, true);
-}
-
-static int pcm3168a_set_dai_fmt_adc(struct snd_soc_dai *dai,
-			       unsigned int format)
-{
-	return pcm3168a_set_dai_fmt(dai, format, false);
-}
-
 static int pcm3168a_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 				 unsigned int rx_mask, int slots,
 				 int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
 	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
+	struct pcm3168a_io_params *io_params = &pcm3168a->io_params[dai->id];
 
 	if (tx_mask >= (1<<slots) || rx_mask >= (1<<slots)) {
 		dev_err(component->dev,
@@ -408,22 +402,25 @@ static int pcm3168a_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 		return -EINVAL;
 	}
 
-	if (pcm3168a->tdm_slots && pcm3168a->tdm_slots != slots) {
+	if (io_params->tdm_slots && io_params->tdm_slots != slots) {
 		dev_err(component->dev, "Not matching slots %d vs %d\n",
-			pcm3168a->tdm_slots, slots);
+			io_params->tdm_slots, slots);
 		return -EINVAL;
 	}
 
-	if (pcm3168a->slot_width && pcm3168a->slot_width != slot_width) {
+	if (io_params->slot_width && io_params->slot_width != slot_width) {
 		dev_err(component->dev, "Not matching slot_width %d vs %d\n",
-			pcm3168a->slot_width, slot_width);
+			io_params->slot_width, slot_width);
 		return -EINVAL;
 	}
 
-	pcm3168a->tdm_slots = slots;
-	pcm3168a->slot_width = slot_width;
-	pcm3168a->tdm_mask[SNDRV_PCM_STREAM_PLAYBACK] = tx_mask;
-	pcm3168a->tdm_mask[SNDRV_PCM_STREAM_CAPTURE] = rx_mask;
+	io_params->tdm_slots = slots;
+	io_params->slot_width = slot_width;
+	/* Ignore the not relevant mask for the DAI/direction */
+	if (dai->id == PCM3168A_DAI_DAC)
+		io_params->tdm_mask = tx_mask;
+	else
+		io_params->tdm_mask = rx_mask;
 
 	return 0;
 }
@@ -434,7 +431,8 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
-	bool tx, master_mode;
+	struct pcm3168a_io_params *io_params = &pcm3168a->io_params[dai->id];
+	bool master_mode;
 	u32 val, mask, shift, reg;
 	unsigned int rate, fmt, ratio, max_ratio;
 	unsigned int tdm_slots;
@@ -444,23 +442,21 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 
 	ratio = pcm3168a->sysclk / rate;
 
-	tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	if (tx) {
+	if (dai->id == PCM3168A_DAI_DAC) {
 		max_ratio = PCM3168A_NUM_SCKI_RATIOS_DAC;
 		reg = PCM3168A_DAC_PWR_MST_FMT;
 		mask = PCM3168A_DAC_MSDA_MASK;
 		shift = PCM3168A_DAC_MSDA_SHIFT;
-		master_mode = pcm3168a->dac_master_mode;
-		fmt = pcm3168a->dac_fmt;
 	} else {
 		max_ratio = PCM3168A_NUM_SCKI_RATIOS_ADC;
 		reg = PCM3168A_ADC_MST_FMT;
 		mask = PCM3168A_ADC_MSAD_MASK;
 		shift = PCM3168A_ADC_MSAD_SHIFT;
-		master_mode = pcm3168a->adc_master_mode;
-		fmt = pcm3168a->adc_fmt;
 	}
 
+	master_mode = io_params->master_mode;
+	fmt = io_params->fmt;
+
 	for (i = 0; i < max_ratio; i++) {
 		if (pcm3168a_scki_ratios[i] == ratio)
 			break;
@@ -471,8 +467,8 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (pcm3168a->slot_width)
-		slot_width = pcm3168a->slot_width;
+	if (io_params->slot_width)
+		slot_width = io_params->slot_width;
 	else
 		slot_width = params_width(params);
 
@@ -497,8 +493,8 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (pcm3168a->tdm_slots)
-		tdm_slots = pcm3168a->tdm_slots;
+	if (io_params->tdm_slots)
+		tdm_slots = io_params->tdm_slots;
 	else
 		tdm_slots = params_channels(params);
 
@@ -534,7 +530,7 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(pcm3168a->regmap, reg, mask, val);
 
-	if (tx) {
+	if (dai->id == PCM3168A_DAI_DAC) {
 		mask = PCM3168A_DAC_FMT_MASK;
 		shift = PCM3168A_DAC_FMT_SHIFT;
 	} else {
@@ -552,20 +548,13 @@ static int pcm3168a_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	unsigned int fmt;
 	unsigned int sample_min;
 	unsigned int channel_max;
 	unsigned int channel_maxs[] = {
-		6, /* rx */
-		8  /* tx */
+		8, /* DAC */
+		6  /* ADC */
 	};
 
-	if (tx)
-		fmt = pcm3168a->dac_fmt;
-	else
-		fmt = pcm3168a->adc_fmt;
-
 	/*
 	 * Available Data Bits
 	 *
@@ -578,7 +567,7 @@ static int pcm3168a_startup(struct snd_pcm_substream *substream,
 	 * I2S
 	 * LEFT_J
 	 */
-	switch (fmt) {
+	switch (pcm3168a->io_params[dai->id].fmt) {
 	case PCM3168A_FMT_RIGHT_J:
 		sample_min  = 16;
 		channel_max =  2;
@@ -588,7 +577,7 @@ static int pcm3168a_startup(struct snd_pcm_substream *substream,
 	case PCM3168A_FMT_DSP_A:
 	case PCM3168A_FMT_DSP_B:
 		sample_min  = 24;
-		channel_max = channel_maxs[tx];
+		channel_max = channel_maxs[dai->id];
 		break;
 	default:
 		sample_min  = 24;
@@ -600,8 +589,8 @@ static int pcm3168a_startup(struct snd_pcm_substream *substream,
 				     sample_min, 32);
 
 	/* Allow all channels in multi DIN/DOUT mode */
-	if (pcm3168a->tdm_slots == 2)
-		channel_max = channel_maxs[tx];
+	if (pcm3168a->io_params[dai->id].tdm_slots == 2)
+		channel_max = channel_maxs[dai->id];
 
 	snd_pcm_hw_constraint_minmax(substream->runtime,
 				     SNDRV_PCM_HW_PARAM_CHANNELS,
@@ -609,26 +598,19 @@ static int pcm3168a_startup(struct snd_pcm_substream *substream,
 
 	return 0;
 }
-static const struct snd_soc_dai_ops pcm3168a_dac_dai_ops = {
+static const struct snd_soc_dai_ops pcm3168a_dai_ops = {
 	.startup	= pcm3168a_startup,
-	.set_fmt	= pcm3168a_set_dai_fmt_dac,
+	.set_fmt	= pcm3168a_set_dai_fmt,
 	.set_sysclk	= pcm3168a_set_dai_sysclk,
 	.hw_params	= pcm3168a_hw_params,
 	.digital_mute	= pcm3168a_digital_mute,
 	.set_tdm_slot	= pcm3168a_set_tdm_slot,
 };
 
-static const struct snd_soc_dai_ops pcm3168a_adc_dai_ops = {
-	.startup	= pcm3168a_startup,
-	.set_fmt	= pcm3168a_set_dai_fmt_adc,
-	.set_sysclk	= pcm3168a_set_dai_sysclk,
-	.hw_params	= pcm3168a_hw_params,
-	.set_tdm_slot	= pcm3168a_set_tdm_slot,
-};
-
 static struct snd_soc_dai_driver pcm3168a_dais[] = {
 	{
 		.name = "pcm3168a-dac",
+		.id = PCM3168A_DAI_DAC,
 		.playback = {
 			.stream_name = "Playback",
 			.channels_min = 1,
@@ -636,10 +618,11 @@ static struct snd_soc_dai_driver pcm3168a_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = PCM3168A_FORMATS
 		},
-		.ops = &pcm3168a_dac_dai_ops
+		.ops = &pcm3168a_dai_ops
 	},
 	{
 		.name = "pcm3168a-adc",
+		.id = PCM3168A_DAI_ADC,
 		.capture = {
 			.stream_name = "Capture",
 			.channels_min = 1,
@@ -647,7 +630,7 @@ static struct snd_soc_dai_driver pcm3168a_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_96000,
 			.formats = PCM3168A_FORMATS
 		},
-		.ops = &pcm3168a_adc_dai_ops
+		.ops = &pcm3168a_dai_ops
 	},
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
