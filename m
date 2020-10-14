Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4483528D9EC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 08:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F231616E0;
	Wed, 14 Oct 2020 08:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F231616E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602656504;
	bh=g+FCSV9PDBXDHxjmlaGECx838Pg/Tc7pDiMhgEFd5ZE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hxqNiqHKL21MydIoP5Y5Zxe5XcnBjOnuGbfxUOljnYu3vg4EpsErjOc6dM0mGg5e2
	 +IX9qxpJqtrDUQMlccmDfALar4NBjBberBK/z1CtXbcbpp9VqDxgGkvX5plv2927vn
	 QPLxFbocA4a43QsK8UUsbu7TvbRSQi5hrrowISrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDB38F8028E;
	Wed, 14 Oct 2020 08:20:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 978E3F8027B; Wed, 14 Oct 2020 08:19:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22573F8021D
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 08:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22573F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="uTcREwQ1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ExsJ6Aad"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 759B7D19;
 Wed, 14 Oct 2020 02:19:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 14 Oct 2020 02:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=bekevu5HrHqzd
 7nqCJl6l3KrT5AyZJ9uXYuN8MTSekY=; b=uTcREwQ1lCEkq1u/iJ98ieZ13dpFT
 PAHjxII1i9SzFwIPfmcLyfMmjVbNn2AnSIc3ye7XAQnX8lBtOdwucPusHpzLy78Y
 irfmMsDMWMlou+XC+Pvf0ntm1TiKFkP3oc7jTy7UAO+nPBrBTtkcfQApYkvtzGwu
 oGbOtJgZA9EtRSs5jh3vi8nvJW9bH5nj+Snv7qHI+DR0lfpOXgSbBIoXRO3tmutq
 MRmaVRTS+8nDJcsU/yuY+7B4wvTVbLJgGFX6Z2ZQVs+55zTS9oEQgSDT9bB2Rns9
 GPq2aWY7g4jlZnaSupEB1mOxf9SMfq6tUiSce2dFnb/zzh6Q0gO0L7Bnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=bekevu5HrHqzd7nqCJl6l3KrT5AyZJ9uXYuN8MTSekY=; b=ExsJ6Aad
 +49P6xoDePLHSQRQiZ7yYpqRb/vf9pZ4pa3n3DAghx1yMqaoJzLZ30qxBU2XLjIG
 NjqK0cRTKK2ijBaJEAESkIKbKllGRbd6Yds01bvqtag+ULLDF40/bc1S32f4JTil
 YVadKH4yYOlOusY9ay/gfg6GkmijxeUAK3WdSsnWdbLzqQRO0I+fkF6uLm2z0iMF
 +gS6q4mR0j8V+MCZ8ojG1B4U5O8b2xfJL/I2+c7N5aVaW2f1wRrQOFFbqxeovWuj
 WdxIJ6kqr0QsEQs8IfSmuF+FeUhUyEj6gmDikZNaT75Nh9xCXipDVpYQxNFdX2n+
 XotnoMhynZP1ew==
X-ME-Sender: <xms:f5iGXzxtFZPtCfZPzOI-2SihXauFC0Wwo3Uv1QGZOSrl-efmiHg3oA>
 <xme:f5iGX7SGieM3fi23ZLiF-AQIts6qVjwvUd6YSdLgQL1uePpB98D1BlHdZuasNPexe
 F-E7391uUoCu6DLNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedtgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:f5iGX9Vq5K2qupEgbXsJ4Riib0lfz6OkIIpjlqyI40-JZyeuTN4ntg>
 <xmx:f5iGX9hGfLmvQZ1JrkfBeSPL_ntf3kVy3Iva9EJPASF-caCWNPGEow>
 <xmx:f5iGX1D-83wcHXsH8Fl_ELTJT1VbP4Pli2VJAHwjxzc8WOxjmjaHSg>
 <xmx:gJiGX52yB3BCzRdWhyacLbXWtsF5U-YkOPom8cKMp1BuuUlrz7TeDQt2z6Q>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 464F83280065;
 Wed, 14 Oct 2020 02:19:43 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 03/17] ASoC: sun8i-codec: Enable all supported clock
 inversions
Date: Wed, 14 Oct 2020 01:19:27 -0500
Message-Id: <20201014061941.4306-4-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014061941.4306-1-samuel@sholland.org>
References: <20201014061941.4306-1-samuel@sholland.org>
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

