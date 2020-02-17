Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2818D160B58
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:00:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B592616B3;
	Mon, 17 Feb 2020 07:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B592616B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922808;
	bh=Q5dNHCe2KOM5o+2m6ThjYxKXdVJjgKRcffxhuPQySDI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJ06Q+oxPFnv8tS5X3ayXlASAwCsZIsofzgrS8poMsgXv0PTEUEDa8Y+SNJtoPpHT
	 X5Xqz9ASLhO/Qs0adTh/Y1Oivmi68IeKICz2u9tiRlgadEI6dffNL62VtlI4z9cWMA
	 Qrpt9vFpkJ/J7Wn3yTfMkWLmtmUce0X5622NQrqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE7EF8038E;
	Mon, 17 Feb 2020 07:44:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14619F80315; Mon, 17 Feb 2020 07:43:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CFA3F802A1
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CFA3F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="duLasZfF"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="A3QY52e0"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id A6FA45393;
 Mon, 17 Feb 2020 01:43:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=scfk6cXwT4IdX
 M3/m668SJ/V2kD1GATUTJ704s5ASDA=; b=duLasZfFhfBiXkikNhga2W8eu+jnQ
 jaGxA+XXbiZ9ZySCs9wm9GoQD6xLYKUaZt0WFnKdyJqh3DgB5/8op/n/QARYX0Zv
 Z4fKYFwaXdavnkCO6q5DbPeqwuFgv7gq4UMTaAxdVD49VabMoVIdj6FzrVz8S0X2
 mDElVk8GAfRa4cmFdBEirGbotd+/2epXpAGeck2dNB7gXIYI6HfTh4jdOKvSNrm/
 BVISjWhFWw6jP3JUv4YAQWDpGNsCoy98RsKTxO2BuGNIJC+SktzGp0gBMFnRv9yy
 7olbMzjppH0vHi5xNROiuDSQU8fdU2aeWk5G7X7anGE4hy1auIphJ6zwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=scfk6cXwT4IdXM3/m668SJ/V2kD1GATUTJ704s5ASDA=; b=A3QY52e0
 NmQLTjcqyNg0yjZFJCl8rHs4RrG46ULHYwnEdq+IRtNofHIYoJjIK6huYWkB0On3
 /MEaoapXsyHcSGRyehoHLS8vAtcZBs2M4/VTcFNSLawuL9VTkobrk/Fibe0qFvOR
 dg5EBUPOWZBmt7/IC4CZs5qcKzWVbKk4c7RZLugYY4vgNNpYTUGhIhVAwzoD7yiV
 LRnTcQYYFHc/EGUo5oaMF5Jg8J2tnanlsbGnm8mOK586whFvkH3dW+TmnTKqe3l2
 TAvpL3Ftvyf/MO9LKtXfgkGtSEPzLhhfAMY6iRxuC8pQk8TfFV1PMId28s8BxpYm
 heWYJw+/fPtSqg==
X-ME-Sender: <xms:-jVKXuzK6ABiystxPLTUpsf1efk9LIRhza1dvKvpX4EZW1FYoyPiGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedujeenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:-jVKXpeJyRLYWpGShqua3kjkodUN9FZm0L7CibBV3-NgaAED0Ldgig>
 <xmx:-jVKXjCq0pcEfYN-_dlP6tIH8jT780RjqmJ-Mk8KbGl0xXeT_cO1iQ>
 <xmx:-jVKXt7PKjZJYgyntIr-4R-KnG6D2YvElSbdaEdHyev4dFqNHnaT7A>
 <xmx:-jVKXiGS0jEhdgqZWhNYe0_PRue0DhV_lclQhP18WtCKe5POyOMeJw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id E64853280059;
 Mon, 17 Feb 2020 01:43:05 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:41 -0600
Message-Id: <20200217064250.15516-26-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 25/34] ASoC: sun8i-codec: Add support for
	AIF2
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

This adds the new DAI, clocks, widgets, and routes for AIF2.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 125 ++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index aaea9aaa5632..ce7038bcbdc1 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -25,16 +25,20 @@
 #define SUN8I_SYSCLK_CTL				0x00c
 #define SUN8I_SYSCLK_CTL_AIF1CLK_ENA			11
 #define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_PLL		(0x3 << 8)
