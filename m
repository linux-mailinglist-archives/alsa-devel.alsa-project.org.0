Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158327F7E4
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:17:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C71B17DA;
	Thu,  1 Oct 2020 04:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C71B17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518622;
	bh=D7GSK8l02aDHdK3E/YafiSSocVf8NHYb2+qOTwMXMO8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZmksT913W4rY4MW9VwUSxADcbauHBef4E9eqAf9z+ZMvkeHFY/9ECiNhEoDE6UIn
	 C7BiyduuWThMw1D9rMXIGuYjWMA+JlWkSUi2zUPNWPR8UbWe//l2w034tTxNI15/ja
	 eCr8IWGITcj4uEKmN4IfTVxxonBQ84IvxMMUiw48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8BD5F80322;
	Thu,  1 Oct 2020 04:12:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7850F802C4; Thu,  1 Oct 2020 04:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C03E1F8027D
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C03E1F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="hnebuOzz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="cELtpasU"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 669FC58030D;
 Wed, 30 Sep 2020 22:11:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=gKhvqXOjb9UBY
 vIUjTakRt05bYPTaGMxv+dqb+gLEvI=; b=hnebuOzzxhCONvUwwPaxEGlK0Sk25
 ZUBZfEzNGGZMXrFOXE/22tNjZz7v/OEvV0sCEVtvJ1h/fy4evO6m5PvidasTVImU
 RDgVIDN3WBqnhH0mgjgga4/AE1KEGdE3cMf+BYoSNLt8Aln+8hnYiWTu+ssUG7OZ
 RHYuESNWLssA/nnEdAPKam1C515lukzCrmsKMzUeq5TZFAb7SjY5HcmlrQ0FF3s3
 d3xxJ8JSWF+fDZUCqw9nyVp3OHVGS4K+eReN1vRHDlihjiqSEvq/ApYNiRCi8NMj
 jTn5t0FqIe+87aCg8kohxh5QnFP7GaU04kHUiqy4bquW4PDIPHiL0bjUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gKhvqXOjb9UBYvIUjTakRt05bYPTaGMxv+dqb+gLEvI=; b=cELtpasU
 +jTcLgMCo9lx4QADju1XL1WD8Iny9uXEhmQRYbGxntT5PVH1WS3TIArpwiMDIgpv
 TFTCDqKP7CW2z8sVZqaNCaVxkvhg3C60r9YD3yK52/6wT9E3ATvDHfh4rH8d8qMd
 TTdTK3WkEV7NC10K9KUbITKxq9RHCU8/HPbDw1OrY6EceHpmhLwlJ6QetaYZZw8v
 NaZCa4ts4hxC/3c45tRYZOfvfrSl6G7Op/t5DrinWCewq25SzkWDLqs7de6BwFi+
 RtExXF5D3zuFNcCIN8Jdv5ZSbHA1iJrw7rvm12XIcqc63SWj4SZrB01EOR9xWVMd
 k1wRlwmmUKGpQw==
X-ME-Sender: <xms:6Tp1X6QdsfsrNtdMvvsTY3N3R5Wuq48nllK3pDuD0GLssssOwY_8kQ>
 <xme:6Tp1X_wSMR5oCv7Pni84sZRmRNaAaMo3-YTS636g1On7kNvTOhO8VVVOFEvv0yMXH
 qgj215-ruA-K1bMFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:6Tp1X33Vo_GhBFGlSGREtkerNfJMhie1JxBeAJc1Dg_1eDay7r6-jw>
 <xmx:6Tp1X2Cgr47YwRIE9pJFt1qiCgIxReFCqDBjWzQfldNAFd7_iY8YIw>
 <xmx:6Tp1XzhNod-iEWcUyVDZ9OUn_dxNC8vnMrTRQOleeXJQhIdc03PUxw>
 <xmx:6Tp1X0UXl3ZKtYchbr_k2q_iqjnBBEiclqq1vV2xRLzcdArC4NeTMQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D6313064680;
 Wed, 30 Sep 2020 22:11:52 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 07/25] ASoC: sun8i-codec: Enable AIF mono/stereo control
Date: Wed, 30 Sep 2020 21:11:30 -0500
Message-Id: <20201001021148.15852-8-samuel@sholland.org>
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

Each left/right pair of AIF input/output channels can be swapped or
combined. This is useful for sending a mono audio source to both sides
of a stereo sink, or for creating complex mixing scenarios.