When using the I2S, LEFT_J, or RIGHT_J format, the hardware supports
independent BCLK and LRCK inversion control. When using DSP_A or DSP_B,
LRCK inversion is not supported. The register bit is repurposed to
select between DSP_A and DSP_B. Extend the driver to support this.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 61 ++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 53c9289a4249..77eb0fd01e3d 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -39,18 +39,17 @@
 #define SUN8I_MOD_RST_CTL_AIF1				15
 #define SUN8I_MOD_RST_CTL_ADC				3
 #define SUN8I_MOD_RST_CTL_DAC				2
 #define SUN8I_SYS_SR_CTRL				0x018
 #define SUN8I_SYS_SR_CTRL_AIF1_FS			12
 #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
 #define SUN8I_AIF1CLK_CTRL				0x040
 #define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD		15
-#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV		14
-#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV		13
+#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV			13
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16		(1 << 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
 #define SUN8I_AIF1_ADCDAT_CTRL				0x044
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
@@ -85,16 +84,17 @@
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA1R		10
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR		9
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR		8
 
 #define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK	GENMASK(9, 8)
 #define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK	GENMASK(5, 4)
 #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
 #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
+#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
 
 enum {
 	SUN8I_CODEC_AIF1,
 	SUN8I_CODEC_NAIFS
@@ -168,17 +168,17 @@ static int sun8i_codec_get_hw_rate(struct snd_pcm_hw_params *params)
 	default:
 		return -EINVAL;
 	}
 }
 
 static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
-	u32 format, value;
+	u32 dsp_format, format, invert, value;
 
 	/* clock masters */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
 		value = 0x1;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
 		value = 0x0;
@@ -197,55 +197,72 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
 		format = 0x1;
 		break;
 	case SND_SOC_DAIFMT_RIGHT_J:
 		format = 0x2;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
+		format = 0x3;
+		dsp_format = 0x0; /* Set LRCK_INV to 0 */
+		break;
 	case SND_SOC_DAIFMT_DSP_B:
 		format = 0x3;
+		dsp_format = 0x1; /* Set LRCK_INV to 1 */
 		break;
 	default:
 		return -EINVAL;
 	}
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK,
 			   format << SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT);
 
 	/* clock inversion */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF: /* Normal */
-		value = 0x0;
+		invert = 0x0;
 		break;
-	case SND_SOC_DAIFMT_IB_IF: /* Inversion */
-		value = 0x1;
+	case SND_SOC_DAIFMT_NB_IF: /* Inverted LRCK */
+		invert = 0x1;
+		break;
+	case SND_SOC_DAIFMT_IB_NF: /* Inverted BCLK */
+		invert = 0x2;
+		break;
+	case SND_SOC_DAIFMT_IB_IF: /* Both inverted */
+		invert = 0x3;
 		break;
 	default:
 		return -EINVAL;
 	}
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV),
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV);
 
-	/*
-	 * It appears that the DAI and the codec in the A33 SoC don't
-	 * share the same polarity for the LRCK signal when they mean
-	 * 'normal' and 'inverted' in the datasheet.
-	 *
-	 * Since the DAI here is our regular i2s driver that have been
-	 * tested with way more codecs than just this one, it means
-	 * that the codec probably gets it backward, and we have to
-	 * invert the value here.
-	 */
-	value ^= scodec->quirks->lrck_inversion;
+	if (format == 0x3) {
+		/* Inverted LRCK is not available in DSP mode. */
+		if (invert & BIT(0))
+			return -EINVAL;
+
+		/* Instead, the bit selects between DSP A/B formats. */
+		invert |= dsp_format;
+	} else {
+		/*
+		 * It appears that the DAI and the codec in the A33 SoC don't
+		 * share the same polarity for the LRCK signal when they mean
+		 * 'normal' and 'inverted' in the datasheet.
+		 *
+		 * Since the DAI here is our regular i2s driver that have been
+		 * tested with way more codecs than just this one, it means
+		 * that the codec probably gets it backward, and we have to
+		 * invert the value here.
+		 */
+		invert ^= scodec->quirks->lrck_inversion;
+	}
+
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV),
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV);
+			   SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK,
+			   invert << SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV);
 
 	return 0;
 }
 
 struct sun8i_codec_clk_div {
 	u8	div;
 	u8	val;
 };
-- 
2.26.2