+#define SUN8I_SYSCLK_CTL_AIF2CLK_ENA			7
+#define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_PLL		(0x3 << 4)
 #define SUN8I_SYSCLK_CTL_SYSCLK_ENA			3
 #define SUN8I_SYSCLK_CTL_SYSCLK_SRC			0
 #define SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF1CLK		(0x0 << 0)
 #define SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF2CLK		(0x1 << 0)
 #define SUN8I_MOD_CLK_ENA				0x010
 #define SUN8I_MOD_CLK_ENA_AIF1				15
+#define SUN8I_MOD_CLK_ENA_AIF2				14
 #define SUN8I_MOD_CLK_ENA_ADC				3
 #define SUN8I_MOD_CLK_ENA_DAC				2
 #define SUN8I_MOD_RST_CTL				0x014
 #define SUN8I_MOD_RST_CTL_AIF1				15
+#define SUN8I_MOD_RST_CTL_AIF2				14
 #define SUN8I_MOD_RST_CTL_ADC				3
 #define SUN8I_MOD_RST_CTL_DAC				2
 #define SUN8I_SYS_SR_CTRL				0x018
@@ -62,6 +66,21 @@
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACR	10
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR		9
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL	8
+#define SUN8I_AIF2_ADCDAT_CTRL				0x084
+#define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_ENA		15
+#define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_ENA		14
+#define SUN8I_AIF2_DACDAT_CTRL				0x088
+#define SUN8I_AIF2_DACDAT_CTRL_AIF2_DACL_ENA		15
+#define SUN8I_AIF2_DACDAT_CTRL_AIF2_DACR_ENA		14
+#define SUN8I_AIF2_MXR_SRC				0x08c
+#define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA0L	15
+#define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA1L	14
+#define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF2DACR	13
+#define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_ADCL		12
+#define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA0R	11
+#define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA1R	10
+#define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF2DACL	9
+#define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_ADCR		8
 #define SUN8I_ADC_DIG_CTRL				0x100
 #define SUN8I_ADC_DIG_CTRL_ENAD				15
 #define SUN8I_ADC_DIG_CTRL_ADOUT_DTS			2
@@ -79,6 +98,7 @@
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR		8
 
 #define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK	GENMASK(9, 8)
+#define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK	GENMASK(7, 4)
 #define SUN8I_SYS_SR_CTRL_AIF_FS_MASK(n)	(GENMASK(19, 16) >> (4 * (n)))
 #define SUN8I_AIF_CLK_CTRL_CLK_INV_MASK		GENMASK(14, 13)
 #define SUN8I_AIF_CLK_CTRL_BCLK_DIV_MASK	GENMASK(12, 9)
@@ -413,6 +433,32 @@ static struct snd_soc_dai_driver sun8i_codec_dais[] = {
 		.symmetric_channels = 1,
 		.symmetric_samplebits = 1,
 	},
+	{
+		.name = "sun8i-codec-aif2",
+		.id = 2,
+		/* playback capabilities */
+		.playback = {
+			.stream_name = "AIF2 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SUN8I_AIF_PCM_RATES,
+			.formats = SUN8I_AIF_PCM_FMTS,
+		},
+		/* capture capabilities */
+		.capture = {
+			.stream_name = "AIF2 Capture",
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
 };
 
 static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
@@ -434,6 +480,25 @@ static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL, 1, 0),
 };
 
