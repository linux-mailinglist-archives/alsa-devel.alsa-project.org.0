Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0377C160B55
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:58:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37A616B9;
	Mon, 17 Feb 2020 07:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37A616B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922720;
	bh=S+hM7aN+ewTubgrqAoeevIGlh7xUzcnhhdAb3NZE/G4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tcQ2c93PKj812UbP4ABt9+tSbNq4/ZHcVCvEe3JxZrylSHXlxRAX0pvXmxH4IBBPO
	 TdSWhapDRbVUhzzFpKEphEcnuZWhKMQn8li6bBXD+IcjsYopo/Lz+E+e4Ixplmc3OV
	 tNYLmghqqQs+eKnbr/S6wycw0OYCnuNIHLTjC4ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B56B6F80369;
	Mon, 17 Feb 2020 07:44:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B990DF802FD; Mon, 17 Feb 2020 07:43:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB488F80214
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB488F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="cJWsfnoi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LyQtsjJ6"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 106B451E1;
 Mon, 17 Feb 2020 01:43:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=kKzb1Qj4ZHVK4
 pTJQ0r23qGMmMSqQTfk8t4pDT3gnm0=; b=cJWsfnoin1B+Wo5944BqdmNssv+vU
 DfB4yaL80OtxjshXQIj/pYnXlv4YhOFvmJQJX9qdTcUUZ2ci51bsKMGbo2e//seH
 C6YDFGG1Jw1KQZacmGyJaMP8ysrV6pa/ELT/KqTXE8v5dgQNv+RhM458T3lybPKT
 tplH+XNWjzJzVERzw4tvuv/q8TvHg1ogx4grGPIipXXRgBNw6IQ9uDJt7w6zUdmo
 V9n6Utcyw+doW9smfbk/O+pAF4LRqflAOkRem2biaJaRbPu2T6KR5BqlSoY67Srb
 T0z260YGHJhUFPWN0hl3Q8rVPJ+zrcm4UnGmlJYLbP0FuiUqFkimUytig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=kKzb1Qj4ZHVK4pTJQ0r23qGMmMSqQTfk8t4pDT3gnm0=; b=LyQtsjJ6
 GPG/D7mcDBh3Ys3IPzNYou16MFyR1pyBqSXcuPpEwXpDU6XyCgmZGJ5AtnSfFcOh
 ya94U0vDdc0+L+g3AFapP53yajvMoNK2R4LqiFliOPI5CnN60A3uYvKeKMpfKVXh
 SyZHItJ6LoUH93ajxgkCGleHC7SV49BH/mSZzpgHXy5JXBtvUFo6VS2AoEbL0FON
 Tmc6gtG8/6FMQEb6Lg7JIP2O3wCOOI8b5wrHopvwt5ykdWrawp6vVuXU0r78c5FK
 DHam2JAsuZrhpwvjAqC8Gbhif7SXNurvOa/xDuLxykzMz4E46OcI1GtkGGVNu9Ac
 wwaqOvkBskAj7A==
X-ME-Sender: <xms:-TVKXhYFFIUoUR6p5nPO6WeC4RoFjCg-0ESx11OYnWT8zddzJ6-X3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedujeenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:-TVKXtgEBPSDfW9_VC9WS51TzPAYRikojPuy6mSJrcWFXMiHjnyO2g>
 <xmx:-TVKXrMp4Zj1xAZsOhxA79XsmZsBjTQfpujg3iD5-WabrryzIxS20Q>
 <xmx:-TVKXnN0Bwx1tRl8pWQCUntU-svrXIM65gjs4RB7osrx0Rn5c2z5Zg>
 <xmx:-jVKXuoag7wiIV46PlbahA_2ZVnAOyA0wqzsT4EBHofIip6uhoDSGQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 507D9328005A;
 Mon, 17 Feb 2020 01:43:05 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:40 -0600
Message-Id: <20200217064250.15516-25-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 24/34] ASoC: sun8i-codec: Prepare to
	support multiple AIFs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The clock control registers for AIF1 and AIF2 have an identical layout
(other than the unused bit 0 for TDM mode). Rename the offsets/masks to
signify that they are shared between AIFs, and get the register address
from the AIF ID (this requires filling in the AIF ID). We also need to
rename the DAI and DAI streams, so they are still unique once AIF2 is
added. Finally, we convert the AIF driver struct to an array. Since this
already breaks `git blame`, we clean it up a bit by moving it and the
DAI ops up near the DAI driver implementation; this stops the ASoC DAPM
component driver splitting the DAI driver in half.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 159 +++++++++++++++++-----------------
 1 file changed, 80 insertions(+), 79 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 5dfaf656b5b1..aaea9aaa5632 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -38,16 +38,15 @@
 #define SUN8I_MOD_RST_CTL_ADC				3
 #define SUN8I_MOD_RST_CTL_DAC				2
 #define SUN8I_SYS_SR_CTRL				0x018
