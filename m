Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D66FFDA
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F3261718;
	Mon, 22 Jul 2019 14:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F3261718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563799081;
	bh=dnQ7lfUHB1kqJLBRq3AlS3NKQ+IEXoabanSMhlk1HxI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nf8SZriNSud3CdTNaHe9/wfquHsN0uTRJT0+TlbdiGaUwdnw10GhngylsvEys2575
	 9wuqU3Uchqhwe/uHQY1rg7L3oNOzZBTK4Uv/aHErNYKzdSuQdKp4i47FwW7d4GKab1
	 JWHm8IAum8Wad7FTgpsiMyWb1s8Mh2ca97L8IjFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE526F80709;
	Mon, 22 Jul 2019 14:23:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2BFCF803D1; Mon, 22 Jul 2019 14:22:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B97E9F8049A
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B97E9F8049A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="f1kI6xHa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=brwYyd/mdAFQv8m6PrOABtOpnnjtQSc8YcFxHRBTDcw=; b=f1kI6xHaw31A
 HVc0hZjdlNAYkyovwme/GVsbXqQvApX2sqn9DnHDq9wPJ+Nxj6rNaVextspNX5qsGOXLWdE2Dfky8
 LbcHlej9urkYXiaiKYTQ12qwISV8/9VpTQWHxmIh+n8JSCRa/RwBFq/E87VudOECFvGYNaBha0Oza
 uXj0w=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKU-0007dx-PO; Mon, 22 Jul 2019 12:22:10 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4D13627429D9; Mon, 22 Jul 2019 13:22:10 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20190716094547.46787-1-shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190722122210.4D13627429D9@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:10 +0100 (BST)
Cc: brian.austin@cirrus.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, Paul.Handrigan@cirrus.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cs42xx8: Fix MFREQ selection issue for
	async mode" to the asoc tree
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

   ASoC: cs42xx8: Fix MFREQ selection issue for async mode

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 48dfd37a0f85400610153101c72222bf01523699 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Tue, 16 Jul 2019 17:45:47 +0800
Subject: [PATCH] ASoC: cs42xx8: Fix MFREQ selection issue for async mode

When sample rate of TX is different with sample rate of RX in
async mode, the MFreq selection will be wrong.

For example, sysclk = 24.576MHz, TX rate = 96000Hz, RX rate = 48000Hz.
Then ratio of TX = 256, ratio of RX = 512, For MFreq is shared by TX
and RX instance, the correct value of MFreq is 2 for both TX and RX.

But original method will cause MFreq = 0 for TX, MFreq = 2 for RX.
If TX is started after RX, RX will be impacted, RX work abnormal with
MFreq = 0.

This patch is to select proper MFreq value according to TX rate and
RX rate.

Fixes: 0c516b4ff85c ("ASoC: cs42xx8: Add codec driver support for CS42448/CS42888")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://lore.kernel.org/r/20190716094547.46787-1-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42xx8.c | 116 +++++++++++++++++++++++++++++++------
 1 file changed, 97 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 6203f54d9f25..5b049fcdba20 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -47,6 +47,7 @@ struct cs42xx8_priv {
 	unsigned long sysclk;
 	u32 tx_channels;
 	struct gpio_desc *gpiod_reset;
+	u32 rate[2];
 };
 
 /* -127.5dB to 0dB with step of 0.5dB */
@@ -176,21 +177,27 @@ static const struct snd_soc_dapm_route cs42xx8_adc3_dapm_routes[] = {
 };
 
 struct cs42xx8_ratios {
-	unsigned int ratio;
-	unsigned char speed;
-	unsigned char mclk;
+	unsigned int mfreq;
+	unsigned int min_mclk;
+	unsigned int max_mclk;
+	unsigned int ratio[3];
 };
 