Add the support to control this feature from userspace.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 82 ++++++++++++++++++++++++++++++++---
 1 file changed, 76 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 2c89974243e1..578c0c0e6330 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -49,19 +49,23 @@
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16		(1 << 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
 #define SUN8I_AIF1_ADCDAT_CTRL				0x044
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
+#define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_SRC		10
+#define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_SRC		8
 #define SUN8I_AIF1_DACDAT_CTRL				0x048
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA		15
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA		14
+#define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_SRC		10
+#define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_SRC		8
 #define SUN8I_AIF1_MXR_SRC				0x04c
 #define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF1DA0L	15
 #define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACL	14
 #define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_ADCL		13
 #define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACR	12
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF1DA0R	11
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACR	10
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR		9
@@ -327,16 +331,30 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
 			   SUN8I_SYS_SR_CTRL_AIF1_FS_MASK,
 			   sample_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
 
 	return 0;
 }
 
+static const char *const sun8i_aif_stereo_mux_enum_values[] = {
+	"Stereo", "Reverse Stereo", "Sum Mono", "Mix Mono"
+};
+
+static SOC_ENUM_DOUBLE_DECL(sun8i_aif1_ad0_stereo_mux_enum,
+			    SUN8I_AIF1_ADCDAT_CTRL,
+			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_SRC,
+			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_SRC,
+			    sun8i_aif_stereo_mux_enum_values);
+
+static const struct snd_kcontrol_new sun8i_aif1_ad0_stereo_mux_control =
+	SOC_DAPM_ENUM("AIF1 AD0 Stereo Capture Route",
+		      sun8i_aif1_ad0_stereo_mux_enum);
+
 static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF1DA0L,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF1DA0R, 1, 0),
 	SOC_DAPM_DOUBLE("AIF2 Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACL,
@@ -346,16 +364,26 @@ static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_ADCL,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR, 1, 0),
 	SOC_DAPM_DOUBLE("AIF2 Inv Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACR,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL, 1, 0),
 };
 
