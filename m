Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C39827F7D9
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:13:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4D7617C5;
	Thu,  1 Oct 2020 04:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4D7617C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518425;
	bh=v8NnOqK7VD0GxIR62tK8nUGA7Dg9KPb0FZVZ1TDn64o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p28d6dORiC5bYJ7/DBdisprRKQ5MvtKQP8hYN2TDI4j1BvmPyIXm6eqheIfvGTmL+
	 4gNtrd3+f7Y2WrbIujd/2NgisjgPEZHumAjpum1cAxURCX1sf0kMBY/H7dlTdD2FAu
	 S4dO0VmaBWYoUqjRWTiBWuwAYfRq1w9OT9kEeOM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4460F802F9;
	Thu,  1 Oct 2020 04:12:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8378F802EC; Thu,  1 Oct 2020 04:12:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12D7EF8020C
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12D7EF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="QqH0u+Pe"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tiY1DBk/"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4BBE9580105;
 Wed, 30 Sep 2020 22:11:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=PM588keGduqND
 HC61zZuIivNHn9XTFz8mjXEgltknWo=; b=QqH0u+Pe7IH+uH+TMxfu/BHWSDGkx
 t412qINVB1I6ZbfacLaolU1zs7qLXHqM0SOGg4mwd7SFq6jiYTPHXsWAnWv/I2jA
 MOrywjgydOzPVpbhKwvWmPJI7bVxUC+cXAECcNpBauCNRK5voDfNEWTczZxhTKK2
 8Hefi25DlosA5d8UJZccFHhyNTA7LuXznoQiPmCVh8qcL6lsGtLOqOyqJlV2XhbK
 6+qgQNaYa7xH13Vyp3YYNnv5lPdJEP6i0b73QmMDZ/uUBYXoGZaJYCEp1Vv6HBaa
 1VlujzFUuvxGxG42cAlQm8RlC015QZv94Ri7V9GIuLbtbgup5XwCRXgVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=PM588keGduqNDHC61zZuIivNHn9XTFz8mjXEgltknWo=; b=tiY1DBk/
 ij3TLnuhG1U79GTpqXl392+1BdHaldspAQPUVzJ559/BXCwyvVbjBbAByejeWoiE
 lg9dg1XoQd8baBxrQFlLRZ2FMQ4P6JUeB/WnEISVF/4V4v5Z3lv5wN3FVyOce3St
 loi2V36WVaBuZf0NyVV3fu+IpnDCPuHkhDsWeUaf19gP94BhR5Gz2KQFBTDFvJAs
 fYcWjmWxycEjMmUInSGcWWOml/ngRoAO8VsRixVTb3jnH5/+FLsduo5rKZblxUi+
 ZRYg9m14TBCx35RiPsWxhB8MQx3WrAHTnOLoFclfQloyqL9u4KlGN19I0TMdq1/a
 I25jczFZtEssQg==
X-ME-Sender: <xms:5zp1X1vEub9c0eLYoYvkP-bKpm53QolZS_a_vV72MZyDIkk5Az9xtw>
 <xme:5zp1X-d4XL59ke18nH2FANTelQ2_LJGCm_eXFJ_ctKZsueUw2eGumCX2hlsHvBSUm
 S2lYxrAPiMu3v09iA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:5zp1X4xcU-Bxp2sqGbmIw3GkrK9ETEir78IkIz04PoCxfVNj-2CTeQ>
 <xmx:5zp1X8Obl2bRFTB8kX799Oc0Cik2jFpkVK8kiNy5i_yTGIGxh4GNJg>
 <xmx:5zp1X19IhtLO8b-ibnWl_qzOEw3lkY4D_gVrIuE-gwmTSV9xU_pwig>
 <xmx:6Dp1XxSAAkMao-iOoCiMxk0Wa-mCdyZO51kgRTvVQZQ6DmPRQzOoDw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id B851E3064684;
 Wed, 30 Sep 2020 22:11:50 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 03/25] ASoC: sun8i-codec: Sort DAPM controls, widgets,
 and routes
Date: Wed, 30 Sep 2020 21:11:26 -0500
Message-Id: <20201001021148.15852-4-samuel@sholland.org>
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

Sort the remaining pieces of the DAPM driver so that they are all in the
same order among controls/widgets/routes, and so they roughly match the
register word and bit order of the hardware. This nicely separates the
AIF-related widgets from the ADC/DAC widgets, which allows the AIF
widgets to stay in a logical order as more AIFs are added to the driver.

