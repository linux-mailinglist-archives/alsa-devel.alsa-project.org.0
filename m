Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 066BA27F7E0
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:16:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B7B01802;
	Thu,  1 Oct 2020 04:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B7B01802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518566;
	bh=GKBJmlDiS0Ngdua93WR4boaRbXBnzNGccEKPAlRyFzs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XOQ4CrD2NJ/MQzhaoqBzilE68YU4i86rcqfdRZKh4C1OyUtN3mY4I5EZMP5G3csRY
	 wszRCsSWMvBmFGlno1Ko/8/dvNkgG8+8Lpj8lxG3F3C45x5EK9nrE7ncVDvXxLgqq+
	 ug5N/6SZlDH+kvkTN0T6oK/+r4cZuc4lQd+EIbTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A456FF8022D;
	Thu,  1 Oct 2020 04:12:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AFFCF802C4; Thu,  1 Oct 2020 04:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B044F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B044F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="BsCfxqv1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bUaGFyi4"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 46D965800FB;
 Wed, 30 Sep 2020 22:11:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=4PICsGvEvUAR6
 FFcx/Jho86Q5KKGhGCszum1HvJUE9g=; b=BsCfxqv1a8Olnimoj0s0GMS/FIegI
 iaJvkQcjoY62YEbSKSxEDJGgCUFes9v6iHEEYNUfvkUvaXy5r0WCFa7iI/FFSXFH
 wO2YsEqME9WW9krpcSSm2+x20wJ3EGKgEyEyeIpmd/6uRiZKj92xQQe6z3maXWu/
 UQou/AYRppYs034BL29ukHOQKeZFsmKMqH3dXlPWHVf9FN4yVF00+C1CK69WdgLb
 TScBQqnzMLZwtdMPj0UCSNAAVCICiXucuzDG8K0W+amkKPwTOtMxVbAJICUhX9he
 6gK0HKYKFdKpfq0amw6Rg6stnXodpJ1mwsxC440ejvSZEJNRwUrri2P3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=4PICsGvEvUAR6FFcx/Jho86Q5KKGhGCszum1HvJUE9g=; b=bUaGFyi4
 YlOdNFssNaYGZlLxPkUclCgHnfVvq2jRZXGeeEXN45ZkROdxCCVxd66Y5PuX9nQi
 5aDqKe9F/Llwi/ButPj6i6clip8SLaHCpoWPzaVvJxu5C8x0WVutk9tAiyIiftk6
 fRt5zOmIMA/F6qrVhrCkcctRe9KOwDWUCSTPKPESE5Zz0vW3SpVppSF2lnxBrRK3
 8qlilxth17XrwCBaan/sELCIUNPAqmVfNBN2ybptcejUuAgsniUHgp3Z4EYUclEi
 GMRWduWAOrxtU+IcWpaZ8vWhhg3Smo0SArNDKtb+zskRpBR+4HcdyHXPVd7+Qnae
 LFMiiezPGSewTQ==
X-ME-Sender: <xms:5jp1X4hRwG4Re96f5B_1696cyWmeKBzqIi_ZG1dilMSKHzDf1cYnIQ>
 <xme:5jp1XxADeVKjBH0xLNaROziUcN-9xZd_Ve_fmvBMilfbRwskrZlz-R6_iKSfzTy3U
 6zpbfKEEimQ1XQKyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:5jp1XwEGZ4DyWHhhfOaQQjF-CZ-HOKNa8LqCCheW_gWAmWkgWxl5Wg>
 <xmx:5jp1X5TgEecOafXXdzsww-tFC3pJKaMyEltMwpY5Y-p8zKx0DJDeZg>
 <xmx:5jp1X1xbFQ-9slCqmom3Om6u1x0iAAGtNEmvCrDoKsntJkBxSn5ysA>
 <xmx:6Dp1X8lwV7g0Zhv2W4fh4Dl-UDptGl8k3Y6-Ca53Yvafhzjcs0_fkg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id C71BB3064682;
 Wed, 30 Sep 2020 22:11:49 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 01/25] ASoC: sun8i-codec: Set up clock tree at probe time
Date: Wed, 30 Sep 2020 21:11:24 -0500
Message-Id: <20201001021148.15852-2-samuel@sholland.org>
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

