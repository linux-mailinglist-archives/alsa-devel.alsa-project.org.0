Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB4355F583
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 07:10:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58186164E;
	Wed, 29 Jun 2022 07:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58186164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656479407;
	bh=NSy6z+RbiyPXUtc0z5/H9hHEMsS4jmLpixuvkvA5U4A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MWJgxa+kzD3M/nNDJ/NfGOrhWMCBX3hoEs9iGGglNIwt57DHhU4vDVG7YKENfuvOR
	 kcta4iOlWIC51FtmeYM2/60brg5gX1rpDYdUSb/zPDfVWV6uebqXJwiBwqTawBi/rh
	 0NoUQDyiLkKAWaYquzEi2J+ozQjz1ivzBd6wG7ZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD8E0F80107;
	Wed, 29 Jun 2022 07:09:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73ADCF8020D; Wed, 29 Jun 2022 07:09:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id AB082F80115
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 07:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB082F80115
Received: from hq-00021.fritz.box (p57bc98a6.dip0.t-ipconnect.de
 [87.188.152.166])
 by mail.bugwerft.de (Postfix) with ESMTPSA id C0293282E50;
 Wed, 29 Jun 2022 05:08:25 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: broonie@kernel.org,
	ryan.lee.analog@gmail.com
Subject: [PATCH] ASoC: max98396: Fix TDM mode BSEL settings
Date: Wed, 29 Jun 2022 07:06:30 +0200
Message-Id: <20220629050630.2848317-1-daniel@zonque.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
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

In TDM mode, the BSEL register value must be set according to table 5 in the
datasheet. This patch adds a lookup function and uses it in
max98396_dai_tdm_slot().

As the first 3 entries can also be used for non-TDM setups, the code re-uses
the same table for such scenarios.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 sound/soc/codecs/max98396.c | 138 +++++++++++++++++++++++++-----------
 sound/soc/codecs/max98396.h |   2 +-
 2 files changed, 96 insertions(+), 44 deletions(-)

diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index f28831f4e74b..1b6f053adba2 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -438,47 +438,68 @@ static int max98396_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	return 0;
 }
 