+static const struct snd_kcontrol_new sun8i_aif2_adc_mixer_controls[] = {
+	SOC_DAPM_DOUBLE("AIF2 ADC Mixer AIF1 DA0 Capture Switch",
+			SUN8I_AIF2_MXR_SRC,
+			SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA0L,
+			SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA0R, 1, 0),
+	SOC_DAPM_DOUBLE("AIF2 ADC Mixer AIF1 DA1 Capture Switch",
+			SUN8I_AIF2_MXR_SRC,
+			SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA1L,
+			SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA1R, 1, 0),
+	SOC_DAPM_DOUBLE("AIF2 ADC Mixer AIF2 DAC Rev Capture Switch",
+			SUN8I_AIF2_MXR_SRC,
+			SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF2DACR,
+			SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF2DACL, 1, 0),
+	SOC_DAPM_DOUBLE("AIF2 ADC Mixer ADC Capture Switch",
+			SUN8I_AIF2_MXR_SRC,
+			SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_ADCL,
+			SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_ADCR, 1, 0),
+};
+
 static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("DAC Mixer AIF1 DA0 Playback Switch",
 			SUN8I_DAC_MXR_SRC,
@@ -462,12 +527,24 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
 
+	SND_SOC_DAPM_AIF_OUT("AIF2 ADC Left", "AIF2 Capture", 0,
+			     SUN8I_AIF2_ADCDAT_CTRL,
+			     SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_ENA, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF2 ADC Right", "AIF2 Capture", 1,
+			     SUN8I_AIF2_ADCDAT_CTRL,
+			     SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_ENA, 0),
+
 	/* AIF "ADC" Mixers */
 	SOC_MIXER_ARRAY("AIF1 AD0 Left Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 	SOC_MIXER_ARRAY("AIF1 AD0 Right Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 
+	SOC_MIXER_ARRAY("AIF2 ADC Left Mixer", SND_SOC_NOPM, 0, 0,
+			sun8i_aif2_adc_mixer_controls),
+	SOC_MIXER_ARRAY("AIF2 ADC Right Mixer", SND_SOC_NOPM, 0, 0,
+			sun8i_aif2_adc_mixer_controls),
+
 	/* AIF "DAC" Inputs */
 	SND_SOC_DAPM_AIF_IN("AIF1 DA0 Left", "AIF1 Playback", 0,
 			    SUN8I_AIF1_DACDAT_CTRL,
@@ -476,6 +553,13 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA, 0),
 
+	SND_SOC_DAPM_AIF_IN("AIF2 DAC Left", "AIF2 Playback", 0,
+			    SUN8I_AIF2_DACDAT_CTRL,
+			    SUN8I_AIF2_DACDAT_CTRL_AIF2_DACL_ENA, 0),
+	SND_SOC_DAPM_AIF_IN("AIF2 DAC Right", "AIF2 Playback", 1,
+			    SUN8I_AIF2_DACDAT_CTRL,
+			    SUN8I_AIF2_DACDAT_CTRL_AIF2_DACR_ENA, 0),
+
 	/* Main DAC Outputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_PGA("DAC Left", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("DAC Right", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -499,6 +583,8 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	/* Module Resets */
 	SND_SOC_DAPM_SUPPLY("RST AIF1", SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_AIF1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("RST AIF2", SUN8I_MOD_RST_CTL,
+			    SUN8I_MOD_RST_CTL_AIF2, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST ADC", SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_ADC, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST DAC", SUN8I_MOD_RST_CTL,
@@ -507,6 +593,8 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	/* Module Clocks */
 	SND_SOC_DAPM_SUPPLY("MODCLK AIF1", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_AIF1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MODCLK AIF2", SUN8I_MOD_CLK_ENA,
+			    SUN8I_MOD_CLK_ENA_AIF2, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MODCLK ADC", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_ADC, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MODCLK DAC", SUN8I_MOD_CLK_ENA,
@@ -515,6 +603,8 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	/* Clock Supplies */
 	SND_SOC_DAPM_SUPPLY("AIF1CLK", SUN8I_SYSCLK_CTL,
 			    SUN8I_SYSCLK_CTL_AIF1CLK_ENA, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("AIF2CLK", SUN8I_SYSCLK_CTL,
+			    SUN8I_SYSCLK_CTL_AIF2CLK_ENA, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("SYSCLK", SUN8I_SYSCLK_CTL,
 			    SUN8I_SYSCLK_CTL_SYSCLK_ENA, 0, NULL, 0),
 };
@@ -527,17 +617,38 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	{ "AIF1 AD0 Left", NULL, "AIF1CLK" },
 	{ "AIF1 AD0 Right", NULL, "AIF1CLK" },
 
+	{ "AIF2 ADC Left", NULL, "AIF2 ADC Left Mixer" },
+	{ "AIF2 ADC Right", NULL, "AIF2 ADC Right Mixer" },
+
+	{ "AIF2 ADC Left", NULL, "AIF2CLK" },
+	{ "AIF2 ADC Right", NULL, "AIF2CLK" },
+
 	/* AIF "ADC" Mixer Routes */
 	{ "AIF1 AD0 Left Mixer", "AIF1 AD0 Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Left" },
+	{ "AIF1 AD0 Left Mixer", "AIF1 AD0 Mixer AIF2 DAC Capture Switch", "AIF2 DAC Left" },
 	{ "AIF1 AD0 Left Mixer", "AIF1 AD0 Mixer ADC Capture Switch", "ADC Left" },
+	{ "AIF1 AD0 Left Mixer", "AIF1 AD0 Mixer AIF2 DAC Rev Capture Switch", "AIF2 DAC Right" },
 
 	{ "AIF1 AD0 Right Mixer", "AIF1 AD0 Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Right" },
+	{ "AIF1 AD0 Right Mixer", "AIF1 AD0 Mixer AIF2 DAC Capture Switch", "AIF2 DAC Right" },
 	{ "AIF1 AD0 Right Mixer", "AIF1 AD0 Mixer ADC Capture Switch", "ADC Right" },
+	{ "AIF1 AD0 Right Mixer", "AIF1 AD0 Mixer AIF2 DAC Rev Capture Switch", "AIF2 DAC Left" },
+
+	{ "AIF2 ADC Left Mixer", "AIF2 ADC Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Left" },
+	{ "AIF2 ADC Left Mixer", "AIF2 ADC Mixer AIF2 DAC Rev Capture Switch", "AIF2 DAC Right" },
+	{ "AIF2 ADC Left Mixer", "AIF2 ADC Mixer ADC Capture Switch", "ADC Left" },
+
+	{ "AIF2 ADC Right Mixer", "AIF2 ADC Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Right" },
+	{ "AIF2 ADC Right Mixer", "AIF2 ADC Mixer AIF2 DAC Rev Capture Switch", "AIF2 DAC Left" },
+	{ "AIF2 ADC Right Mixer", "AIF2 ADC Mixer ADC Capture Switch", "ADC Right" },
 
 	/* AIF "DAC" Input Routes */
 	{ "AIF1 DA0 Left", NULL, "AIF1CLK" },
 	{ "AIF1 DA0 Right", NULL, "AIF1CLK" },
 
+	{ "AIF2 DAC Left", NULL, "AIF2CLK" },
+	{ "AIF2 DAC Right", NULL, "AIF2CLK" },
+
 	/* Main DAC Output Routes */
 	{ "DAC Left", NULL, "DAC Left Mixer" },
 	{ "DAC Right", NULL, "DAC Right Mixer" },
@@ -547,9 +658,11 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 
 	/* Main DAC Mixer Routes */
 	{ "DAC Left Mixer", "DAC Mixer AIF1 DA0 Playback Switch", "AIF1 DA0 Left" },
+	{ "DAC Left Mixer", "DAC Mixer AIF2 DAC Playback Switch", "AIF2 DAC Left" },
 	{ "DAC Left Mixer", "DAC Mixer ADC Playback Switch", "ADC Left" },
 
 	{ "DAC Right Mixer", "DAC Mixer AIF1 DA0 Playback Switch", "AIF1 DA0 Right" },
+	{ "DAC Right Mixer", "DAC Mixer AIF2 DAC Playback Switch", "AIF2 DAC Right" },
 	{ "DAC Right Mixer", "DAC Mixer ADC Playback Switch", "ADC Right" },
 
 	/* Main ADC Input Routes */
@@ -562,16 +675,23 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	{ "AIF1 DA0 Left", NULL, "RST AIF1" },
 	{ "AIF1 DA0 Right", NULL, "RST AIF1" },
 
+	{ "AIF2 ADC Left", NULL, "RST AIF2" },
+	{ "AIF2 ADC Right", NULL, "RST AIF2" },
+	{ "AIF2 DAC Left", NULL, "RST AIF2" },
+	{ "AIF2 DAC Right", NULL, "RST AIF2" },
+
 	{ "ADC", NULL, "RST ADC" },
 	{ "DAC", NULL, "RST DAC" },
 
 	/* Module Reset Routes */
 	{ "RST AIF1", NULL, "MODCLK AIF1" },
+	{ "RST AIF2", NULL, "MODCLK AIF2" },
 	{ "RST ADC", NULL, "MODCLK ADC" },
 	{ "RST DAC", NULL, "MODCLK DAC" },
 
 	/* Module Clock Routes */
 	{ "MODCLK AIF1", NULL, "SYSCLK" },
+	{ "MODCLK AIF2", NULL, "SYSCLK" },
 	{ "MODCLK ADC", NULL, "SYSCLK" },
 	{ "MODCLK DAC", NULL, "SYSCLK" },
 
@@ -588,6 +708,11 @@ static int sun8i_codec_component_probe(struct snd_soc_component *component)
 			   SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK,
 			   SUN8I_SYSCLK_CTL_AIF1CLK_SRC_PLL);
 
+	/* Set AIF2CLK clock source to PLL */
+	regmap_update_bits(scodec->regmap, SUN8I_SYSCLK_CTL,
+			   SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK,
+			   SUN8I_SYSCLK_CTL_AIF2CLK_SRC_PLL);
+
 	/* Set SYSCLK clock source to AIF1CLK */
 	regmap_update_bits(scodec->regmap, SUN8I_SYSCLK_CTL,
 			   BIT(SUN8I_SYSCLK_CTL_SYSCLK_SRC),
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
