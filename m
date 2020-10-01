Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B31BE27F7F9
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:27:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 481BE1802;
	Thu,  1 Oct 2020 04:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 481BE1802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601519236;
	bh=sxQoSI4TPrI5Ry3S/S7J+kbNa8rob85ZO0Ea71KeK9w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HkrGguYpDsBMYZ7eN/N4VFJT12geCLggGjn9HFe+noeLVSW2E7nY1hqiefQe734zn
	 nCSwHAq+0E96lOepkeBVlGUnNIs0t9LWu8Fobc+CnTXbVgGBKDUB9mC9aIVATLZDXo
	 L+fiYQWbTFzw1O8pphIj34u41H1e3ngFmEV0LU0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0F50F803EB;
	Thu,  1 Oct 2020 04:12:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6988F8034A; Thu,  1 Oct 2020 04:12:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDC85F802F8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC85F802F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="ojI7TKMD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="F/9acT9n"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E5A285803AF;
 Wed, 30 Sep 2020 22:12:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=aStJ5WvKFBvWi
 noOy1wtXw3oPIUWYfRhUmFYhEQ5dks=; b=ojI7TKMDwNpoXWKiiWlfpVRcKggHm
 0atjzDdQABtSpUKjTQqeYueC1CZyV4GAhU4J/v5I1ss99QksWt+pIOFUH6ROi9HK
 mjGZ8mCtltJewDKsDTVfxTXrxkfIdvWjg/bdpp8URFgJOuNZbSsO270RAkgl1gDI
 BtZ5WppoJaYb04kByp7B+KvPYOD8h0jlEJWPnK7FHtmD1k/4uUHmhT3gfZBj4uyZ
 oqSOwnGP+jGkzM3TF/P2JPeAJzhVc5sLZm7j2+fnjz6ynq2kZuYYLdzG6etrM4ip
 ulXFIOYcNnF1rkq66QIfW78cPS+LxbDjMRQN0w+8OnQnZm8vd/MkjI9Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=aStJ5WvKFBvWinoOy1wtXw3oPIUWYfRhUmFYhEQ5dks=; b=F/9acT9n
 PN/0ilcctcqsDsqpuJmJrnwxX5p7zriMWUPC92y8gSU/TQfsHXw1piUqDRgcFH+Q
 YLlYlKp7FWtHKt2dw5gLEZHm8mHrIy4gXrNxbqSeV2f7wWAdAy4woGSOtnHFflFM
 iTx9PuD5CsvTMkmJ8aIs6TczzQ7CdbNDZmsdafWqzG8wvfDEwHRqaPLFI3cg73wL
 mYyRedGkSNYJf3dDpisoFLu0fs9TExcJ5tNRy2dYq7eAyXYuIT29TMpbe5zkbRUi
 VibYk5QbVpwFjzRnbQ0fTBxKtJWw0azv93+eQivPSItYI9VArGITSRgSXcD0y2Oc
 wzUCJydxYnSVAg==
X-ME-Sender: <xms:8Tp1X5BSvwOkZmzPjs4bJ_-fXamwF2_7kQNNI1Y39BpjFm89m7PcoQ>
 <xme:8Tp1X3ijWcG6uMzJQ88gkIMqrU18SG5WKCBKIZoFjbe2paN0f7D6zGkuZkAsTG5YY
 ptNBdDWPuOAEHnhAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedujeenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:8Tp1X0nCCJb1rxVMZeqYzASfazleyHtuJqFLa36iQHfmfAtVyFJeuA>
 <xmx:8Tp1Xzy7d27U4-DIORnci7lIPKUjZ_BLi3MmMWFCmzhqR2MFL1yvYw>
 <xmx:8Tp1X-RkxnrlkbVOIoqEfKX6hLQBiu132h0SW6P7kwSLzZJjWLsPLg>
 <xmx:8Tp1XxHPgMpBbf2c9oWEmD_EPF-s8MZz5ll6Zs73mWrBMQ3iBAwI8g>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1F83B306467E;
 Wed, 30 Sep 2020 22:12:01 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 25/25] ASoC: sun8i-codec: Add a DAI, widgets,
 and routes for AIF3