No widgets are renamed, to ease verification that this commit makes no
functional change.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 101 ++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 48 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 6887a2e897f4..d14243c434f9 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -327,16 +327,35 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
 			   SUN8I_SYS_SR_CTRL_AIF1_FS_MASK,
 			   sample_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
 
 	return 0;
 }
 
+static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
+	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital ADC Capture Switch",
+			SUN8I_AIF1_MXR_SRC,
+			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF1DA0L,
+			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF1DA0R, 1, 0),
+	SOC_DAPM_DOUBLE("AIF2 Digital ADC Capture Switch",
+			SUN8I_AIF1_MXR_SRC,
+			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACL,
+			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACR, 1, 0),
+	SOC_DAPM_DOUBLE("AIF1 Data Digital ADC Capture Switch",
+			SUN8I_AIF1_MXR_SRC,
+			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_ADCL,
+			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR, 1, 0),
+	SOC_DAPM_DOUBLE("AIF2 Inv Digital ADC Capture Switch",
+			SUN8I_AIF1_MXR_SRC,
+			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACR,
+			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL, 1, 0),
+};
+
 static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital DAC Playback Switch",
 			SUN8I_DAC_MXR_SRC,
 			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA0L,
 			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA0R, 1, 0),
 	SOC_DAPM_DOUBLE("AIF1 Slot 1 Digital DAC Playback Switch",
 			SUN8I_DAC_MXR_SRC,
 			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA1L,
@@ -344,34 +363,16 @@ static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("AIF2 Digital DAC Playback Switch", SUN8I_DAC_MXR_SRC,
 			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF2DACL,
 			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR, 1, 0),
 	SOC_DAPM_DOUBLE("ADC Digital DAC Playback Switch", SUN8I_DAC_MXR_SRC,
 			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_ADCL,
 			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR, 1, 0),
 };
 