The sun8i codec is effectively an on-die variant of the X-Powers AC100
codec. The AC100 can derive its clocks from either of two I2S master
clocks or an internal PLL. For the on-die variant, Allwinner replaced
the codec's own PLL with a connection to SoC's existing PLL_AUDIO, and
they connected both I2S MCLK inputs to the same source -- which happens
to be an integer divider from the same PLL_AUDIO.

So there's actually no clocking flexibility. To run SYSCLK at the
required rate, it must be run straight from the PLL. The only choice is
whether it goes through AIF1CLK or AIF2CLK. Since both run at the same
rate, the only effect of that choice is which field in SYS_SR_CTRL
(AIF1_FS or AIF2_FS) controls the system sample rate.

Since AIFnCLK is required to bring up the corresponding DAI, and AIF1
(connected to the CPU) is used most often, let's use AIF1CLK as the
SYSCLK parent. That means we no longer need to set AIF2_FS.

Since this clock tree never changes, we can program it from the
component probe function, instead of using DAPM widgets. The DAPM
widgets unnecessarily change clock parents when the codec goes in/out
of idle and the supply widgets are powered up/down.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 54 +++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 178f6fb31fd4..407f0fedc4ed 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -19,20 +19,23 @@
 #include <linux/log2.h>
 
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 
 #define SUN8I_SYSCLK_CTL				0x00c
 #define SUN8I_SYSCLK_CTL_AIF1CLK_ENA			11
-#define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_PLL		9
-#define SUN8I_SYSCLK_CTL_AIF1CLK_SRC			8
+#define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_PLL		(0x2 << 8)
+#define SUN8I_SYSCLK_CTL_AIF2CLK_ENA			7
+#define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_PLL		(0x2 << 4)
 #define SUN8I_SYSCLK_CTL_SYSCLK_ENA			3
 #define SUN8I_SYSCLK_CTL_SYSCLK_SRC			0
+#define SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF1CLK		(0x0 << 0)
+#define SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF2CLK		(0x1 << 0)
 #define SUN8I_MOD_CLK_ENA				0x010
 #define SUN8I_MOD_CLK_ENA_AIF1				15
 #define SUN8I_MOD_CLK_ENA_ADC				3
 #define SUN8I_MOD_CLK_ENA_DAC				2
 #define SUN8I_MOD_RST_CTL				0x014
 #define SUN8I_MOD_RST_CTL_AIF1				15
 #define SUN8I_MOD_RST_CTL_ADC				3
 #define SUN8I_MOD_RST_CTL_DAC				2
@@ -74,16 +77,18 @@
 #define SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA1L		14
 #define SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF2DACL		13
 #define SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_ADCL		12
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA0R		11
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA1R		10
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR		9
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR		8
 
+#define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK	GENMASK(9, 8)
+#define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK	GENMASK(5, 4)
 #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
 #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
 
 struct sun8i_codec_quirks {
@@ -318,19 +323,16 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 
 	sample_rate = sun8i_codec_get_hw_rate(params);
 	if (sample_rate < 0)
 		return sample_rate;
 
 	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
 			   SUN8I_SYS_SR_CTRL_AIF1_FS_MASK,
 			   sample_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
-	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
-			   SUN8I_SYS_SR_CTRL_AIF2_FS_MASK,
-			   sample_rate << SUN8I_SYS_SR_CTRL_AIF2_FS);
 
 	return 0;
 }
 
 static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital DAC Playback Switch",
 			SUN8I_DAC_MXR_SRC,
 			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA0L,
@@ -361,18 +363,26 @@ static const struct snd_kcontrol_new sun8i_input_mixer_controls[] = {
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR, 1, 0),
 	SOC_DAPM_DOUBLE("AIF2 Inv Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACR,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL, 1, 0),
 };
 
 static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
+	/* System Clocks */
 	SND_SOC_DAPM_CLOCK_SUPPLY("mod"),
 