-#define SUN8I_SYS_SR_CTRL_AIF1_FS			12
-#define SUN8I_SYS_SR_CTRL_AIF2_FS			8
-#define SUN8I_AIF1CLK_CTRL				0x040
-#define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD		15
-#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV			13
-#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
-#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
-#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
-#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
-#define SUN8I_AIF1CLK_CTRL_AIF1_MONO_PCM		1
+#define SUN8I_SYS_SR_CTRL_AIF_FS(n)			(16 - 4 * (n))
+#define SUN8I_AIF_CLK_CTRL(n)				(0x040 * (n))
+#define SUN8I_AIF_CLK_CTRL_MSTR_MOD			15
+#define SUN8I_AIF_CLK_CTRL_CLK_INV			13
+#define SUN8I_AIF_CLK_CTRL_BCLK_DIV			9
+#define SUN8I_AIF_CLK_CTRL_LRCK_DIV			6
+#define SUN8I_AIF_CLK_CTRL_WORD_SIZ			4
+#define SUN8I_AIF_CLK_CTRL_DATA_FMT			2
+#define SUN8I_AIF_CLK_CTRL_MONO_PCM			1
 #define SUN8I_AIF1_ADCDAT_CTRL				0x044
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
@@ -80,13 +79,12 @@
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR		8
 
 #define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK	GENMASK(9, 8)
-#define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
-#define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
-#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
-#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
-#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
-#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
-#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
+#define SUN8I_SYS_SR_CTRL_AIF_FS_MASK(n)	(GENMASK(19, 16) >> (4 * (n)))
+#define SUN8I_AIF_CLK_CTRL_CLK_INV_MASK		GENMASK(14, 13)
+#define SUN8I_AIF_CLK_CTRL_BCLK_DIV_MASK	GENMASK(12, 9)
+#define SUN8I_AIF_CLK_CTRL_LRCK_DIV_MASK	GENMASK(8, 6)
+#define SUN8I_AIF_CLK_CTRL_WORD_SIZ_MASK	GENMASK(5, 4)
+#define SUN8I_AIF_CLK_CTRL_DATA_FMT_MASK	GENMASK(3, 2)
 
 #define SUN8I_AIF_PCM_FMTS  (SNDRV_PCM_FMTBIT_S8|\
 			     SNDRV_PCM_FMTBIT_S16_LE|\
@@ -189,6 +187,7 @@ static int sun8i_codec_get_hw_rate(struct snd_pcm_hw_params *params)
 static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct sun8i_codec *scodec = snd_soc_component_get_drvdata(dai->component);
+	unsigned int reg = SUN8I_AIF_CLK_CTRL(dai->id);
 	u32 value;
 
 	/* clock masters */
