Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31E27F7F7
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:26:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D8C3188B;
	Thu,  1 Oct 2020 04:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D8C3188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601519168;
	bh=xhI2wzPoVGba5+Y1gBfQ3fW0AUC241vVri38Y6F85LM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ho12pAmXc/azoOa8WDzAbnytl2LcZVngAHQE/VcKg1ILDXy502S6Gan8/Uml4Na1l
	 OTEuXzhZeY4XrHS0D8x2+UtuomSAyYei5SEhWX7ghMv5c5Ni8Bp0n5LLjdd0UwWKkC
	 peMKHQq9wgERt7msQjBE9qjZa/LhhoMyCSX+Q6dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27A85F803CE;
	Thu,  1 Oct 2020 04:12:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13218F80345; Thu,  1 Oct 2020 04:12:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0900F802E9
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0900F802E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="tYZA3t1S"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="eoISlPhD"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E88B75803A7;
 Wed, 30 Sep 2020 22:12:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=NHewFzRu2vXyA
 rCi8ixciz6kRCOAqCT1XEIhbh7PdCU=; b=tYZA3t1Sde8gEp3CrBwSVT9aDOrYD
 UrGqOTfSqjt3BrqTomxzBtwavpIiCjrG7skdi1MWa5ALe0GS/ePg6Pp8nwRKGJtp
 dyUE1U3bE9wcpzbUv7u06yU0fG3QN0Zljui9MFMB0wPOsfbjrl18eRHwSZ5XyyD2
 cMJGshS5r9IKVm0QiOP+Mjba3iulArTzPA4uJ9RZRc8pewTo9CuWsmiSP1HmmEVx
 u9agADMVUcU/fxWMHHquNpMkr5xDvm4H5dmHF/nKHul0dEwjdqzkfJPqfPc19kFW
 B8f4vOxrvYnu2MoALXmY39pW29WwL5TRjSmw7wUaeMRLViZJMjcWE9Ibw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=NHewFzRu2vXyArCi8ixciz6kRCOAqCT1XEIhbh7PdCU=; b=eoISlPhD
 22MoUrDjt4OapBuHT+Kmuq9zojOvppx2s4AvPQcK45mN6y4IzzQKV7pAPIji0hKg
 hP2KSAciZGf+bXqQ+Sv+p8aJ4NIyov9jB2BsQ1nEidaFgZ1xYYOVX4l0Fygb6Hcv
 OjnAuUYbgKbIsqyPOhC/jtrq6fnIEZVHAwKT6fAiFil5LH8CvUVvWk+zv/+/iD13
 aHIJ7A9WHvbXD6Yjcp9K1k7RjlG2sBbt5gIreQOL+CvgxTMNEq2Lp5glzDuAy8wW
 wzESrCLqGdLCzpZPt/KFf/VAXHqMEvy0Ku8hsI55DCHFUaNt4VJ7hHlyVyqNbXlU
 4wsXH3dSiuxf+g==
X-ME-Sender: <xms:8Dp1X18PuIRIiK4McFFezHIAugtjt5Go_Lo_ks4QmkgqpBwI7gaOWA>
 <xme:8Dp1X5sBuLUXayNmKyc8oT7tlKPmZx2oZf2Wn2Tbsb-veipNoSfMlM2L847J2zDw-
 PQmg5d39MDQgp3nwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedujeenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:8Dp1XzBJDo3iCpM8mZYfmulm6IMAeFg8KF4OQXuk2H1m7Mni9GS-VA>
 <xmx:8Dp1X5e1-UGIBAOLjxiCDk2n_pBBdsm_gZBK6wjN5LqRCCtw_2pcNg>
 <xmx:8Dp1X6O_7wUFLc6grhb98AeK34ftvrRi0TUsk4tSMh8JqqhzbIgU5w>
 <xmx:8Dp1X7jdoU6H7Ej8YAPjRrDJwyVuss0Ez83oZSjSb2K8KqE2CCNUGQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2710C306467E;
 Wed, 30 Sep 2020 22:12:00 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 23/25] ASoC: sun8i-codec: Generalize AIF clock control
