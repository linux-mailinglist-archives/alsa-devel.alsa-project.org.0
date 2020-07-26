Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F2C22DB24
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 03:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DFDA169A;
	Sun, 26 Jul 2020 03:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DFDA169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595726922;
	bh=KIcipTCrM7o4efALFJGvKjdg9nv7KJJi/3J3UzcCOxw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lnptY6rCIB9qdZcIi5JTl9xM16E2cexUPqfOspGg19vQj9r7g6p6nbjp61GA9hXIZ
	 KKwtAJ13w5sEvTH65yGnkK1nsVm6qX8FIJnd8hpChZltXAa8gjDil+L1b5+f2gPGVl
	 GEsmv6o8zO5VuHEoeTj2tl9IEbjhXyQIqgJ/cxow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3B0CF80268;
	Sun, 26 Jul 2020 03:26:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41A50F8028C; Sun, 26 Jul 2020 03:26:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9918FF800C7
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 03:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9918FF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="thDQChMV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WKJ23IV2"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 720D1580146;
 Sat, 25 Jul 2020 21:26:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 21:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=bqBOklXJABlD5
 jjNvIrS/iMxzEoDg1wzDNL0XDIE7B4=; b=thDQChMVX+VHrNGESkAXYXTVRcFuY
 RuAJidRkp0lBxbkg5gE09nJjR7Aa2zGp9V8hxAZyX0xZYgMycpRNxSRdNg6xoFZT
 PzjAam7l/sX7gjqtGp4rOSEsUnLL1jO0OqlwyEV4nQGZAIFK5L/NbGLUIVvJytk4
 EkYRKBWBn5PJvelXHQQDJh7/dthdn6YYEWRfr9AEsA5DvWe0ga66CPkBehR5tElO
 Yg9MXf0opCunlXrBYCLP4KxR1WHQL7s7j8ONHrF7HbW/5wVaylKI+BkWCjl8FaFe
 NPH6MxfyENsAHI2Wh/1kK4tg3jSWlXCDfy9rx0xh37MgVtVNGGfsWe6vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=bqBOklXJABlD5jjNvIrS/iMxzEoDg1wzDNL0XDIE7B4=; b=WKJ23IV2
 athUrCmE31+5PKY+Y1HvRpST2eBShNabItuSnkeP7RJ/LxK/y3YcGvdZmGqdbu5q
 1VvGXCsOqL/+BIw0D3kvxeDon0EAkAJnt9hDaHUJuLRYBAd6oeTJeJ1ap52LBUSc
 X+r8PDR/IG0TqPpGlWDj9spsYHhzvTnyzd/0sTx/PPKCz/iIsxIMZ6lGjwOWtIhB
 VSvQCpA4nvXjhIDPKYqiFpv+FqMgJ9GNQvjhig9/0NHSJxxed+MM2s5kW7z33ACl
 WqesJ5qp6ZNGlUYHQn43uL0X2FesX3xc/9nIQuFcAKFPYm5xEzwoI7tGtWBnuqtD
 efMlW7BS3FgOew==
X-ME-Sender: <xms:qNscX4lUDdz0UIBmAA5zsnT1VLYwer4vTiAaS3YiC6zinDcVEcHZYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:qNscX30w4q_nxPuCZKR-u0IXhu8EmhgrcnaH_w2C0NAEalj2jhSl7A>
 <xmx:qNscX2pLeythmwwyt-xfRUd5Uq13a3Skrt3Ou_Iv2fV1h8k_4VHnXA>
 <xmx:qNscX0nE2__SjQu3DiFumCg2pKLRc6gpe3bUu433PKtZGvfriDkwOQ>
 <xmx:qNscXzuZtEXNVP0Q_JVrXzkMARjEnfSR6MAX1J8m8CDwgfTbMyfLig>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6BE8330600A9;
 Sat, 25 Jul 2020 21:25:59 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/7] ASoC: sun8i-codec: Fix DAPM to match the hardware topology
Date: Sat, 25 Jul 2020 20:25:52 -0500
Message-Id: <20200726012557.38282-3-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726012557.38282-1-samuel@sholland.org>
References: <20200726012557.38282-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

The A33/A64 digital codec has 4 physical inputs and 4 physical outputs:
3 AIFs/DAIs and one ADC/DAC pair. Internal routing is accomplished by
a 4-channel mixer connected to each output.

The analog and digital sides of the ADC/DAC are in separate ASoC
components, so card-level DAPM routes (provided in the device tree) are
necessary to connect them together. Currently, these routes are wrong.

For AIF1 Playback, the correct topology is:

         ||<<============ sun8i-codec ===========>>||
         ||                                        ||
 CPU DAI -> AIF1 DA0 -> DAC Mixer -> DAC (digital) -> DAC (analog)
         ||                                        ||