Date: Wed, 30 Sep 2020 21:11:48 -0500
Message-Id: <20201001021148.15852-26-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201001021148.15852-1-samuel@sholland.org>
References: <20201001021148.15852-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
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

AIF3 has some differences from AIF1 and AIF2:
 - It supports mono only
 - It supports master mode only
 - It is not directly connected to any of the mixers; instead all audio
   goes through a mux with AIF2.
 - It does not have its own clock dividers; instead it reuses AIF2 BCLK.
   This means that when both AIF2 and AIF3 are active, they must run at
   the same sample rate and total frame width. Since AIF2 and AIF3 are
   only used for codec2codec DAI links, constraints are not applicable
   here; the only thing we can do when the rates don't match is report
   an error.

Make the necessary adjustments to support this AIF.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 136 +++++++++++++++++++++++++++++++---
 1 file changed, 127 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 9fa4eca501df..344d9ad85fa6 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -29,21 +29,23 @@
 #define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_PLL		(0x2 << 4)
 #define SUN8I_SYSCLK_CTL_SYSCLK_ENA			3
 #define SUN8I_SYSCLK_CTL_SYSCLK_SRC			0
 #define SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF1CLK		(0x0 << 0)
 #define SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF2CLK		(0x1 << 0)
 #define SUN8I_MOD_CLK_ENA				0x010
 #define SUN8I_MOD_CLK_ENA_AIF1				15
 #define SUN8I_MOD_CLK_ENA_AIF2				14
+#define SUN8I_MOD_CLK_ENA_AIF3				13
 #define SUN8I_MOD_CLK_ENA_ADC				3
 #define SUN8I_MOD_CLK_ENA_DAC				2
 #define SUN8I_MOD_RST_CTL				0x014
 #define SUN8I_MOD_RST_CTL_AIF1				15
 #define SUN8I_MOD_RST_CTL_AIF2				14
+#define SUN8I_MOD_RST_CTL_AIF3				13
 #define SUN8I_MOD_RST_CTL_ADC				3
 #define SUN8I_MOD_RST_CTL_DAC				2
 #define SUN8I_SYS_SR_CTRL				0x018
 #define SUN8I_SYS_SR_CTRL_AIF1_FS			12
 #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
 #define SUN8I_AIF_CLK_CTRL(n)				(0x040 * (1 + (n)))
 #define SUN8I_AIF_CLK_CTRL_MSTR_MOD			15
 #define SUN8I_AIF_CLK_CTRL_CLK_INV			13
@@ -84,16 +86,19 @@
 #define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA0L	15
 #define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA1L	14
 #define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF2DACR	13
 #define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_ADCL		12
 #define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA0R	11
 #define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA1R	10
 #define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF2DACL	9
 #define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_ADCR		8
+#define SUN8I_AIF3_CLK_CTRL_AIF3_CLK_SRC_AIF1		(0x0 << 0)
+#define SUN8I_AIF3_CLK_CTRL_AIF3_CLK_SRC_AIF2		(0x1 << 0)
+#define SUN8I_AIF3_CLK_CTRL_AIF3_CLK_SRC_AIF1CLK	(0x2 << 0)
 #define SUN8I_AIF3_PATH_CTRL				0x0cc
 #define SUN8I_AIF3_PATH_CTRL_AIF3_ADC_SRC		10
 #define SUN8I_AIF3_PATH_CTRL_AIF2_DAC_SRC		8
 #define SUN8I_AIF3_PATH_CTRL_AIF3_PINS_TRI		7
 #define SUN8I_ADC_DIG_CTRL				0x100
 #define SUN8I_ADC_DIG_CTRL_ENAD				15
 #define SUN8I_ADC_DIG_CTRL_ADOUT_DTS			2
 #define SUN8I_ADC_DIG_CTRL_ADOUT_DLY			1
@@ -113,16 +118,17 @@
 #define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK	GENMASK(5, 4)
 #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
 #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
 #define SUN8I_AIF_CLK_CTRL_CLK_INV_MASK		GENMASK(14, 13)
 #define SUN8I_AIF_CLK_CTRL_BCLK_DIV_MASK	GENMASK(12, 9)
 #define SUN8I_AIF_CLK_CTRL_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF_CLK_CTRL_WORD_SIZ_MASK	GENMASK(5, 4)
 #define SUN8I_AIF_CLK_CTRL_DATA_FMT_MASK	GENMASK(3, 2)