Date: Wed, 30 Sep 2020 21:11:46 -0500
Message-Id: <20201001021148.15852-24-samuel@sholland.org>
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

The AIF clock control register has the same layout for all three AIFs.
The only difference between them is that AIF3 is missing some fields. We
can reuse the same register field definitions for all three registers,
and use the DAI ID to select the correct register address.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 64 +++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 032a3f714dbb..1c34502ac47a 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -37,23 +37,23 @@
 #define SUN8I_MOD_CLK_ENA_DAC				2
 #define SUN8I_MOD_RST_CTL				0x014
 #define SUN8I_MOD_RST_CTL_AIF1				15
 #define SUN8I_MOD_RST_CTL_ADC				3
 #define SUN8I_MOD_RST_CTL_DAC				2
 #define SUN8I_SYS_SR_CTRL				0x018
 #define SUN8I_SYS_SR_CTRL_AIF1_FS			12
 #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
-#define SUN8I_AIF1CLK_CTRL				0x040
-#define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD		15
-#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV			13
-#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
-#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
-#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
-#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
+#define SUN8I_AIF_CLK_CTRL(n)				(0x040 * (1 + (n)))
+#define SUN8I_AIF_CLK_CTRL_MSTR_MOD			15
+#define SUN8I_AIF_CLK_CTRL_CLK_INV			13
+#define SUN8I_AIF_CLK_CTRL_BCLK_DIV			9
+#define SUN8I_AIF_CLK_CTRL_LRCK_DIV			6
+#define SUN8I_AIF_CLK_CTRL_WORD_SIZ			4
+#define SUN8I_AIF_CLK_CTRL_DATA_FMT			2
 #define SUN8I_AIF1_ADCDAT_CTRL				0x044
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_SRC		10
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_SRC		8
 #define SUN8I_AIF1_DACDAT_CTRL				0x048
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA		15
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA		14
@@ -83,21 +83,21 @@
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA1R		10
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR		9
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR		8
 
 #define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK	GENMASK(9, 8)
 #define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK	GENMASK(5, 4)
 #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
 #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
-#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
-#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
-#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
-#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
-#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
+#define SUN8I_AIF_CLK_CTRL_CLK_INV_MASK		GENMASK(14, 13)
+#define SUN8I_AIF_CLK_CTRL_BCLK_DIV_MASK	GENMASK(12, 9)
+#define SUN8I_AIF_CLK_CTRL_LRCK_DIV_MASK	GENMASK(8, 6)
+#define SUN8I_AIF_CLK_CTRL_WORD_SIZ_MASK	GENMASK(5, 4)
+#define SUN8I_AIF_CLK_CTRL_DATA_FMT_MASK	GENMASK(3, 2)
 
 #define SUN8I_CODEC_PASSTHROUGH_SAMPLE_RATE 48000
 
 #define SUN8I_CODEC_PCM_FORMATS	(SNDRV_PCM_FMTBIT_S8     |\
 				 SNDRV_PCM_FMTBIT_S16_LE |\
 				 SNDRV_PCM_FMTBIT_S20_LE |\
 				 SNDRV_PCM_FMTBIT_S24_LE |\
 				 SNDRV_PCM_FMTBIT_S20_3LE|\
@@ -223,32 +223,34 @@ static int sun8i_codec_update_sample_rate(struct sun8i_codec *scodec)
 			   hw_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
 
 	return 0;
 }
 
 static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
