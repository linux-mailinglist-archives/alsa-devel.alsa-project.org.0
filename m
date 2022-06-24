Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D9055982F
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 12:51:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7406C18C7;
	Fri, 24 Jun 2022 12:50:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7406C18C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656067860;
	bh=KCIT30npe4ogYODluNp/GiXwQg/ljYKVGzf5o1Tx1bk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NnPGm4tw0FIqJlPRTcR0WChsiVk6AvddAjQy1fOnR5hu4UX01d1qPrUuwjbclMyc4
	 ONcT9FQyradrPazXXyjubCbeZ8gX3ZTSSjh/Cs1aGTQ3zVf99NnP+eWD/D5j5kNAEM
	 f3FAWFAXM0uO2hSZ4LfEsf8erzlB/yH67Gcxct/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43321F80564;
	Fri, 24 Jun 2022 12:48:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF61CF80543; Fri, 24 Jun 2022 12:48:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id 39073F80246
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 12:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39073F80246
Received: from hq-00021.holoplot.net (unknown [176.126.217.202])
 by mail.bugwerft.de (Postfix) with ESMTPSA id BA70F50457C;
 Fri, 24 Jun 2022 10:47:25 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: broonie@kernel.org,
	ryan.lee.analog@gmail.com
Subject: [PATCH 8/8] ASoC: max98396: Fix TDM mode BSEL settings
Date: Fri, 24 Jun 2022 12:47:12 +0200
Message-Id: <20220624104712.1934484-9-daniel@zonque.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624104712.1934484-1-daniel@zonque.org>
References: <20220624104712.1934484-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 Daniel Mack <daniel@zonque.org>
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

As the first 3 entries can also be used for non-TDM setups, the code now
re-uses the same code for such scenarios.

max98396_set_clock() is folded into its only user for clarity.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 sound/soc/codecs/max98396.c | 124 +++++++++++++++++++++++-------------
 1 file changed, 81 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index f28831f4e74b..f1657a5f2140 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -438,47 +438,55 @@ static int max98396_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	return 0;
 }
 
