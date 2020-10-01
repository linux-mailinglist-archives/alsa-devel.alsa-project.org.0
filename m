Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F04B627F7DD
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F76017DB;
	Thu,  1 Oct 2020 04:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F76017DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518523;
	bh=U/2m3sAPesyKQ7LgLB5evqXFjQ+a6kfelWbFM+bl1kY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OniWne6kR2CnE8YUfyl2hlwK/I/KEYmE4CWvfizkSqZCF9ImHn8eoju0IGrw50WPJ
	 G/H9WBDQ5rsT/wBCm3D+sh4guI4g5yJoClDKYBjeJjEXI+sGrokhU1AN3zc04SM8wC
	 6dUEMjIAnOCejmftyG83z3OWwBUKmU7kVxOTyjc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D60F80317;
	Thu,  1 Oct 2020 04:12:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EE90F80303; Thu,  1 Oct 2020 04:12:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FF07F801F5
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FF07F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="HUfWYknV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="F8pXz1DG"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 419D6580059;
 Wed, 30 Sep 2020 22:11:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=DYMO1RTQowVN/
 z5N7yNaFPdA+DsV3y7nHtaJ9hxxb7Y=; b=HUfWYknVkjKaTblXqzPP75TA2kO23
 azywB7IOSGIPCbuGG83a/ZBz3vxWqsYdpX/MjylqcHjKUy23RPhazDQG+Sgaf/Wd
 sFSAlkmq04TT/9ipGsz97O0Ro6QB6dYZjC+jND/MRNl7UlhwZD1Yrj805chKmhWV
 734e3AI0pEjk+zNNwzRSJUkPDsr0Z/XbX/vnAr4ObEBvj+RzKeiloweF3UbxBFZP
 lu4sZaNalxPNPaZuGFQVMleqgh/jl7hawAJ5FiwX+6ycCtPOxIZXPlWTI0kXqRBi
 8iuvm2+uqHm22U/8TMDYuoDEL7To2vlXC+rh0yEMFnWSuyR7c4Q4IbycA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=DYMO1RTQowVN/z5N7yNaFPdA+DsV3y7nHtaJ9hxxb7Y=; b=F8pXz1DG
 gFM4cF447gZh+imSsUY7eZ6MZbxbrCAxXO/SNpwAvj4noaiPrJ+PDLMXHNm0OcE3
 BY8EOT5PryFn4U4jCC2+5K/637Mnt/HlkkiwV3pu13nR4Pf3hckr5QqhFsguR7zk
 9o30dNZmFR9ze8Rz57uOdPc4PujGbBork1gbntxs3jf+d3z9K0WjZPDaP+j6viaL
 VpD13popuauzvg2pyHK3cmcncWeuPSkwM58G/s2knaqWPZqcotcjSDr0+9XKNpzh
 Lykg4c5jtTJBuzl8v5e63yaPMwiC83YQQxtkDXTypot62HxdYOGKW40Peo56ChWc
 +83Un1fNuJkXcg==
X-ME-Sender: <xms:5jp1X4mXcg6DsroHLDjzdSb_U_OySdaQmbGVrfLrDt2SW2OdBjpXDA>
 <xme:5jp1X323MeNo78odV2AHPSULMaI2OyzI4MTV8Oq7Yi4zEopPTZ1OmJzrmy2mLTMBT
 AeojRN7b3qrHHSIZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:5jp1X2rGoevjm5_qOsuDXU_k12-qsAOZ6tN4e63vx8GrCwYcG6AECQ>
 <xmx:5jp1X0kjwMbAgLeqEyv1AHWaMVW_ciawAc0MAga_Hs5y4e3rcd42Vg>
 <xmx:5jp1X21gElFt_sLgWy46SiX3891yIpKtpmnYMHY8dvIcze3JxrNgZg>
 <xmx:6Dp1X3IdV_c02KgSULoEABPTk5LNBYRZzfCi85g1CzIRCiuVv2x1BQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 45CFE3064683;
 Wed, 30 Sep 2020 22:11:50 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 02/25] ASoC: sun8i-codec: Swap module clock/reset dependencies
Date: Wed, 30 Sep 2020 21:11:25 -0500
Message-Id: <20201001021148.15852-3-samuel@sholland.org>
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

This matches the module power-up/down sequence from the vendor's driver.