@@ -202,9 +201,9 @@ static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	default:
 		return -EINVAL;
 	}
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD),
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD);
+	regmap_update_bits(scodec->regmap, reg,
+			   BIT(SUN8I_AIF_CLK_CTRL_MSTR_MOD),
+			   value << SUN8I_AIF_CLK_CTRL_MSTR_MOD);
 
 	/* clock inversion */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -234,9 +233,9 @@ static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	 * invert the value here.
 	 */
 	value ^= scodec->inverted_lrck;
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK,
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV);
+	regmap_update_bits(scodec->regmap, reg,
+			   SUN8I_AIF_CLK_CTRL_CLK_INV_MASK,
+			   value << SUN8I_AIF_CLK_CTRL_CLK_INV);
 
 	/* DAI format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -255,9 +254,9 @@ static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	default:
 		return -EINVAL;
 	}
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK,
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT);
+	regmap_update_bits(scodec->regmap, reg,
+			   SUN8I_AIF_CLK_CTRL_DATA_FMT_MASK,
+			   value << SUN8I_AIF_CLK_CTRL_DATA_FMT);
 
 	return 0;
 }
@@ -327,23 +326,24 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 	struct sun8i_codec *scodec = snd_soc_component_get_drvdata(dai->component);
 	unsigned int slot_width = params_physical_width(params);
 	unsigned int channels = params_channels(params);
+	unsigned int reg = SUN8I_AIF_CLK_CTRL(dai->id);
 	int sample_rate, lrck_div;
 	u8 bclk_div;
 	u32 value;
 
 	bclk_div = sun8i_codec_get_bclk_div(scodec, params_rate(params),
 					    channels, slot_width);
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
-			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
+	regmap_update_bits(scodec->regmap, reg,
+			   SUN8I_AIF_CLK_CTRL_BCLK_DIV_MASK,
+			   bclk_div << SUN8I_AIF_CLK_CTRL_BCLK_DIV);
 
 	lrck_div = sun8i_codec_get_lrck_div(channels, slot_width);
 	if (lrck_div < 0)
 		return lrck_div;
 
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK,
-			   lrck_div << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
+	regmap_update_bits(scodec->regmap, reg,
+			   SUN8I_AIF_CLK_CTRL_LRCK_DIV_MASK,
+			   lrck_div << SUN8I_AIF_CLK_CTRL_LRCK_DIV);
 
 	switch (params_width(params)) {
 	case 8:
@@ -361,29 +361,60 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 	default:
 		return -EINVAL;
 	}
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK,
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ);
+	regmap_update_bits(scodec->regmap, reg,
+			   SUN8I_AIF_CLK_CTRL_WORD_SIZ_MASK,
+			   value << SUN8I_AIF_CLK_CTRL_WORD_SIZ);
 
 	value = channels == 1;
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_MONO_PCM),
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_MONO_PCM);
+	regmap_update_bits(scodec->regmap, reg,
+			   BIT(SUN8I_AIF_CLK_CTRL_MONO_PCM),
+			   value << SUN8I_AIF_CLK_CTRL_MONO_PCM);
 
 	sample_rate = sun8i_codec_get_hw_rate(params);
 	if (sample_rate < 0)
 		return sample_rate;
 
 	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
-			   SUN8I_SYS_SR_CTRL_AIF1_FS_MASK,
-			   sample_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
-	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
-			   SUN8I_SYS_SR_CTRL_AIF2_FS_MASK,
-			   sample_rate << SUN8I_SYS_SR_CTRL_AIF2_FS);
+			   SUN8I_SYS_SR_CTRL_AIF_FS_MASK(dai->id),
+			   sample_rate << SUN8I_SYS_SR_CTRL_AIF_FS(dai->id));
 
 	return 0;
 }
 
+static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
+	.hw_params = sun8i_codec_hw_params,
+	.set_fmt = sun8i_set_fmt,
+};
+
+static struct snd_soc_dai_driver sun8i_codec_dais[] = {
+	{
+		.name = "sun8i-codec-aif1",
+		.id = 1,
+		/* playback capabilities */
+		.playback = {
+			.stream_name = "AIF1 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SUN8I_AIF_PCM_RATES,
+			.formats = SUN8I_AIF_PCM_FMTS,
+		},
+		/* capture capabilities */
+		.capture = {
+			.stream_name = "AIF1 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SUN8I_AIF_PCM_RATES,
+			.formats = SUN8I_AIF_PCM_FMTS,
+			.sig_bits = 24,
+		},
+		/* pcm operations */
+		.ops = &sun8i_codec_dai_ops,
+		.symmetric_rates = 1,
+		.symmetric_channels = 1,
+		.symmetric_samplebits = 1,
+	},
+};
+
 static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("AIF1 AD0 Mixer AIF1 DA0 Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
@@ -424,10 +455,10 @@ static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
 
 static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	/* AIF "ADC" Outputs */
-	SND_SOC_DAPM_AIF_OUT("AIF1 AD0 Left", "Capture", 0,
+	SND_SOC_DAPM_AIF_OUT("AIF1 AD0 Left", "AIF1 Capture", 0,
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0),
-	SND_SOC_DAPM_AIF_OUT("AIF1 AD0 Right", "Capture", 1,
+	SND_SOC_DAPM_AIF_OUT("AIF1 AD0 Right", "AIF1 Capture", 1,
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
 
@@ -438,10 +469,10 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 			sun8i_aif1_ad0_mixer_controls),
 
 	/* AIF "DAC" Inputs */
-	SND_SOC_DAPM_AIF_IN("AIF1 DA0 Left", "Playback", 0,
+	SND_SOC_DAPM_AIF_IN("AIF1 DA0 Left", "AIF1 Playback", 0,
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA, 0),
-	SND_SOC_DAPM_AIF_IN("AIF1 DA0 Right", "Playback", 1,
+	SND_SOC_DAPM_AIF_IN("AIF1 DA0 Right", "AIF1 Playback", 1,
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA, 0),
 
@@ -565,37 +596,6 @@ static int sun8i_codec_component_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
-	.hw_params = sun8i_codec_hw_params,
-	.set_fmt = sun8i_set_fmt,
-};
-
-static struct snd_soc_dai_driver sun8i_codec_dai = {
-	.name = "sun8i",
-	/* playback capabilities */
-	.playback = {
-		.stream_name = "Playback",
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SUN8I_AIF_PCM_RATES,
-		.formats = SUN8I_AIF_PCM_FMTS,
-	},
-	/* capture capabilities */
-	.capture = {
-		.stream_name = "Capture",
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SUN8I_AIF_PCM_RATES,
-		.formats = SUN8I_AIF_PCM_FMTS,
-		.sig_bits = 24,
-	},
-	/* pcm operations */
-	.ops = &sun8i_codec_dai_ops,
-	.symmetric_rates = 1,
-	.symmetric_channels = 1,
-	.symmetric_samplebits = 1,
-};
-
 static const struct snd_soc_component_driver sun8i_soc_component = {
 	.dapm_widgets		= sun8i_codec_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(sun8i_codec_dapm_widgets),
@@ -664,7 +664,8 @@ static int sun8i_codec_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &sun8i_soc_component,
-				     &sun8i_codec_dai, 1);
+					      sun8i_codec_dais,
+					      ARRAY_SIZE(sun8i_codec_dais));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register codec\n");
 		goto err_suspend;
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