+#define SUN8I_AIF3_CLK_CTRL_AIF3_CLK_SRC_MASK	GENMASK(1, 0)
 
 #define SUN8I_CODEC_PASSTHROUGH_SAMPLE_RATE 48000
 
 #define SUN8I_CODEC_PCM_FORMATS	(SNDRV_PCM_FMTBIT_S8     |\
 				 SNDRV_PCM_FMTBIT_S16_LE |\
 				 SNDRV_PCM_FMTBIT_S20_LE |\
 				 SNDRV_PCM_FMTBIT_S24_LE |\
 				 SNDRV_PCM_FMTBIT_S20_3LE|\
@@ -133,20 +139,22 @@
 				 SNDRV_PCM_RATE_96000     |\
 				 SNDRV_PCM_RATE_176400    |\
 				 SNDRV_PCM_RATE_192000    |\
 				 SNDRV_PCM_RATE_KNOT)
 
 enum {
 	AIF1,
 	AIF2,
+	AIF3,
 	NAIFS
 };
 
 struct sun8i_codec_aif {
+	unsigned int	lrck_div_order;
 	unsigned int	sample_rate;
 	unsigned int	slots;
 	unsigned int	slot_width;
 	unsigned int	active_streams	: 2;
 	unsigned int	open_streams	: 2;
 };
 
 struct sun8i_codec_quirks {
@@ -264,19 +272,30 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
 		value = 0x0;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	regmap_update_bits(scodec->regmap, reg,
-			   BIT(SUN8I_AIF_CLK_CTRL_MSTR_MOD),
-			   value << SUN8I_AIF_CLK_CTRL_MSTR_MOD);
+	if (dai->id == AIF3) {
+		/* AIF3 only supports master mode. */
+		if (value)
+			return -EINVAL;
+
+		/* Use the AIF2 BCLK and LRCK for AIF3. */
+		regmap_update_bits(scodec->regmap, reg,
+				   SUN8I_AIF3_CLK_CTRL_AIF3_CLK_SRC_MASK,
+				   SUN8I_AIF3_CLK_CTRL_AIF3_CLK_SRC_AIF2);
+	} else {
+		regmap_update_bits(scodec->regmap, reg,
+				   BIT(SUN8I_AIF_CLK_CTRL_MSTR_MOD),
+				   value << SUN8I_AIF_CLK_CTRL_MSTR_MOD);
+	}
 
 	/* DAI format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		format = 0x0;
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
 		format = 0x1;
@@ -291,19 +310,25 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_DSP_B:
 		format = 0x3;
 		invert = 0x1; /* Set LRCK_INV to 1 */
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	regmap_update_bits(scodec->regmap, reg,
-			   SUN8I_AIF_CLK_CTRL_DATA_FMT_MASK,
-			   format << SUN8I_AIF_CLK_CTRL_DATA_FMT);
+	if (dai->id == AIF3) {
+		/* AIF3 only supports DSP formats. */
+		if (format != 3)
+			return -EINVAL;
+	} else {
+		regmap_update_bits(scodec->regmap, reg,
+				   SUN8I_AIF_CLK_CTRL_DATA_FMT_MASK,
+				   format << SUN8I_AIF_CLK_CTRL_DATA_FMT);
+	}
 
 	/* clock inversion */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF: /* Normal */
 		value = 0x0;
 		break;
 	case SND_SOC_DAIFMT_NB_IF: /* Inverted LRCK */
 		value = 0x1;
@@ -468,17 +493,17 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
 	unsigned int sample_rate = params_rate(params);
 	unsigned int slots = aif->slots ?: params_channels(params);
 	unsigned int slot_width = aif->slot_width ?: params_width(params);
 	unsigned int sysclk_rate = sun8i_codec_get_sysclk_rate(sample_rate);
 	int bclk_div, lrck_div_order, ret, word_size;
-	u32 reg = SUN8I_AIF_CLK_CTRL(dai->id);
+	u32 div_reg, reg = SUN8I_AIF_CLK_CTRL(dai->id);
 
 	/* word size */
 	switch (params_width(params)) {
 	case 8:
 		word_size = 0x0;
 		break;
 	case 16:
 		word_size = 0x1;
@@ -497,26 +522,45 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 			   SUN8I_AIF_CLK_CTRL_WORD_SIZ_MASK,
 			   word_size << SUN8I_AIF_CLK_CTRL_WORD_SIZ);
 
 	/* LRCK divider (BCLK/LRCK ratio) */
 	lrck_div_order = sun8i_codec_get_lrck_div_order(slots, slot_width);
 	if (lrck_div_order < 0)
 		return lrck_div_order;
 
-	regmap_update_bits(scodec->regmap, reg,
+	if (dai->id != AIF1) {
+		/* AIF2 and AIF3 share BCLK and LRCK generation circuitry. */
+		int partner = (AIF2 + AIF3) - dai->id;
+		struct sun8i_codec_aif *partner_aif = &scodec->aifs[partner];
+
+		if (partner_aif->open_streams &&
+		    (lrck_div_order != partner_aif->lrck_div_order ||
+		     sample_rate != partner_aif->sample_rate)) {
+			dev_err(dai->dev, "Cannot enable %s: clock rate mismatch! "
+				"AIF2 and AIF3 must use the same sample and bit rates.\n",
+				dai->name);
+			return -EBUSY;
+		}
+
+		div_reg = SUN8I_AIF_CLK_CTRL(AIF2);
+	} else {
+		div_reg = reg;
+	}
+
+	regmap_update_bits(scodec->regmap, div_reg,
 			   SUN8I_AIF_CLK_CTRL_LRCK_DIV_MASK,
 			   (lrck_div_order - 4) << SUN8I_AIF_CLK_CTRL_LRCK_DIV);
 
 	/* BCLK divider (SYSCLK/BCLK ratio) */
 	bclk_div = sun8i_codec_get_bclk_div(sysclk_rate, lrck_div_order, sample_rate);
 	if (bclk_div < 0)
 		return bclk_div;
 
-	regmap_update_bits(scodec->regmap, reg,
+	regmap_update_bits(scodec->regmap, div_reg,
 			   SUN8I_AIF_CLK_CTRL_BCLK_DIV_MASK,
 			   bclk_div << SUN8I_AIF_CLK_CTRL_BCLK_DIV);
 
 	/* SYSCLK rate */
 	if (aif->open_streams) {
 		ret = clk_set_rate(scodec->clk_module, sysclk_rate);
 		if (ret < 0)
 			return ret;
@@ -528,16 +572,17 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 				dai->name, sample_rate);
 		if (ret < 0)
 			return ret;
 
 		scodec->sysclk_rate = sysclk_rate;
 		scodec->sysclk_refcnt++;
 	}
 
+	aif->lrck_div_order = lrck_div_order;
 	aif->sample_rate = sample_rate;
 	aif->open_streams |= BIT(substream->stream);
 
 	return sun8i_codec_update_sample_rate(scodec);
 }
 
 static int sun8i_codec_hw_free(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
@@ -546,16 +591,17 @@ static int sun8i_codec_hw_free(struct snd_pcm_substream *substream,
 	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
 
 	if (aif->open_streams != BIT(substream->stream))
 		goto done;
 
 	scodec->sysclk_refcnt--;
 	clk_rate_exclusive_put(scodec->clk_module);
 
+	aif->lrck_div_order = 0;
 	aif->sample_rate = 0;
 
 done:
 	aif->open_streams &= ~BIT(substream->stream);
 	return 0;
 }
 
 static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
@@ -612,16 +658,41 @@ static struct snd_soc_dai_driver sun8i_codec_dais[] = {
 			.channels_max	= 2,
 			.rates		= SUN8I_CODEC_PCM_RATES,
 			.formats	= SUN8I_CODEC_PCM_FORMATS,
 		},
 		.symmetric_rates	= true,
 		.symmetric_channels	= true,
 		.symmetric_samplebits	= true,
 	},
+	{
+		.name	= "sun8i-codec-aif3",
+		.id	= AIF3,
+		.ops	= &sun8i_codec_dai_ops,
+		/* capture capabilities */
+		.capture = {
+			.stream_name	= "AIF3 Capture",
+			.channels_min	= 1,
+			.channels_max	= 1,
+			.rates		= SUN8I_CODEC_PCM_RATES,
+			.formats	= SUN8I_CODEC_PCM_FORMATS,
+			.sig_bits	= 24,
+		},
+		/* playback capabilities */
+		.playback = {
+			.stream_name	= "AIF3 Playback",
+			.channels_min	= 1,
+			.channels_max	= 1,
+			.rates		= SUN8I_CODEC_PCM_RATES,
+			.formats	= SUN8I_CODEC_PCM_FORMATS,
+		},
+		.symmetric_rates	= true,
+		.symmetric_channels	= true,
+		.symmetric_samplebits	= true,
+	},
 };
 
 static int sun8i_codec_aif_event(struct snd_soc_dapm_widget *w,
 				 struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct sun8i_codec *scodec = snd_soc_component_get_drvdata(component);
 	struct sun8i_codec_aif *aif = &scodec->aifs[w->sname[3] - '1'];
@@ -654,16 +725,29 @@ static SOC_ENUM_DOUBLE_DECL(sun8i_aif2_adc_stereo_mux_enum,
 			    SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_SRC,
 			    SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_SRC,
 			    sun8i_aif_stereo_mux_enum_values);
 
 static const struct snd_kcontrol_new sun8i_aif2_adc_stereo_mux_control =
 	SOC_DAPM_ENUM("AIF2 ADC Stereo Capture Route",
 		      sun8i_aif2_adc_stereo_mux_enum);
 
+static const char *const sun8i_aif3_adc_mux_enum_values[] = {
+	"None", "AIF2 ADCL", "AIF2 ADCR"
+};
+
+static SOC_ENUM_SINGLE_DECL(sun8i_aif3_adc_mux_enum,
+			    SUN8I_AIF3_PATH_CTRL,
+			    SUN8I_AIF3_PATH_CTRL_AIF3_ADC_SRC,
+			    sun8i_aif3_adc_mux_enum_values);
+
+static const struct snd_kcontrol_new sun8i_aif3_adc_mux_control =
+	SOC_DAPM_ENUM("AIF3 ADC Source Capture Route",
+		      sun8i_aif3_adc_mux_enum);
+
 static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF1DA0L,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF1DA0R, 1, 0),
 	SOC_DAPM_DOUBLE("AIF2 Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACL,
@@ -763,30 +847,36 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 
 	/* Module Clocks */
 	SND_SOC_DAPM_SUPPLY("CLK AIF1",
 			    SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_AIF1, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("CLK AIF2",
 			    SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_AIF2, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("CLK AIF3",
+			    SUN8I_MOD_CLK_ENA,
+			    SUN8I_MOD_CLK_ENA_AIF3, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("CLK ADC",
 			    SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_ADC, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("CLK DAC",
 			    SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_DAC, 0, NULL, 0),
 
 	/* Module Resets */
 	SND_SOC_DAPM_SUPPLY("RST AIF1",
 			    SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_AIF1, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST AIF2",
 			    SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_AIF2, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("RST AIF3",
+			    SUN8I_MOD_RST_CTL,
+			    SUN8I_MOD_RST_CTL_AIF3, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST ADC",
 			    SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_ADC, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST DAC",
 			    SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_DAC, 0, NULL, 0),
 
 	/* Module Supplies */
@@ -811,27 +901,36 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 			       SUN8I_AIF2_ADCDAT_CTRL,
 			       SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_ENA, 0,
 			       sun8i_codec_aif_event,
 			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_AIF_OUT("AIF2 ADCR", "AIF2 Capture", 1,
 			     SUN8I_AIF2_ADCDAT_CTRL,
 			     SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_ENA, 0),
 
+	SND_SOC_DAPM_AIF_OUT_E("AIF3 ADC", "AIF3 Capture", 0,
+			       SND_SOC_NOPM, 0, 0,
+			       sun8i_codec_aif_event,
+			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
 	/* AIF "ADC" Mono/Stereo Muxes */
 	SND_SOC_DAPM_MUX("AIF1 AD0L Stereo Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif1_ad0_stereo_mux_control),
 	SND_SOC_DAPM_MUX("AIF1 AD0R Stereo Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif1_ad0_stereo_mux_control),
 
 	SND_SOC_DAPM_MUX("AIF2 ADCL Stereo Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif2_adc_stereo_mux_control),
 	SND_SOC_DAPM_MUX("AIF2 ADCR Stereo Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif2_adc_stereo_mux_control),
 
+	/* AIF "ADC" Output Muxes */
+	SND_SOC_DAPM_MUX("AIF3 ADC Source Capture Route", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif3_adc_mux_control),
+
 	/* AIF "ADC" Mixers */
 	SOC_MIXER_ARRAY("AIF1 AD0L Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 	SOC_MIXER_ARRAY("AIF1 AD0R Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 
 	SOC_MIXER_ARRAY("AIF2 ADCL Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif2_adc_mixer_controls),
@@ -869,16 +968,21 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 			      SUN8I_AIF2_DACDAT_CTRL,
 			      SUN8I_AIF2_DACDAT_CTRL_AIF2_DACL_ENA, 0,
 			      sun8i_codec_aif_event,
 			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_AIF_IN("AIF2 DACR", "AIF2 Playback", 1,
 			    SUN8I_AIF2_DACDAT_CTRL,
 			    SUN8I_AIF2_DACDAT_CTRL_AIF2_DACR_ENA, 0),
 
+	SND_SOC_DAPM_AIF_IN_E("AIF3 DAC", "AIF3 Playback", 0,
+			      SND_SOC_NOPM, 0, 0,
+			      sun8i_codec_aif_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
 	/* ADC Inputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_ADC("ADCL", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_ADC("ADCR", NULL, SND_SOC_NOPM, 0, 0),
 
 	/* DAC Outputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_DAC("DACL", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_DAC("DACR", NULL, SND_SOC_NOPM, 0, 0),
 
@@ -906,16 +1010,22 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	{ "CLK AIF2", NULL, "AIF2CLK" },
 	{ "CLK AIF2", NULL, "SYSCLK" },
 	{ "RST AIF2", NULL, "CLK AIF2" },
 	{ "AIF2 ADCL", NULL, "RST AIF2" },
 	{ "AIF2 ADCR", NULL, "RST AIF2" },
 	{ "AIF2 DACL", NULL, "RST AIF2" },
 	{ "AIF2 DACR", NULL, "RST AIF2" },
 
+	{ "CLK AIF3", NULL, "AIF1CLK" },
+	{ "CLK AIF3", NULL, "SYSCLK" },
+	{ "RST AIF3", NULL, "CLK AIF3" },
+	{ "AIF3 ADC", NULL, "RST AIF3" },
+	{ "AIF3 DAC", NULL, "RST AIF3" },
+
 	{ "CLK ADC", NULL, "SYSCLK" },
 	{ "RST ADC", NULL, "CLK ADC" },
 	{ "ADC", NULL, "RST ADC" },
 	{ "ADCL", NULL, "ADC" },
 	{ "ADCR", NULL, "ADC" },
 
 	{ "CLK DAC", NULL, "SYSCLK" },
 	{ "RST DAC", NULL, "CLK DAC" },
@@ -925,16 +1035,18 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 
 	/* AIF "ADC" Output Routes */
 	{ "AIF1 AD0L", NULL, "AIF1 AD0L Stereo Mux" },
 	{ "AIF1 AD0R", NULL, "AIF1 AD0R Stereo Mux" },
 
 	{ "AIF2 ADCL", NULL, "AIF2 ADCL Stereo Mux" },
 	{ "AIF2 ADCR", NULL, "AIF2 ADCR Stereo Mux" },
 
+	{ "AIF3 ADC", NULL, "AIF3 ADC Source Capture Route" },
+
 	/* AIF "ADC" Mono/Stereo Mux Routes */
 	{ "AIF1 AD0L Stereo Mux", "Stereo", "AIF1 AD0L Mixer" },
 	{ "AIF1 AD0L Stereo Mux", "Reverse Stereo", "AIF1 AD0R Mixer" },
 	{ "AIF1 AD0L Stereo Mux", "Sum Mono", "AIF1 AD0L Mixer" },
 	{ "AIF1 AD0L Stereo Mux", "Sum Mono", "AIF1 AD0R Mixer" },
 	{ "AIF1 AD0L Stereo Mux", "Mix Mono", "AIF1 AD0L Mixer" },
 	{ "AIF1 AD0L Stereo Mux", "Mix Mono", "AIF1 AD0R Mixer" },
 
@@ -954,16 +1066,20 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 
 	{ "AIF2 ADCR Stereo Mux", "Stereo", "AIF2 ADCR Mixer" },
 	{ "AIF2 ADCR Stereo Mux", "Reverse Stereo", "AIF2 ADCL Mixer" },
 	{ "AIF2 ADCR Stereo Mux", "Sum Mono", "AIF2 ADCL Mixer" },
 	{ "AIF2 ADCR Stereo Mux", "Sum Mono", "AIF2 ADCR Mixer" },
 	{ "AIF2 ADCR Stereo Mux", "Mix Mono", "AIF2 ADCL Mixer" },
 	{ "AIF2 ADCR Stereo Mux", "Mix Mono", "AIF2 ADCR Mixer" },
 
+	/* AIF "ADC" Output Mux Routes */
+	{ "AIF3 ADC Source Capture Route", "AIF2 ADCL", "AIF2 ADCL Mixer" },
+	{ "AIF3 ADC Source Capture Route", "AIF2 ADCR", "AIF2 ADCR Mixer" },
+
 	/* AIF "ADC" Mixer Routes */
 	{ "AIF1 AD0L Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0L Stereo Mux" },
 	{ "AIF1 AD0L Mixer", "AIF2 Digital ADC Capture Switch", "AIF2 DACL Source" },
 	{ "AIF1 AD0L Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCL" },
 	{ "AIF1 AD0L Mixer", "AIF2 Inv Digital ADC Capture Switch", "AIF2 DACR Source" },
 
 	{ "AIF1 AD0R Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0R Stereo Mux" },
 	{ "AIF1 AD0R Mixer", "AIF2 Digital ADC Capture Switch", "AIF2 DACR Source" },
@@ -975,20 +1091,22 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	{ "AIF2 ADCL Mixer", "AIF2 ADC Mixer ADC Capture Switch", "ADCL" },
 
 	{ "AIF2 ADCR Mixer", "AIF2 ADC Mixer AIF1 DA0 Capture Switch", "AIF1 DA0R Stereo Mux" },
 	{ "AIF2 ADCR Mixer", "AIF2 ADC Mixer AIF2 DAC Rev Capture Switch", "AIF2 DACL Source" },
 	{ "AIF2 ADCR Mixer", "AIF2 ADC Mixer ADC Capture Switch", "ADCR" },
 
 	/* AIF "DAC" Input Mux Routes */
 	{ "AIF2 DACL Source", "AIF2", "AIF2 DACL Stereo Mux" },
+	{ "AIF2 DACL Source", "AIF3+2", "AIF3 DAC" },
 	{ "AIF2 DACL Source", "AIF2+3", "AIF2 DACL Stereo Mux" },
 
 	{ "AIF2 DACR Source", "AIF2", "AIF2 DACR Stereo Mux" },
 	{ "AIF2 DACR Source", "AIF3+2", "AIF2 DACR Stereo Mux" },
+	{ "AIF2 DACR Source", "AIF2+3", "AIF3 DAC" },
 
 	/* AIF "DAC" Mono/Stereo Mux Routes */
 	{ "AIF1 DA0L Stereo Mux", "Stereo", "AIF1 DA0L" },
 	{ "AIF1 DA0L Stereo Mux", "Reverse Stereo", "AIF1 DA0R" },
 	{ "AIF1 DA0L Stereo Mux", "Sum Mono", "AIF1 DA0L" },
 	{ "AIF1 DA0L Stereo Mux", "Sum Mono", "AIF1 DA0R" },
 	{ "AIF1 DA0L Stereo Mux", "Mix Mono", "AIF1 DA0L" },
 	{ "AIF1 DA0L Stereo Mux", "Mix Mono", "AIF1 DA0R" },
-- 
2.26.2