+	SND_SOC_DAPM_SUPPLY("AIF1CLK",
+			    SUN8I_SYSCLK_CTL,
+			    SUN8I_SYSCLK_CTL_AIF1CLK_ENA, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("SYSCLK",
+			    SUN8I_SYSCLK_CTL,
+			    SUN8I_SYSCLK_CTL_SYSCLK_ENA, 0, NULL, 0),
+
 	/* Digital parts of the DACs and ADC */
 	SND_SOC_DAPM_SUPPLY("DAC", SUN8I_DAC_DIG_CTRL, SUN8I_DAC_DIG_CTRL_ENDA,
 			    0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("ADC", SUN8I_ADC_DIG_CTRL, SUN8I_ADC_DIG_CTRL_ENAD,
 			    0, NULL, 0),
 
 	/* AIF "DAC" Inputs */
 	SND_SOC_DAPM_AIF_IN("AIF1 DA0L", "Playback", 0,
@@ -410,44 +420,33 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 
 	/* Clocks */
 	SND_SOC_DAPM_SUPPLY("MODCLK AIF1", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_AIF1, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MODCLK DAC", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_DAC, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MODCLK ADC", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_ADC, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("AIF1", SUN8I_SYSCLK_CTL,
-			    SUN8I_SYSCLK_CTL_AIF1CLK_ENA, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("SYSCLK", SUN8I_SYSCLK_CTL,
-			    SUN8I_SYSCLK_CTL_SYSCLK_ENA, 0, NULL, 0),
-
-	SND_SOC_DAPM_SUPPLY("AIF1 PLL", SUN8I_SYSCLK_CTL,
-			    SUN8I_SYSCLK_CTL_AIF1CLK_SRC_PLL, 0, NULL, 0),
-	/* Inversion as 0=AIF1, 1=AIF2 */
-	SND_SOC_DAPM_SUPPLY("SYSCLK AIF1", SUN8I_SYSCLK_CTL,
-			    SUN8I_SYSCLK_CTL_SYSCLK_SRC, 1, NULL, 0),
 
 	/* Module reset */
 	SND_SOC_DAPM_SUPPLY("RST AIF1", SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_AIF1, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST DAC", SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_DAC, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST ADC", SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_ADC, 0, NULL, 0),
 };
 
 static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	/* Clock Routes */
-	{ "AIF1", NULL, "mod" },
+	{ "AIF1CLK", NULL, "mod" },
 
-	{ "AIF1", NULL, "SYSCLK AIF1" },
-	{ "AIF1 PLL", NULL, "AIF1" },
-	{ "SYSCLK", NULL, "AIF1 PLL" },
+	{ "SYSCLK", NULL, "AIF1CLK" },
 
+	{ "RST AIF1", NULL, "AIF1CLK" },
 	{ "RST AIF1", NULL, "SYSCLK" },
 	{ "MODCLK AIF1", NULL, "RST AIF1" },
 	{ "AIF1 AD0L", NULL, "MODCLK AIF1" },
 	{ "AIF1 AD0R", NULL, "MODCLK AIF1" },
 	{ "AIF1 DA0L", NULL, "MODCLK AIF1" },
 	{ "AIF1 DA0R", NULL, "MODCLK AIF1" },
 
 	{ "RST DAC", NULL, "SYSCLK" },
@@ -519,16 +518,33 @@ static int sun8i_codec_component_probe(struct snd_soc_component *component)
 			return ret;
 
 		ret = snd_soc_dapm_add_routes(dapm, sun8i_codec_legacy_routes,
 					      ARRAY_SIZE(sun8i_codec_legacy_routes));
 		if (ret)
 			return ret;
 	}
 
+	/*
+	 * AIF1CLK and AIF2CLK share a pair of clock parents: PLL_AUDIO ("mod")
+	 * and MCLK (from the CPU DAI connected to AIF1). MCLK's parent is also
+	 * PLL_AUDIO, so using it adds no additional flexibility. Use PLL_AUDIO
+	 * directly to simplify the clock tree.
+	 */
+	regmap_update_bits(scodec->regmap, SUN8I_SYSCLK_CTL,
+			   SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK |
+			   SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK,
+			   SUN8I_SYSCLK_CTL_AIF1CLK_SRC_PLL |
+			   SUN8I_SYSCLK_CTL_AIF2CLK_SRC_PLL);
+
+	/* Use AIF1CLK as the SYSCLK parent since AIF1 is used most often. */
+	regmap_update_bits(scodec->regmap, SUN8I_SYSCLK_CTL,
+			   BIT(SUN8I_SYSCLK_CTL_SYSCLK_SRC),
+			   SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF1CLK);
+
 	return 0;
 }
 
 static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
 	.hw_params = sun8i_codec_hw_params,
 	.set_fmt = sun8i_set_fmt,
 };
 
-- 
2.26.2