+	u32 reg = SUN8I_AIF_CLK_CTRL(dai->id);
 	u32 format, invert, value;
 
 	/* clock masters */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
 		value = 0x1;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
 		value = 0x0;
 		break;
 	default:
 		return -EINVAL;
 	}
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD),
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD);
+
+	regmap_update_bits(scodec->regmap, reg,
+			   BIT(SUN8I_AIF_CLK_CTRL_MSTR_MOD),
+			   value << SUN8I_AIF_CLK_CTRL_MSTR_MOD);
 
 	/* DAI format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		format = 0x0;
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
 		format = 0x1;
@@ -262,19 +264,20 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
 		format = 0x3;
 		invert = 0x1; /* Set LRCK_INV to 1 */
 		break;
 	default:
 		return -EINVAL;
 	}
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK,
-			   format << SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT);
+
+	regmap_update_bits(scodec->regmap, reg,
+			   SUN8I_AIF_CLK_CTRL_DATA_FMT_MASK,
+			   format << SUN8I_AIF_CLK_CTRL_DATA_FMT);
 
 	/* clock inversion */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF: /* Normal */
 		value = 0x0;
 		break;
 	case SND_SOC_DAIFMT_NB_IF: /* Inverted LRCK */
 		value = 0x1;
@@ -305,19 +308,19 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		 * Since the DAI here is our regular i2s driver that have been
 		 * tested with way more codecs than just this one, it means
 		 * that the codec probably gets it backward, and we have to
 		 * invert the value here.
 		 */
 		value ^= scodec->quirks->lrck_inversion;
 	}
 
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK,
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV);
+	regmap_update_bits(scodec->regmap, reg,
+			   SUN8I_AIF_CLK_CTRL_CLK_INV_MASK,
+			   value << SUN8I_AIF_CLK_CTRL_CLK_INV);
 
 	return 0;
 }
 
 static int sun8i_codec_set_tdm_slot(struct snd_soc_dai *dai,
 				    unsigned int tx_mask, unsigned int rx_mask,
 				    int slots, int slot_width)
 {
@@ -435,16 +438,17 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
 	unsigned int sample_rate = params_rate(params);
 	unsigned int slots = aif->slots ?: params_channels(params);
 	unsigned int slot_width = aif->slot_width ?: params_width(params);
 	unsigned int sysclk_rate = sun8i_codec_get_sysclk_rate(sample_rate);
 	int bclk_div, lrck_div_order, ret, word_size;
+	u32 reg = SUN8I_AIF_CLK_CTRL(dai->id);
 
 	/* word size */
 	switch (params_width(params)) {
 	case 8:
 		word_size = 0x0;
 		break;
 	case 16:
 		word_size = 0x1;
@@ -454,37 +458,37 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 		break;
 	case 24:
 		word_size = 0x3;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK,
-			   word_size << SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ);
+	regmap_update_bits(scodec->regmap, reg,
+			   SUN8I_AIF_CLK_CTRL_WORD_SIZ_MASK,
+			   word_size << SUN8I_AIF_CLK_CTRL_WORD_SIZ);
 
 	/* LRCK divider (BCLK/LRCK ratio) */
 	lrck_div_order = sun8i_codec_get_lrck_div_order(slots, slot_width);
 	if (lrck_div_order < 0)
 		return lrck_div_order;
 
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK,
-			   (lrck_div_order - 4) << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
+	regmap_update_bits(scodec->regmap, reg,
+			   SUN8I_AIF_CLK_CTRL_LRCK_DIV_MASK,
+			   (lrck_div_order - 4) << SUN8I_AIF_CLK_CTRL_LRCK_DIV);
 
 	/* BCLK divider (SYSCLK/BCLK ratio) */
 	bclk_div = sun8i_codec_get_bclk_div(sysclk_rate, lrck_div_order, sample_rate);
 	if (bclk_div < 0)
 		return bclk_div;
 
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
-			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
+	regmap_update_bits(scodec->regmap, reg,
+			   SUN8I_AIF_CLK_CTRL_BCLK_DIV_MASK,
+			   bclk_div << SUN8I_AIF_CLK_CTRL_BCLK_DIV);
 
 	/* SYSCLK rate */
 	if (aif->open_streams) {
 		ret = clk_set_rate(scodec->clk_module, sysclk_rate);
 		if (ret < 0)
 			return ret;
 	} else {
 		ret = clk_set_rate_exclusive(scodec->clk_module, sysclk_rate);
-- 
2.26.2