-/* BCLKs per LRCLK */
-static const int bclk_sel_table[] = {
-	32, 48, 64, 96, 128, 192, 256, 384, 512, 320,
+/* Refer to table 5 in the datasheet */
+static const struct max98396_pcm_config {
+	int in, out, width, bsel, max_sr;
+} max98396_pcm_configs[] = {
+	{ .in = 2,  .out = 4,  .width = 16, .bsel = 0x2, /*  32 */ .max_sr = 192000  },
+	{ .in = 2,  .out = 6,  .width = 24, .bsel = 0x3, /*  48 */ .max_sr = 192000  },
+	{ .in = 2,  .out = 8,  .width = 32, .bsel = 0x4, /*  64 */ .max_sr = 192000  },
+	{ .in = 3,  .out = 15, .width = 32, .bsel = 0xd, /* 125 */ .max_sr = 192000  },
+	{ .in = 4,  .out = 8,  .width = 16, .bsel = 0x4, /*  64 */ .max_sr = 192000  },
+	{ .in = 4,  .out = 12, .width = 24, .bsel = 0x5, /*  96 */ .max_sr = 192000  },
+	{ .in = 4,  .out = 16, .width = 32, .bsel = 0x6, /* 128 */ .max_sr = 192000  },
+	{ .in = 5,  .out = 15, .width = 24, .bsel = 0xd, /* 125 */ .max_sr = 192000  },
+	{ .in = 7,  .out = 15, .width = 16, .bsel = 0xd, /* 125 */ .max_sr = 192000  },
+	{ .in = 2,  .out = 4,  .width = 16, .bsel = 0x2, /*  32 */ .max_sr = 96000   },
+	{ .in = 2,  .out = 6,  .width = 24, .bsel = 0x3, /*  48 */ .max_sr = 96000   },
+	{ .in = 2,  .out = 8,  .width = 32, .bsel = 0x4, /*  64 */ .max_sr = 96000   },
+	{ .in = 3,  .out = 15, .width = 32, .bsel = 0xd, /* 125 */ .max_sr = 96000   },
+	{ .in = 4,  .out = 8,  .width = 16, .bsel = 0x4, /*  64 */ .max_sr = 96000   },
+	{ .in = 4,  .out = 12, .width = 24, .bsel = 0x5, /*  96 */ .max_sr = 96000   },
+	{ .in = 4,  .out = 16, .width = 32, .bsel = 0x6, /* 128 */ .max_sr = 96000   },
+	{ .in = 5,  .out = 15, .width = 24, .bsel = 0xd, /* 125 */ .max_sr = 96000   },
+	{ .in = 7,  .out = 15, .width = 16, .bsel = 0xd, /* 125 */ .max_sr = 96000   },
+	{ .in = 7,  .out = 31, .width = 32, .bsel = 0xc, /* 250 */ .max_sr = 96000   },
+	{ .in = 8,  .out = 16, .width = 16, .bsel = 0x6, /* 128 */ .max_sr = 96000   },
+	{ .in = 8,  .out = 24, .width = 24, .bsel = 0x7, /* 192 */ .max_sr = 96000   },
+	{ .in = 8,  .out = 32, .width = 32, .bsel = 0x8, /* 256 */ .max_sr = 96000   },
+	{ .in = 10, .out = 31, .width = 24, .bsel = 0xc, /* 250 */ .max_sr = 96000   },
+	{ .in = 15, .out = 31, .width = 16, .bsel = 0xc, /* 250 */ .max_sr = 96000   },
+	{ .in = 16, .out = 32, .width = 16, .bsel = 0x8, /* 256 */ .max_sr = 96000   },
+	{ .in = 7,  .out = 31, .width = 32, .bsel = 0xc, /* 250 */ .max_sr = 48000   },
+	{ .in = 10, .out = 31, .width = 24, .bsel = 0xc, /* 250 */ .max_sr = 48000   },
+	{ .in = 10, .out = 40, .width = 32, .bsel = 0xb, /* 320 */ .max_sr = 48000   },
+	{ .in = 15, .out = 31, .width = 16, .bsel = 0xc, /* 250 */ .max_sr = 48000   },
+	{ .in = 16, .out = 48, .width = 24, .bsel = 0x9, /* 384 */ .max_sr = 48000   },
+	{ .in = 16, .out = 64, .width = 32, .bsel = 0xa, /* 512 */ .max_sr = 48000   },
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
 
-static int max98396_set_clock(struct snd_soc_component *component,
-			      struct snd_pcm_hw_params *params)
-{
-	struct max98396_priv *max98396 = snd_soc_component_get_drvdata(component);
-	/* BCLK/LRCLK ratio calculation */
-	int blr_clk_ratio = params_channels(params) * max98396->ch_size;
-	int value;
-
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
@@ -489,8 +497,7 @@ static int max98396_dai_hw_params(struct snd_pcm_substream *substream,
 	struct max98396_priv *max98396 = snd_soc_component_get_drvdata(component);
 	unsigned int sampling_rate = 0;
 	unsigned int chan_sz = 0;
-	int ret, reg;
-	int status;
+	int ret, reg, status, bsel;
 	bool update = false;
 
 	/* pcm mode configuration */
@@ -510,8 +517,6 @@ static int max98396_dai_hw_params(struct snd_pcm_substream *substream,
 		goto err;
 	}
 
-	max98396->ch_size = snd_pcm_format_width(params_format(params));
-
 	dev_dbg(component->dev, "format supported %d",
 		params_format(params));
 
@@ -559,6 +564,33 @@ static int max98396_dai_hw_params(struct snd_pcm_substream *substream,
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
@@ -604,12 +636,15 @@ static int max98396_dai_hw_params(struct snd_pcm_substream *substream,
 				   MAX98396_IVADC_SR_MASK,
 				   sampling_rate << MAX98396_IVADC_SR_SHIFT);
 
-	ret = max98396_set_clock(component, params);
+	regmap_update_bits(max98396->regmap,
+			   MAX98396_R2042_PCM_CLK_SETUP,
+			   MAX98396_PCM_CLK_SETUP_BSEL_MASK,
+			   bsel);
 
 	if (status && update)
 		max98396_global_enable_onoff(max98396->regmap, true);
 
-	return ret;
+	return 0;
 
 err:
 	return -EINVAL;
@@ -634,13 +669,16 @@ static int max98396_dai_tdm_slot(struct snd_soc_dai *dai,
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
-- 
2.36.1