-/* BCLKs per LRCLK */
-static const int bclk_sel_table[] = {
-	32, 48, 64, 96, 128, 192, 256, 384, 512, 320,
+#define MAX98396_BSEL_32	0x2
+#define MAX98396_BSEL_48	0x3
+#define MAX98396_BSEL_64	0x4
+#define MAX98396_BSEL_96	0x5
+#define MAX98396_BSEL_128	0x6
+#define MAX98396_BSEL_192	0x7
+#define MAX98396_BSEL_256	0x8
+#define MAX98396_BSEL_384	0x9
+#define MAX98396_BSEL_512	0xa
+#define MAX98396_BSEL_320	0xb
+#define MAX98396_BSEL_250	0xc
+#define MAX98396_BSEL_125	0xd
+
+/* Refer to table 5 in the datasheet */
+static const struct max98396_pcm_config {
+	int in, out, width, bsel, max_sr;
+} max98396_pcm_configs[] = {
+	{ .in = 2,  .out = 4,  .width = 16, .bsel = MAX98396_BSEL_32,  .max_sr = 192000 },
+	{ .in = 2,  .out = 6,  .width = 24, .bsel = MAX98396_BSEL_48,  .max_sr = 192000 },
+	{ .in = 2,  .out = 8,  .width = 32, .bsel = MAX98396_BSEL_64,  .max_sr = 192000 },
+	{ .in = 3,  .out = 15, .width = 32, .bsel = MAX98396_BSEL_125, .max_sr = 192000 },
+	{ .in = 4,  .out = 8,  .width = 16, .bsel = MAX98396_BSEL_64,  .max_sr = 192000 },
+	{ .in = 4,  .out = 12, .width = 24, .bsel = MAX98396_BSEL_96,  .max_sr = 192000 },
+	{ .in = 4,  .out = 16, .width = 32, .bsel = MAX98396_BSEL_128, .max_sr = 192000 },
+	{ .in = 5,  .out = 15, .width = 24, .bsel = MAX98396_BSEL_125, .max_sr = 192000 },
+	{ .in = 7,  .out = 15, .width = 16, .bsel = MAX98396_BSEL_125, .max_sr = 192000 },
+	{ .in = 2,  .out = 4,  .width = 16, .bsel = MAX98396_BSEL_32,  .max_sr = 96000  },
+	{ .in = 2,  .out = 6,  .width = 24, .bsel = MAX98396_BSEL_48,  .max_sr = 96000  },
+	{ .in = 2,  .out = 8,  .width = 32, .bsel = MAX98396_BSEL_64,  .max_sr = 96000  },
+	{ .in = 3,  .out = 15, .width = 32, .bsel = MAX98396_BSEL_125, .max_sr = 96000  },
+	{ .in = 4,  .out = 8,  .width = 16, .bsel = MAX98396_BSEL_64,  .max_sr = 96000  },
+	{ .in = 4,  .out = 12, .width = 24, .bsel = MAX98396_BSEL_96,  .max_sr = 96000  },
+	{ .in = 4,  .out = 16, .width = 32, .bsel = MAX98396_BSEL_128, .max_sr = 96000  },
+	{ .in = 5,  .out = 15, .width = 24, .bsel = MAX98396_BSEL_125, .max_sr = 96000  },
+	{ .in = 7,  .out = 15, .width = 16, .bsel = MAX98396_BSEL_125, .max_sr = 96000  },
+	{ .in = 7,  .out = 31, .width = 32, .bsel = MAX98396_BSEL_250, .max_sr = 96000  },
+	{ .in = 8,  .out = 16, .width = 16, .bsel = MAX98396_BSEL_128, .max_sr = 96000  },
+	{ .in = 8,  .out = 24, .width = 24, .bsel = MAX98396_BSEL_192, .max_sr = 96000  },
+	{ .in = 8,  .out = 32, .width = 32, .bsel = MAX98396_BSEL_256, .max_sr = 96000  },
+	{ .in = 10, .out = 31, .width = 24, .bsel = MAX98396_BSEL_250, .max_sr = 96000  },
+	{ .in = 15, .out = 31, .width = 16, .bsel = MAX98396_BSEL_250, .max_sr = 96000  },
+	{ .in = 16, .out = 32, .width = 16, .bsel = MAX98396_BSEL_256, .max_sr = 96000  },
+	{ .in = 7,  .out = 31, .width = 32, .bsel = MAX98396_BSEL_250, .max_sr = 48000  },
+	{ .in = 10, .out = 31, .width = 24, .bsel = MAX98396_BSEL_250, .max_sr = 48000  },
+	{ .in = 10, .out = 40, .width = 32, .bsel = MAX98396_BSEL_320, .max_sr = 48000  },
+	{ .in = 15, .out = 31, .width = 16, .bsel = MAX98396_BSEL_250, .max_sr = 48000  },
+	{ .in = 16, .out = 48, .width = 24, .bsel = MAX98396_BSEL_384, .max_sr = 48000  },
+	{ .in = 16, .out = 64, .width = 32, .bsel = MAX98396_BSEL_512, .max_sr = 48000  },
 };
 
-static int max98396_get_bclk_sel(int bclk)
+static int max98396_pcm_config_index(int in_slots, int out_slots, int width)
 {
 	int i;
-	/* match BCLKs per LRCLK */
-	for (i = 0; i < ARRAY_SIZE(bclk_sel_table); i++) {
-		if (bclk_sel_table[i] == bclk)
-			return i + 2;
-	}
-	return 0;
-}
-
-static int max98396_set_clock(struct snd_soc_component *component,
-			      struct snd_pcm_hw_params *params)
-{
-	struct max98396_priv *max98396 = snd_soc_component_get_drvdata(component);
-	/* BCLK/LRCLK ratio calculation */
-	int blr_clk_ratio = params_channels(params) * max98396->ch_size;
-	int value;
 
-	if (!max98396->tdm_mode) {
-		/* BCLK configuration */
-		value = max98396_get_bclk_sel(blr_clk_ratio);
-		if (!value) {
-			dev_err(component->dev,
-				"blr_clk_ratio %d unsupported, format %d\n",
-				blr_clk_ratio, params_format(params));
-			return -EINVAL;
-		}
+	for (i = 0; i < ARRAY_SIZE(max98396_pcm_configs); i++) {
+		const struct max98396_pcm_config *c = &max98396_pcm_configs[i];
 
-		regmap_update_bits(max98396->regmap,
-				   MAX98396_R2042_PCM_CLK_SETUP,
-				   MAX98396_PCM_CLK_SETUP_BSEL_MASK,
-				   value);
+		if (in_slots == c->in && out_slots <= c->out && width == c->width)
+			return i;
 	}
 
-	return 0;
+	return -1;
 }
 
 static int max98396_dai_hw_params(struct snd_pcm_substream *substream,
@@ -489,8 +510,7 @@ static int max98396_dai_hw_params(struct snd_pcm_substream *substream,
 	struct max98396_priv *max98396 = snd_soc_component_get_drvdata(component);
 	unsigned int sampling_rate = 0;
 	unsigned int chan_sz = 0;
-	int ret, reg;
-	int status;
+	int ret, reg, status, bsel = 0;
 	bool update = false;
 
 	/* pcm mode configuration */
@@ -510,8 +530,6 @@ static int max98396_dai_hw_params(struct snd_pcm_substream *substream,
 		goto err;
 	}
 
-	max98396->ch_size = snd_pcm_format_width(params_format(params));
-
 	dev_dbg(component->dev, "format supported %d",
 		params_format(params));
 
@@ -559,6 +577,33 @@ static int max98396_dai_hw_params(struct snd_pcm_substream *substream,
 		goto err;
 	}
 
+	if (max98396->tdm_mode) {
+		if (params_rate(params) > max98396->tdm_max_samplerate) {
+			dev_err(component->dev, "TDM sample rate %d too high",
+				params_rate(params));
+			goto err;
+		}
+	} else {
+		/* BCLK configuration */
+		ret = max98396_pcm_config_index(params_channels(params),
+						params_channels(params),
+						snd_pcm_format_width(params_format(params)));
+		if (ret < 0) {
+			dev_err(component->dev,
+				"no PCM config for %d channels, format %d\n",
+				params_channels(params), params_format(params));
+			goto err;
+		}
+
+		bsel = max98396_pcm_configs[ret].bsel;
+
+		if (params_rate(params) > max98396_pcm_configs[ret].max_sr) {
+			dev_err(component->dev, "sample rate %d too high",
+				params_rate(params));
+			goto err;
+		}
+	}
+
 	ret = regmap_read(max98396->regmap, MAX98396_R210F_GLOBAL_EN, &status);
 	if (ret < 0)
 		goto err;
@@ -604,12 +649,16 @@ static int max98396_dai_hw_params(struct snd_pcm_substream *substream,
 				   MAX98396_IVADC_SR_MASK,
 				   sampling_rate << MAX98396_IVADC_SR_SHIFT);
 
-	ret = max98396_set_clock(component, params);
+	if (bsel)
+		regmap_update_bits(max98396->regmap,
+				MAX98396_R2042_PCM_CLK_SETUP,
+				MAX98396_PCM_CLK_SETUP_BSEL_MASK,
+				bsel);
 
 	if (status && update)
 		max98396_global_enable_onoff(max98396->regmap, true);
 
-	return ret;
+	return 0;
 
 err:
 	return -EINVAL;
@@ -634,13 +683,16 @@ static int max98396_dai_tdm_slot(struct snd_soc_dai *dai,
 		max98396->tdm_mode = true;
 
 	/* BCLK configuration */
-	bsel = max98396_get_bclk_sel(slots * slot_width);
-	if (bsel == 0) {
-		dev_err(component->dev, "BCLK %d not supported\n",
-			slots * slot_width);
+	ret = max98396_pcm_config_index(slots, slots, slot_width);
+	if (ret < 0) {
+		dev_err(component->dev, "no TDM config for %d slots %d bits\n",
+			slots, slot_width);
 		return -EINVAL;
 	}
 
+	bsel = max98396_pcm_configs[ret].bsel;
+	max98396->tdm_max_samplerate = max98396_pcm_configs[ret].max_sr;
+
 	/* Channel size configuration */
 	switch (slot_width) {
 	case 16:
diff --git a/sound/soc/codecs/max98396.h b/sound/soc/codecs/max98396.h
index ff330ef61568..7278c779989a 100644
--- a/sound/soc/codecs/max98396.h
+++ b/sound/soc/codecs/max98396.h
@@ -306,8 +306,8 @@ struct max98396_priv {
 	unsigned int spkfb_slot;
 	unsigned int bypass_slot;
 	bool interleave_mode;
-	unsigned int ch_size;
 	bool tdm_mode;
+	int tdm_max_samplerate;
 	int device_id;
 };
 #endif
-- 
2.36.1