but the driver and device trees currently describe:

         ||                                        ||
 CPU DAI -> AIF1 DA0 -------------------------------> DAC (analog)
         ||     \--> DAC Mixer -> ??? [dead end]   ||

For AIF1 Capture, there is an additional problem, because the Mixer
route is backward. The topology should be:

              ||                                             ||
 ADC (analog) -> ADC (digital) -> AIF1 AD0 Mixer -> AIF1 AD0 -> CPU DAI
              ||                                             ||

but the driver and device trees currently describe:

              ||                                             ||
 ADC (analog) -> AIF1 AD0 ------------------------------------> CPU DAI
              ||     \--> ADC Mixer -> ??? [dead end]        ||

The ADC/DAC are only powered because AIF1 AD0 (capture) has supply
routes from the ADC, and AIF1 DA0 (playback) has supply routes from the
DAC. However, neither set of supply routes matches the hardware
topology. Audio can be routed among AIF1/2/3 without using the ADC or
DAC at all; and audio can be routed from the ADC to the DAC without
using any AIFs (via the "ADC Digital DAC Playback Switch"). Because the
DAPM routes are wrong, both of these use cases are currently broken.

This commit adds the necessary widgets and routes to represent the real
hardware topology, with functionality equivalent to the current driver.

For the existing "allwinner,sun8i-a33-codec" compatible, widgets with
the old names are kept as wrappers around the new widgets, so existing
device trees will continue to work. For "allwinner,sun50i-a64-codec",
the old widgets can be omitted, because no device trees yet use that
compatible.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 120 +++++++++++++++++++++++++++-------
 1 file changed, 95 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index ca51af114419..ffeac150c086 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/log2.h>
@@ -85,10 +86,15 @@
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
 
+struct sun8i_codec_quirks {
+	bool legacy_widgets	: 1;
+};
+
 struct sun8i_codec {
-	struct regmap	*regmap;
-	struct clk	*clk_module;
-	struct clk	*clk_bus;
+	struct regmap			*regmap;
+	struct clk			*clk_module;
+	struct clk			*clk_bus;
+	const struct sun8i_codec_quirks	*quirks;
 };
 
 static int sun8i_codec_runtime_resume(struct device *dev)
@@ -388,22 +394,30 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("ADC", SUN8I_ADC_DIG_CTRL, SUN8I_ADC_DIG_CTRL_ENDA,
 			    0, NULL, 0),
 