While updating these widgets/routes, reorder them to match the register
and bit layout of the hardware. This puts them in the same place in the
widget and route arrays (previously they were at opposite ends), and it
makes it easier to track which parts of which registers are implemented.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 72 +++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 407f0fedc4ed..6887a2e897f4 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -373,16 +373,38 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 
 	SND_SOC_DAPM_SUPPLY("AIF1CLK",
 			    SUN8I_SYSCLK_CTL,
 			    SUN8I_SYSCLK_CTL_AIF1CLK_ENA, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("SYSCLK",
 			    SUN8I_SYSCLK_CTL,
 			    SUN8I_SYSCLK_CTL_SYSCLK_ENA, 0, NULL, 0),
 
+	/* Module Clocks */
+	SND_SOC_DAPM_SUPPLY("CLK AIF1",
+			    SUN8I_MOD_CLK_ENA,
+			    SUN8I_MOD_CLK_ENA_AIF1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("CLK ADC",
+			    SUN8I_MOD_CLK_ENA,
+			    SUN8I_MOD_CLK_ENA_ADC, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("CLK DAC",
+			    SUN8I_MOD_CLK_ENA,
+			    SUN8I_MOD_CLK_ENA_DAC, 0, NULL, 0),
+
+	/* Module Resets */
+	SND_SOC_DAPM_SUPPLY("RST AIF1",
+			    SUN8I_MOD_RST_CTL,
+			    SUN8I_MOD_RST_CTL_AIF1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("RST ADC",
+			    SUN8I_MOD_RST_CTL,
+			    SUN8I_MOD_RST_CTL_ADC, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("RST DAC",
+			    SUN8I_MOD_RST_CTL,
+			    SUN8I_MOD_RST_CTL_DAC, 0, NULL, 0),
+
 	/* Digital parts of the DACs and ADC */
 	SND_SOC_DAPM_SUPPLY("DAC", SUN8I_DAC_DIG_CTRL, SUN8I_DAC_DIG_CTRL_ENDA,
 			    0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("ADC", SUN8I_ADC_DIG_CTRL, SUN8I_ADC_DIG_CTRL_ENAD,
 			    0, NULL, 0),
 
 	/* AIF "DAC" Inputs */
 	SND_SOC_DAPM_AIF_IN("AIF1 DA0L", "Playback", 0,
@@ -412,60 +434,44 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SOC_MIXER_ARRAY("Left Digital DAC Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_dac_mixer_controls),
 	SOC_MIXER_ARRAY("Right Digital DAC Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_dac_mixer_controls),
 	SOC_MIXER_ARRAY("Left Digital ADC Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_input_mixer_controls),
 	SOC_MIXER_ARRAY("Right Digital ADC Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_input_mixer_controls),
-
-	/* Clocks */
-	SND_SOC_DAPM_SUPPLY("MODCLK AIF1", SUN8I_MOD_CLK_ENA,
-			    SUN8I_MOD_CLK_ENA_AIF1, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("MODCLK DAC", SUN8I_MOD_CLK_ENA,
-			    SUN8I_MOD_CLK_ENA_DAC, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("MODCLK ADC", SUN8I_MOD_CLK_ENA,
-			    SUN8I_MOD_CLK_ENA_ADC, 0, NULL, 0),
-
-	/* Module reset */
-	SND_SOC_DAPM_SUPPLY("RST AIF1", SUN8I_MOD_RST_CTL,
-			    SUN8I_MOD_RST_CTL_AIF1, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("RST DAC", SUN8I_MOD_RST_CTL,
-			    SUN8I_MOD_RST_CTL_DAC, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("RST ADC", SUN8I_MOD_RST_CTL,
-			    SUN8I_MOD_RST_CTL_ADC, 0, NULL, 0),
 };
 
 static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	/* Clock Routes */
 	{ "AIF1CLK", NULL, "mod" },
 
 	{ "SYSCLK", NULL, "AIF1CLK" },
 
-	{ "RST AIF1", NULL, "AIF1CLK" },
-	{ "RST AIF1", NULL, "SYSCLK" },
-	{ "MODCLK AIF1", NULL, "RST AIF1" },
-	{ "AIF1 AD0L", NULL, "MODCLK AIF1" },
-	{ "AIF1 AD0R", NULL, "MODCLK AIF1" },
-	{ "AIF1 DA0L", NULL, "MODCLK AIF1" },
-	{ "AIF1 DA0R", NULL, "MODCLK AIF1" },
-
-	{ "RST DAC", NULL, "SYSCLK" },
-	{ "MODCLK DAC", NULL, "RST DAC" },
-	{ "DAC", NULL, "MODCLK DAC" },
-	{ "DACL", NULL, "DAC" },
-	{ "DACR", NULL, "DAC" },
-
-	{ "RST ADC", NULL, "SYSCLK" },
-	{ "MODCLK ADC", NULL, "RST ADC" },
-	{ "ADC", NULL, "MODCLK ADC" },
+	{ "CLK AIF1", NULL, "AIF1CLK" },
+	{ "CLK AIF1", NULL, "SYSCLK" },
+	{ "RST AIF1", NULL, "CLK AIF1" },
+	{ "AIF1 AD0L", NULL, "RST AIF1" },
+	{ "AIF1 AD0R", NULL, "RST AIF1" },
+	{ "AIF1 DA0L", NULL, "RST AIF1" },
+	{ "AIF1 DA0R", NULL, "RST AIF1" },
+
+	{ "CLK ADC", NULL, "SYSCLK" },
+	{ "RST ADC", NULL, "CLK ADC" },
+	{ "ADC", NULL, "RST ADC" },
 	{ "ADCL", NULL, "ADC" },
 	{ "ADCR", NULL, "ADC" },
 
+	{ "CLK DAC", NULL, "SYSCLK" },
+	{ "RST DAC", NULL, "CLK DAC" },
+	{ "DAC", NULL, "RST DAC" },
+	{ "DACL", NULL, "DAC" },
+	{ "DACR", NULL, "DAC" },
+
 	/* DAC Routes */
 	{ "DACL", NULL, "Left Digital DAC Mixer" },
 	{ "DACR", NULL, "Right Digital DAC Mixer" },
 
 	/* DAC Mixer Routes */
 	{ "Left Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0L" },
 	{ "Left Digital DAC Mixer", "ADC Digital DAC Playback Switch", "ADCL" },
 
-- 
2.26.2