-static const struct snd_kcontrol_new sun8i_input_mixer_controls[] = {
-	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital ADC Capture Switch",
-			SUN8I_AIF1_MXR_SRC,
-			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF1DA0L,
-			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF1DA0R, 1, 0),
-	SOC_DAPM_DOUBLE("AIF2 Digital ADC Capture Switch", SUN8I_AIF1_MXR_SRC,
-			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACL,
-			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACR, 1, 0),
-	SOC_DAPM_DOUBLE("AIF1 Data Digital ADC Capture Switch",
-			SUN8I_AIF1_MXR_SRC,
-			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_ADCL,
-			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR, 1, 0),
-	SOC_DAPM_DOUBLE("AIF2 Inv Digital ADC Capture Switch",
-			SUN8I_AIF1_MXR_SRC,
-			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACR,
-			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL, 1, 0),
-};
-
 static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	/* System Clocks */
 	SND_SOC_DAPM_CLOCK_SUPPLY("mod"),
 
 	SND_SOC_DAPM_SUPPLY("AIF1CLK",
 			    SUN8I_SYSCLK_CTL,
 			    SUN8I_SYSCLK_CTL_AIF1CLK_ENA, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("SYSCLK",
@@ -395,55 +396,59 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 			    SUN8I_MOD_RST_CTL_AIF1, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST ADC",
 			    SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_ADC, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST DAC",
 			    SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_DAC, 0, NULL, 0),
 
-	/* Digital parts of the DACs and ADC */
-	SND_SOC_DAPM_SUPPLY("DAC", SUN8I_DAC_DIG_CTRL, SUN8I_DAC_DIG_CTRL_ENDA,
-			    0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("ADC", SUN8I_ADC_DIG_CTRL, SUN8I_ADC_DIG_CTRL_ENAD,
-			    0, NULL, 0),
-
-	/* AIF "DAC" Inputs */
-	SND_SOC_DAPM_AIF_IN("AIF1 DA0L", "Playback", 0,
-			    SUN8I_AIF1_DACDAT_CTRL,
-			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA, 0),
-	SND_SOC_DAPM_AIF_IN("AIF1 DA0R", "Playback", 0,
-			    SUN8I_AIF1_DACDAT_CTRL,
-			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA, 0),
+	/* Module Supplies */
+	SND_SOC_DAPM_SUPPLY("ADC",
+			    SUN8I_ADC_DIG_CTRL,
+			    SUN8I_ADC_DIG_CTRL_ENAD, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DAC",
+			    SUN8I_DAC_DIG_CTRL,
+			    SUN8I_DAC_DIG_CTRL_ENDA, 0, NULL, 0),
 
 	/* AIF "ADC" Outputs */
 	SND_SOC_DAPM_AIF_IN("AIF1 AD0L", "Capture", 0,
 			    SUN8I_AIF1_ADCDAT_CTRL,
 			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0),
 	SND_SOC_DAPM_AIF_IN("AIF1 AD0R", "Capture", 0,
 			    SUN8I_AIF1_ADCDAT_CTRL,
 			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
 
+	/* AIF "ADC" Mixers */
+	SOC_MIXER_ARRAY("Left Digital ADC Mixer", SND_SOC_NOPM, 0, 0,
+			sun8i_aif1_ad0_mixer_controls),
+	SOC_MIXER_ARRAY("Right Digital ADC Mixer", SND_SOC_NOPM, 0, 0,
+			sun8i_aif1_ad0_mixer_controls),
+
+	/* AIF "DAC" Inputs */
+	SND_SOC_DAPM_AIF_IN("AIF1 DA0L", "Playback", 0,
+			    SUN8I_AIF1_DACDAT_CTRL,
+			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA, 0),
+	SND_SOC_DAPM_AIF_IN("AIF1 DA0R", "Playback", 0,
+			    SUN8I_AIF1_DACDAT_CTRL,
+			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA, 0),
+
 	/* ADC Inputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_ADC("ADCL", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_ADC("ADCR", NULL, SND_SOC_NOPM, 0, 0),
 
 	/* DAC Outputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_DAC("DACL", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_DAC("DACR", NULL, SND_SOC_NOPM, 0, 0),
 
-	/* DAC and ADC Mixers */
+	/* DAC Mixers */
 	SOC_MIXER_ARRAY("Left Digital DAC Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_dac_mixer_controls),
 	SOC_MIXER_ARRAY("Right Digital DAC Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_dac_mixer_controls),
-	SOC_MIXER_ARRAY("Left Digital ADC Mixer", SND_SOC_NOPM, 0, 0,
-			sun8i_input_mixer_controls),
-	SOC_MIXER_ARRAY("Right Digital ADC Mixer", SND_SOC_NOPM, 0, 0,
-			sun8i_input_mixer_controls),
 };
 
 static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	/* Clock Routes */
 	{ "AIF1CLK", NULL, "mod" },
 
 	{ "SYSCLK", NULL, "AIF1CLK" },
 
@@ -462,37 +467,37 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	{ "ADCR", NULL, "ADC" },
 
 	{ "CLK DAC", NULL, "SYSCLK" },
 	{ "RST DAC", NULL, "CLK DAC" },
 	{ "DAC", NULL, "RST DAC" },
 	{ "DACL", NULL, "DAC" },
 	{ "DACR", NULL, "DAC" },
 
-	/* DAC Routes */
+	/* AIF "ADC" Output Routes */
+	{ "AIF1 AD0L", NULL, "Left Digital ADC Mixer" },
+	{ "AIF1 AD0R", NULL, "Right Digital ADC Mixer" },
+
+	/* AIF "ADC" Mixer Routes */
+	{ "Left Digital ADC Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0L" },
+	{ "Left Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCL" },
+
+	{ "Right Digital ADC Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0R" },
+	{ "Right Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCR" },
+
+	/* DAC Output Routes */
 	{ "DACL", NULL, "Left Digital DAC Mixer" },
 	{ "DACR", NULL, "Right Digital DAC Mixer" },
 
 	/* DAC Mixer Routes */
 	{ "Left Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0L" },
 	{ "Left Digital DAC Mixer", "ADC Digital DAC Playback Switch", "ADCL" },
 
 	{ "Right Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0R" },
 	{ "Right Digital DAC Mixer", "ADC Digital DAC Playback Switch", "ADCR" },
-
-	/* ADC Routes */
-	{ "AIF1 AD0L", NULL, "Left Digital ADC Mixer" },
-	{ "AIF1 AD0R", NULL, "Right Digital ADC Mixer" },
-
-	/* ADC Mixer Routes */
-	{ "Left Digital ADC Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0L" },
-	{ "Left Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCL" },
-
-	{ "Right Digital ADC Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0R" },
-	{ "Right Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCR" },
 };
 
 static const struct snd_soc_dapm_widget sun8i_codec_legacy_widgets[] = {
 	/* Legacy ADC Inputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_ADC("AIF1 Slot 0 Left ADC", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_ADC("AIF1 Slot 0 Right ADC", NULL, SND_SOC_NOPM, 0, 0),
 
 	/* Legacy DAC Outputs (connected to analog codec DAPM context) */
-- 
2.26.2