+/*
+ * According to reference mannual, define the cs42xx8_ratio struct
+ * MFreq2 | MFreq1 | MFreq0 |     Description     | SSM | DSM | QSM |
+ * 0      | 0      | 0      |1.029MHz to 12.8MHz  | 256 | 128 |  64 |
+ * 0      | 0      | 1      |1.536MHz to 19.2MHz  | 384 | 192 |  96 |
+ * 0      | 1      | 0      |2.048MHz to 25.6MHz  | 512 | 256 | 128 |
+ * 0      | 1      | 1      |3.072MHz to 38.4MHz  | 768 | 384 | 192 |
+ * 1      | x      | x      |4.096MHz to 51.2MHz  |1024 | 512 | 256 |
+ */
 static const struct cs42xx8_ratios cs42xx8_ratios[] = {
-	{ 64, CS42XX8_FM_QUAD, CS42XX8_FUNCMOD_MFREQ_256(4) },
-	{ 96, CS42XX8_FM_QUAD, CS42XX8_FUNCMOD_MFREQ_384(4) },
-	{ 128, CS42XX8_FM_QUAD, CS42XX8_FUNCMOD_MFREQ_512(4) },
-	{ 192, CS42XX8_FM_QUAD, CS42XX8_FUNCMOD_MFREQ_768(4) },
-	{ 256, CS42XX8_FM_SINGLE, CS42XX8_FUNCMOD_MFREQ_256(1) },
-	{ 384, CS42XX8_FM_SINGLE, CS42XX8_FUNCMOD_MFREQ_384(1) },
-	{ 512, CS42XX8_FM_SINGLE, CS42XX8_FUNCMOD_MFREQ_512(1) },
-	{ 768, CS42XX8_FM_SINGLE, CS42XX8_FUNCMOD_MFREQ_768(1) },
-	{ 1024, CS42XX8_FM_SINGLE, CS42XX8_FUNCMOD_MFREQ_1024(1) }
+	{ 0, 1029000, 12800000, {256, 128, 64} },
+	{ 2, 1536000, 19200000, {384, 192, 96} },
+	{ 4, 2048000, 25600000, {512, 256, 128} },
+	{ 6, 3072000, 38400000, {768, 384, 192} },
+	{ 8, 4096000, 51200000, {1024, 512, 256} },
 };
 
 static int cs42xx8_set_dai_sysclk(struct snd_soc_dai *codec_dai,
@@ -257,14 +264,68 @@ static int cs42xx8_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct cs42xx8_priv *cs42xx8 = snd_soc_component_get_drvdata(component);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	u32 ratio = cs42xx8->sysclk / params_rate(params);
-	u32 i, fm, val, mask;
+	u32 ratio[2];
+	u32 rate[2];
+	u32 fm[2];
+	u32 i, val, mask;
+	bool condition1, condition2;
 
 	if (tx)
 		cs42xx8->tx_channels = params_channels(params);
 
+	rate[tx]  = params_rate(params);
+	rate[!tx] = cs42xx8->rate[!tx];
+
+	ratio[tx] = rate[tx] > 0 ? cs42xx8->sysclk / rate[tx] : 0;
+	ratio[!tx] = rate[!tx] > 0 ? cs42xx8->sysclk / rate[!tx] : 0;
+
+	/* Get functional mode for tx and rx according to rate */
+	for (i = 0; i < 2; i++) {
+		if (cs42xx8->slave_mode) {
+			fm[i] = CS42XX8_FM_AUTO;
+		} else {
+			if (rate[i] < 50000) {
+				fm[i] = CS42XX8_FM_SINGLE;
+			} else if (rate[i] > 50000 && rate[i] < 100000) {
+				fm[i] = CS42XX8_FM_DOUBLE;
+			} else if (rate[i] > 100000 && rate[i] < 200000) {
+				fm[i] = CS42XX8_FM_QUAD;
+			} else {
+				dev_err(component->dev,
+					"unsupported sample rate\n");
+				return -EINVAL;
+			}
+		}
+	}
+
 	for (i = 0; i < ARRAY_SIZE(cs42xx8_ratios); i++) {
-		if (cs42xx8_ratios[i].ratio == ratio)
+		/* Is the ratio[tx] valid ? */
+		condition1 = ((fm[tx] == CS42XX8_FM_AUTO) ?
+			(cs42xx8_ratios[i].ratio[0] == ratio[tx] ||
+			cs42xx8_ratios[i].ratio[1] == ratio[tx] ||
+			cs42xx8_ratios[i].ratio[2] == ratio[tx]) :
+			(cs42xx8_ratios[i].ratio[fm[tx]] == ratio[tx])) &&
+			cs42xx8->sysclk >= cs42xx8_ratios[i].min_mclk &&
+			cs42xx8->sysclk <= cs42xx8_ratios[i].max_mclk;
+
+		if (!ratio[tx])
+			condition1 = true;
+
+		/* Is the ratio[!tx] valid ? */
+		condition2 = ((fm[!tx] == CS42XX8_FM_AUTO) ?
+			(cs42xx8_ratios[i].ratio[0] == ratio[!tx] ||
+			cs42xx8_ratios[i].ratio[1] == ratio[!tx] ||
+			cs42xx8_ratios[i].ratio[2] == ratio[!tx]) :
+			(cs42xx8_ratios[i].ratio[fm[!tx]] == ratio[!tx]));
+
+		if (!ratio[!tx])
+			condition2 = true;
+
+		/*
+		 * Both ratio[tx] and ratio[!tx] is valid, then we get
+		 * a proper MFreq.
+		 */
+		if (condition1 && condition2)
 			break;
 	}
 
@@ -273,15 +334,31 @@ static int cs42xx8_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	mask = CS42XX8_FUNCMOD_MFREQ_MASK;
-	val = cs42xx8_ratios[i].mclk;
+	cs42xx8->rate[tx] = params_rate(params);
 
-	fm = cs42xx8->slave_mode ? CS42XX8_FM_AUTO : cs42xx8_ratios[i].speed;
+	mask = CS42XX8_FUNCMOD_MFREQ_MASK;
+	val = cs42xx8_ratios[i].mfreq;
 
 	regmap_update_bits(cs42xx8->regmap, CS42XX8_FUNCMOD,
 			   CS42XX8_FUNCMOD_xC_FM_MASK(tx) | mask,
-			   CS42XX8_FUNCMOD_xC_FM(tx, fm) | val);
+			   CS42XX8_FUNCMOD_xC_FM(tx, fm[tx]) | val);
+
+	return 0;
+}
+
+static int cs42xx8_hw_free(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs42xx8_priv *cs42xx8 = snd_soc_component_get_drvdata(component);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
+	/* Clear stored rate */
+	cs42xx8->rate[tx] = 0;
+
+	regmap_update_bits(cs42xx8->regmap, CS42XX8_FUNCMOD,
+			   CS42XX8_FUNCMOD_xC_FM_MASK(tx),
+			   CS42XX8_FUNCMOD_xC_FM(tx, CS42XX8_FM_AUTO));
 	return 0;
 }
 
@@ -302,6 +379,7 @@ static const struct snd_soc_dai_ops cs42xx8_dai_ops = {
 	.set_fmt	= cs42xx8_set_dai_fmt,
 	.set_sysclk	= cs42xx8_set_dai_sysclk,
 	.hw_params	= cs42xx8_hw_params,
+	.hw_free	= cs42xx8_hw_free,
 	.digital_mute	= cs42xx8_digital_mute,
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