-	/* Analog DAC AIF */
-	SND_SOC_DAPM_AIF_IN("AIF1 Slot 0 Left", "Playback", 0,
+	/* AIF "DAC" Inputs */
+	SND_SOC_DAPM_AIF_IN("AIF1 DA0L", "Playback", 0,
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA, 0),
-	SND_SOC_DAPM_AIF_IN("AIF1 Slot 0 Right", "Playback", 0,
+	SND_SOC_DAPM_AIF_IN("AIF1 DA0R", "Playback", 0,
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA, 0),
 
-	/* Analog ADC AIF */
-	SND_SOC_DAPM_AIF_IN("AIF1 Slot 0 Left ADC", "Capture", 0,
+	/* AIF "ADC" Outputs */
+	SND_SOC_DAPM_AIF_IN("AIF1 AD0L", "Capture", 0,
 			    SUN8I_AIF1_ADCDAT_CTRL,
 			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_DA0L_ENA, 0),
-	SND_SOC_DAPM_AIF_IN("AIF1 Slot 0 Right ADC", "Capture", 0,
+	SND_SOC_DAPM_AIF_IN("AIF1 AD0R", "Capture", 0,
 			    SUN8I_AIF1_ADCDAT_CTRL,
 			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_DA0R_ENA, 0),
 
+	/* ADC Inputs (connected to analog codec DAPM context) */
+	SND_SOC_DAPM_ADC("ADCL", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC("ADCR", NULL, SND_SOC_NOPM, 0, 0),
+
+	/* DAC Outputs (connected to analog codec DAPM context) */
+	SND_SOC_DAPM_DAC("DACL", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC("DACR", NULL, SND_SOC_NOPM, 0, 0),
+
 	/* DAC and ADC Mixers */
 	SOC_MIXER_ARRAY("Left Digital DAC Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_dac_mixer_controls),
@@ -449,40 +463,86 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	/* Clock Routes */
 	{ "AIF1", NULL, "SYSCLK AIF1" },
 	{ "AIF1 PLL", NULL, "AIF1" },
-	{ "RST AIF1", NULL, "AIF1 PLL" },
+	{ "SYSCLK", NULL, "AIF1 PLL" },
+
+	{ "RST AIF1", NULL, "SYSCLK" },
 	{ "MODCLK AFI1", NULL, "RST AIF1" },
-	{ "DAC", NULL, "MODCLK AFI1" },
-	{ "ADC", NULL, "MODCLK AFI1" },
+	{ "AIF1 AD0L", NULL, "MODCLK AFI1" },
+	{ "AIF1 AD0R", NULL, "MODCLK AFI1" },
+	{ "AIF1 DA0L", NULL, "MODCLK AFI1" },
+	{ "AIF1 DA0R", NULL, "MODCLK AFI1" },
 
 	{ "RST DAC", NULL, "SYSCLK" },
 	{ "MODCLK DAC", NULL, "RST DAC" },
 	{ "DAC", NULL, "MODCLK DAC" },
+	{ "DACL", NULL, "DAC" },
+	{ "DACR", NULL, "DAC" },
 
 	{ "RST ADC", NULL, "SYSCLK" },
 	{ "MODCLK ADC", NULL, "RST ADC" },
 	{ "ADC", NULL, "MODCLK ADC" },
+	{ "ADCL", NULL, "ADC" },
+	{ "ADCR", NULL, "ADC" },
 
 	/* DAC Routes */
-	{ "AIF1 Slot 0 Right", NULL, "DAC" },
-	{ "AIF1 Slot 0 Left", NULL, "DAC" },
+	{ "DACL", NULL, "Left Digital DAC Mixer" },
+	{ "DACR", NULL, "Right Digital DAC Mixer" },
 
 	/* DAC Mixer Routes */
-	{ "Left Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch",
-	  "AIF1 Slot 0 Left"},
-	{ "Right Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch",
-	  "AIF1 Slot 0 Right"},
+	{ "Left Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0L" },
+	{ "Right Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0R" },
 
 	/* ADC Routes */
-	{ "AIF1 Slot 0 Right ADC", NULL, "ADC" },
-	{ "AIF1 Slot 0 Left ADC", NULL, "ADC" },
+	{ "AIF1 AD0L", NULL, "Left Digital ADC Mixer" },
+	{ "AIF1 AD0R", NULL, "Right Digital ADC Mixer" },
 
 	/* ADC Mixer Routes */
-	{ "Left Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch",
-	  "AIF1 Slot 0 Left ADC" },
-	{ "Right Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch",
-	  "AIF1 Slot 0 Right ADC" },
+	{ "Left Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCL" },
+	{ "Right Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCR" },
+};
+
+static const struct snd_soc_dapm_widget sun8i_codec_legacy_widgets[] = {
+	/* Legacy ADC Inputs (connected to analog codec DAPM context) */
+	SND_SOC_DAPM_ADC("AIF1 Slot 0 Left ADC", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC("AIF1 Slot 0 Right ADC", NULL, SND_SOC_NOPM, 0, 0),
+
+	/* Legacy DAC Outputs (connected to analog codec DAPM context) */
+	SND_SOC_DAPM_DAC("AIF1 Slot 0 Left", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC("AIF1 Slot 0 Right", NULL, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route sun8i_codec_legacy_routes[] = {
+	/* Legacy ADC Routes */
+	{ "ADCL", NULL, "AIF1 Slot 0 Left ADC" },
+	{ "ADCR", NULL, "AIF1 Slot 0 Right ADC" },
+
+	/* Legacy DAC Routes */
+	{ "AIF1 Slot 0 Left", NULL, "DACL" },
+	{ "AIF1 Slot 0 Right", NULL, "DACR" },
 };
 
+static int sun8i_codec_component_probe(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct sun8i_codec *scodec = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* Add widgets for backward compatibility with old device trees. */
+	if (scodec->quirks->legacy_widgets) {
+		ret = snd_soc_dapm_new_controls(dapm, sun8i_codec_legacy_widgets,
+						ARRAY_SIZE(sun8i_codec_legacy_widgets));
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dapm_add_routes(dapm, sun8i_codec_legacy_routes,
+					      ARRAY_SIZE(sun8i_codec_legacy_routes));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
 	.hw_params = sun8i_codec_hw_params,
 	.set_fmt = sun8i_set_fmt,
@@ -566,6 +626,8 @@ static int sun8i_codec_probe(struct platform_device *pdev)
 		return PTR_ERR(scodec->regmap);
 	}
 
+	scodec->quirks = of_device_get_match_data(&pdev->dev);
+
 	platform_set_drvdata(pdev, scodec);
 
 	pm_runtime_enable(&pdev->dev);
@@ -603,8 +665,16 @@ static int sun8i_codec_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sun8i_codec_quirks sun8i_a33_quirks = {
+	.legacy_widgets	= true,
+};
+
+static const struct sun8i_codec_quirks sun50i_a64_quirks = {
+};
+
 static const struct of_device_id sun8i_codec_of_match[] = {
-	{ .compatible = "allwinner,sun8i-a33-codec" },
+	{ .compatible = "allwinner,sun8i-a33-codec", .data = &sun8i_a33_quirks },
+	{ .compatible = "allwinner,sun50i-a64-codec", .data = &sun50i_a64_quirks },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun8i_codec_of_match);
-- 
2.26.2