+static SOC_ENUM_DOUBLE_DECL(sun8i_aif1_da0_stereo_mux_enum,
+			    SUN8I_AIF1_DACDAT_CTRL,
+			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_SRC,
+			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_SRC,
+			    sun8i_aif_stereo_mux_enum_values);
+
+static const struct snd_kcontrol_new sun8i_aif1_da0_stereo_mux_control =
+	SOC_DAPM_ENUM("AIF1 DA0 Stereo Playback Route",
+		      sun8i_aif1_da0_stereo_mux_enum);
+
 static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital DAC Playback Switch",
 			SUN8I_DAC_MXR_SRC,
 			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA0L,
 			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA0R, 1, 0),
 	SOC_DAPM_DOUBLE("AIF1 Slot 1 Digital DAC Playback Switch",
 			SUN8I_DAC_MXR_SRC,
 			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA1L,
@@ -412,22 +440,34 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	/* AIF "ADC" Outputs */
 	SND_SOC_DAPM_AIF_OUT("AIF1 AD0L", "Capture", 0,
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0),
 	SND_SOC_DAPM_AIF_OUT("AIF1 AD0R", "Capture", 1,
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
 
+	/* AIF "ADC" Mono/Stereo Muxes */
+	SND_SOC_DAPM_MUX("AIF1 AD0L Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif1_ad0_stereo_mux_control),
+	SND_SOC_DAPM_MUX("AIF1 AD0R Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif1_ad0_stereo_mux_control),
+
 	/* AIF "ADC" Mixers */
 	SOC_MIXER_ARRAY("AIF1 AD0L Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 	SOC_MIXER_ARRAY("AIF1 AD0R Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 
+	/* AIF "DAC" Mono/Stereo Muxes */
+	SND_SOC_DAPM_MUX("AIF1 DA0L Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif1_da0_stereo_mux_control),
+	SND_SOC_DAPM_MUX("AIF1 DA0R Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif1_da0_stereo_mux_control),
+
 	/* AIF "DAC" Inputs */
 	SND_SOC_DAPM_AIF_IN("AIF1 DA0L", "Playback", 0,
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA, 0),
 	SND_SOC_DAPM_AIF_IN("AIF1 DA0R", "Playback", 1,
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA, 0),
 
@@ -468,35 +508,65 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 
 	{ "CLK DAC", NULL, "SYSCLK" },
 	{ "RST DAC", NULL, "CLK DAC" },
 	{ "DAC", NULL, "RST DAC" },
 	{ "DACL", NULL, "DAC" },
 	{ "DACR", NULL, "DAC" },
 
 	/* AIF "ADC" Output Routes */
-	{ "AIF1 AD0L", NULL, "AIF1 AD0L Mixer" },
-	{ "AIF1 AD0R", NULL, "AIF1 AD0R Mixer" },
+	{ "AIF1 AD0L", NULL, "AIF1 AD0L Stereo Mux" },
+	{ "AIF1 AD0R", NULL, "AIF1 AD0R Stereo Mux" },
+
+	/* AIF "ADC" Mono/Stereo Mux Routes */
+	{ "AIF1 AD0L Stereo Mux", "Stereo", "AIF1 AD0L Mixer" },
+	{ "AIF1 AD0L Stereo Mux", "Reverse Stereo", "AIF1 AD0R Mixer" },
+	{ "AIF1 AD0L Stereo Mux", "Sum Mono", "AIF1 AD0L Mixer" },
+	{ "AIF1 AD0L Stereo Mux", "Sum Mono", "AIF1 AD0R Mixer" },
+	{ "AIF1 AD0L Stereo Mux", "Mix Mono", "AIF1 AD0L Mixer" },
+	{ "AIF1 AD0L Stereo Mux", "Mix Mono", "AIF1 AD0R Mixer" },
+
+	{ "AIF1 AD0R Stereo Mux", "Stereo", "AIF1 AD0R Mixer" },
+	{ "AIF1 AD0R Stereo Mux", "Reverse Stereo", "AIF1 AD0L Mixer" },
+	{ "AIF1 AD0R Stereo Mux", "Sum Mono", "AIF1 AD0L Mixer" },
+	{ "AIF1 AD0R Stereo Mux", "Sum Mono", "AIF1 AD0R Mixer" },
+	{ "AIF1 AD0R Stereo Mux", "Mix Mono", "AIF1 AD0L Mixer" },
+	{ "AIF1 AD0R Stereo Mux", "Mix Mono", "AIF1 AD0R Mixer" },
 
 	/* AIF "ADC" Mixer Routes */
-	{ "AIF1 AD0L Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0L" },
+	{ "AIF1 AD0L Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0L Stereo Mux" },
 	{ "AIF1 AD0L Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCL" },
 
-	{ "AIF1 AD0R Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0R" },
+	{ "AIF1 AD0R Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0R Stereo Mux" },
 	{ "AIF1 AD0R Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCR" },
 
+	/* AIF "DAC" Mono/Stereo Mux Routes */
+	{ "AIF1 DA0L Stereo Mux", "Stereo", "AIF1 DA0L" },
+	{ "AIF1 DA0L Stereo Mux", "Reverse Stereo", "AIF1 DA0R" },
+	{ "AIF1 DA0L Stereo Mux", "Sum Mono", "AIF1 DA0L" },
+	{ "AIF1 DA0L Stereo Mux", "Sum Mono", "AIF1 DA0R" },
+	{ "AIF1 DA0L Stereo Mux", "Mix Mono", "AIF1 DA0L" },
+	{ "AIF1 DA0L Stereo Mux", "Mix Mono", "AIF1 DA0R" },
+
+	{ "AIF1 DA0R Stereo Mux", "Stereo", "AIF1 DA0R" },
+	{ "AIF1 DA0R Stereo Mux", "Reverse Stereo", "AIF1 DA0L" },
+	{ "AIF1 DA0R Stereo Mux", "Sum Mono", "AIF1 DA0L" },
+	{ "AIF1 DA0R Stereo Mux", "Sum Mono", "AIF1 DA0R" },
+	{ "AIF1 DA0R Stereo Mux", "Mix Mono", "AIF1 DA0L" },
+	{ "AIF1 DA0R Stereo Mux", "Mix Mono", "AIF1 DA0R" },
+
 	/* DAC Output Routes */
 	{ "DACL", NULL, "DACL Mixer" },
 	{ "DACR", NULL, "DACR Mixer" },
 
 	/* DAC Mixer Routes */
-	{ "DACL Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0L" },
+	{ "DACL Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0L Stereo Mux" },
 	{ "DACL Mixer", "ADC Digital DAC Playback Switch", "ADCL" },
 
-	{ "DACR Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0R" },
+	{ "DACR Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0R Stereo Mux" },
 	{ "DACR Mixer", "ADC Digital DAC Playback Switch", "ADCR" },
 };
 
 static const struct snd_soc_dapm_widget sun8i_codec_legacy_widgets[] = {
 	/* Legacy ADC Inputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_ADC("AIF1 Slot 0 Left ADC", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_ADC("AIF1 Slot 0 Right ADC", NULL, SND_SOC_NOPM, 0, 0),
 
-- 
2.26.2

