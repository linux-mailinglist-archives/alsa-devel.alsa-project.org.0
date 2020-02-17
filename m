Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A96C7160B4E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:58:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 530C016A5;
	Mon, 17 Feb 2020 07:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 530C016A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922689;
	bh=PZDvRK0KokP69ON8JUrg9fzjR74dNZdvo0yzrvj1Abw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fg+v1N/wgENXxasNeIROfq1J9VdFsufdypXGvbGTpQ0gLpNEYMeFKmsJ0XZqKKL1+
	 zN6SJZxLaGSqJNoJSoiLIrl4tof0ZWrKaOxE+6VUYoPL18krwjWEUBrJ81yCRh+v4q
	 3kgUq1+t0jDc9+VFKd4H6lGUCtTjmR4lm3wBS6Vk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4F61F80362;
	Mon, 17 Feb 2020 07:44:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85EB8F802FB; Mon, 17 Feb 2020 07:43:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,
 UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BDF1F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BDF1F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="ZdpdafcL"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EVo6bp2p"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 38F7055D3;
 Mon, 17 Feb 2020 01:43:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=8yoXX805b9zsP
 6c+DEUGNPwPSVfxywvRYUAdiRbhh9k=; b=ZdpdafcLWsyWiQayO9SV5VzkvsGpc
 9UjD29c6j8EgAslghI04rpmjXxLjtXNj2M8+dAJUl9CVEyVI95/hQXHRrADuFzAm
 LAvYSkpgNWCj2kEHYB8C3fA72jczb9T3qGas2bd+8jbNIVMT1phAfTqoJ+Mx8Auw
 vHXAeWEgpJvrltCDJkMVoUOWGqgnzHD0MfzjsFKjmRFm8E9z2N7EgTQ/9ySQUYpx
 gry95ZTAd38mGvXvWZmQZujLp/dTrB3IVC6412YUmAfIsJrWVW0OYkQNFj4wR3wo
 joxxE6OcL4YrtLelno4x+y/9tpUn416BZY6K4M4cxKGx0shGCP+A4AWig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8yoXX805b9zsP6c+DEUGNPwPSVfxywvRYUAdiRbhh9k=; b=EVo6bp2p
 VZkUQeD0Qy0uHkppcjvfBarsUAwFBukADnVx6P0VKVO/u6dDHEkGZep7HuAEw4ch
 +u5p+MHju93fidvdX9oxjKt2c1/DiGEflYpHJuFP7dWQz7PcL76n/BdhB1DfC4Aa
 h/v68mTt4qMrG5tiHdGTIpwkJxPGJ7juYQQ7pwOqbjDMb/FSV05rMrJX2uYMadMK
 6KwX/769BPK/sz+WBwrukGS/Y3Zk9FTe8dj+QW/R7LCtulN3plkUYynMKahsYxtt
 Lo/FZyoAdMMp30a4KIkXe0U+3FpHBB2wmFf3BgQO/81arUHrgAACW3l8Gxjvok45
 IhPXABJl0LLaRA==
X-ME-Sender: <xms:-DVKXkkS42iHr0QRxK-nNxvs7k5KdveZQq0yH_4b6IIPHFOANLcekg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedujeenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:-DVKXlX7SZeWmnxDfDVaq-JlBASGEqtBozTMsh-DubaGAxNQQQldww>
 <xmx:-DVKXgQ6UG0kJh-tsfaBIG-6g2n_cscYnkMixX5qoUhwJO7edonoDw>
 <xmx:-DVKXoD-t5_oIdErt9Pr_anTcB8VjkVe6aUyt6CoQZ8f3L83K0SmRg>
 <xmx:-DVKXh0DyaPRFClukCgxCLkxodJf6EODBPbuwXXcfOeCNp9loyjN3A>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A670328005E;
 Mon, 17 Feb 2020 01:43:03 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:37 -0600
Message-Id: <20200217064250.15516-22-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 21/34] ASoC: sun8i-codec: Clean up
	module/clock hierarchy
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

The clock hieriarchy in the codec is:

       MCLK/PLL      MCLK/PLL
          |              |
       AIF1CLK        AIF2CLK
         |    \      /    |
         |     SYSCLK     |
         |       ||       |
         |   MODCLK ***   |
         |       ||       |
         |    RST ****    |
         |   /  /  \  \   |
         AIF1 ADC  DAC AIF2

Currently, this driver makes some design decisions:
 - AIF1CLK/AIF2CLK should always have the PLL as their parent. MCLK may
   not be running, and it has the same PLL as its parent anyway.
 - SYSCLK should always have AIF1CLK as its parent. There is no easy way
   for DAPM to automatically switch clock parents based on which AIFs
   are in use, and AIF1 is most likely to be used. Even in the case
   where only AIF2 is used, the extra power consumption by also running
   AIF1CLK should be minimal.

This commit updates the driver to match the hardware clock hierarchy:
 - Since the clock parent decisions are static, they are configured once
   in the component's probe function. They do not need DAPM widgets.
 - ADC/DAC supplies are moved immediately after the widgets they supply.
 - Module resets are moved before module clocks to maintain topological
   ordering (and they are sorted by bit order within the register).
 - AIF1 module is supplied by both SYSCLK (via MODCLK AIF1) and AIF1CLK.
 - ADC/DAC modules are supplied by SYSCLK only, not MODCLK AIF1.
 - SYSCLK is supplied by AIF1CLK.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 114 ++++++++++++++++++++--------------
 1 file changed, 68 insertions(+), 46 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index b915e62fa005..0561d8d2e941 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -24,10 +24,11 @@
 
 #define SUN8I_SYSCLK_CTL				0x00c
 #define SUN8I_SYSCLK_CTL_AIF1CLK_ENA			11
-#define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_PLL		9
-#define SUN8I_SYSCLK_CTL_AIF1CLK_SRC			8
+#define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_PLL		(0x3 << 8)
 #define SUN8I_SYSCLK_CTL_SYSCLK_ENA			3
 #define SUN8I_SYSCLK_CTL_SYSCLK_SRC			0
+#define SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF1CLK		(0x0 << 0)
+#define SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF2CLK		(0x1 << 0)
 #define SUN8I_MOD_CLK_ENA				0x010
 #define SUN8I_MOD_CLK_ENA_AIF1				15
 #define SUN8I_MOD_CLK_ENA_ADC				3
@@ -78,6 +79,7 @@
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR		9
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR		8
 
+#define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK	GENMASK(9, 8)
 #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
 #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
 #define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
@@ -418,12 +420,6 @@ static const struct snd_kcontrol_new sun8i_input_mixer_controls[] = {
 };
 
 static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
-	/* Digital parts of the DACs and ADC */
-	SND_SOC_DAPM_SUPPLY("DAC", SUN8I_DAC_DIG_CTRL, SUN8I_DAC_DIG_CTRL_ENDA,
-			    0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("ADC", SUN8I_ADC_DIG_CTRL, SUN8I_ADC_DIG_CTRL_ENAD,
-			    0, NULL, 0),
-
 	/* Analog DAC AIF */
 	SND_SOC_DAPM_AIF_IN("AIF1 Slot 0 Left", "Playback", 0,
 			    SUN8I_AIF1_DACDAT_CTRL,
@@ -444,6 +440,9 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_PGA("DAC Left", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("DAC Right", SND_SOC_NOPM, 0, 0, NULL, 0),
 
+	SND_SOC_DAPM_SUPPLY("DAC", SUN8I_DAC_DIG_CTRL,
+			    SUN8I_DAC_DIG_CTRL_ENDA, 0, NULL, 0),
+
 	/* DAC and ADC Mixers */
 	SOC_MIXER_ARRAY("Left Digital DAC Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_dac_mixer_controls),
@@ -458,60 +457,43 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_PGA("ADC Left", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("ADC Right", SND_SOC_NOPM, 0, 0, NULL, 0),
 
-	/* Clocks */
+	SND_SOC_DAPM_SUPPLY("ADC", SUN8I_ADC_DIG_CTRL,
+			    SUN8I_ADC_DIG_CTRL_ENAD, 0, NULL, 0),
+
+	/* Module Resets */
+	SND_SOC_DAPM_SUPPLY("RST AIF1", SUN8I_MOD_RST_CTL,
+			    SUN8I_MOD_RST_CTL_AIF1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("RST ADC", SUN8I_MOD_RST_CTL,
+			    SUN8I_MOD_RST_CTL_ADC, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("RST DAC", SUN8I_MOD_RST_CTL,
+			    SUN8I_MOD_RST_CTL_DAC, 0, NULL, 0),
+
+	/* Module Clocks */
 	SND_SOC_DAPM_SUPPLY("MODCLK AIF1", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_AIF1, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("MODCLK DAC", SUN8I_MOD_CLK_ENA,
-			    SUN8I_MOD_CLK_ENA_DAC, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MODCLK ADC", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_ADC, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("AIF1", SUN8I_SYSCLK_CTL,
+	SND_SOC_DAPM_SUPPLY("MODCLK DAC", SUN8I_MOD_CLK_ENA,
+			    SUN8I_MOD_CLK_ENA_DAC, 0, NULL, 0),
+
+	/* Clock Supplies */
+	SND_SOC_DAPM_SUPPLY("AIF1CLK", SUN8I_SYSCLK_CTL,
 			    SUN8I_SYSCLK_CTL_AIF1CLK_ENA, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("SYSCLK", SUN8I_SYSCLK_CTL,
 			    SUN8I_SYSCLK_CTL_SYSCLK_ENA, 0, NULL, 0),
-
-	SND_SOC_DAPM_SUPPLY("AIF1 PLL", SUN8I_SYSCLK_CTL,
-			    SUN8I_SYSCLK_CTL_AIF1CLK_SRC_PLL, 0, NULL, 0),
-	/* Inversion as 0=AIF1, 1=AIF2 */
-	SND_SOC_DAPM_SUPPLY("SYSCLK AIF1", SUN8I_SYSCLK_CTL,
-			    SUN8I_SYSCLK_CTL_SYSCLK_SRC, 1, NULL, 0),
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
-	/* Clock Routes */
-	{ "AIF1", NULL, "SYSCLK AIF1" },
-	{ "AIF1 PLL", NULL, "AIF1" },
-	{ "RST AIF1", NULL, "AIF1 PLL" },
-	{ "MODCLK AIF1", NULL, "RST AIF1" },
-	{ "DAC", NULL, "MODCLK AIF1" },
-	{ "ADC", NULL, "MODCLK AIF1" },
-
-	{ "RST DAC", NULL, "SYSCLK" },
-	{ "MODCLK DAC", NULL, "RST DAC" },
-	{ "DAC", NULL, "MODCLK DAC" },
-
-	{ "RST ADC", NULL, "SYSCLK" },
-	{ "MODCLK ADC", NULL, "RST ADC" },
-	{ "ADC", NULL, "MODCLK ADC" },
-
 	/* AIF "ADC" Output Routes */
 	{ "AIF1 Slot 0 Left ADC", NULL, "Left Digital ADC Mixer" },
 	{ "AIF1 Slot 0 Right ADC", NULL, "Right Digital ADC Mixer" },
 
-	{ "AIF1 Slot 0 Left ADC", NULL, "MODCLK AIF1" },
-	{ "AIF1 Slot 0 Right ADC", NULL, "MODCLK AIF1" },
+	{ "AIF1 Slot 0 Left ADC", NULL, "AIF1CLK" },
+	{ "AIF1 Slot 0 Right ADC", NULL, "AIF1CLK" },
 
 	/* AIF "DAC" Input Routes */
-	{ "AIF1 Slot 0 Left", NULL, "MODCLK AIF1" },
-	{ "AIF1 Slot 0 Right", NULL, "MODCLK AIF1" },
+	{ "AIF1 Slot 0 Left", NULL, "AIF1CLK" },
+	{ "AIF1 Slot 0 Right", NULL, "AIF1CLK" },
 
 	/* DAC Routes */
 	{ "DAC Left", NULL, "Left Digital DAC Mixer" },
@@ -535,8 +517,47 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	  "ADC Left" },
 	{ "Right Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch",
 	  "ADC Right" },
+
+	/* Module Supply Routes */
+	{ "AIF1 Slot 0 Left ADC", NULL, "RST AIF1" },
+	{ "AIF1 Slot 0 Right ADC", NULL, "RST AIF1" },
+	{ "AIF1 Slot 0 Left", NULL, "RST AIF1" },
+	{ "AIF1 Slot 0 Right", NULL, "RST AIF1" },
+
+	{ "ADC", NULL, "RST ADC" },
+	{ "DAC", NULL, "RST DAC" },
+
+	/* Module Reset Routes */
+	{ "RST AIF1", NULL, "MODCLK AIF1" },
+	{ "RST ADC", NULL, "MODCLK ADC" },
+	{ "RST DAC", NULL, "MODCLK DAC" },
+
+	/* Module Clock Routes */
+	{ "MODCLK AIF1", NULL, "SYSCLK" },
+	{ "MODCLK ADC", NULL, "SYSCLK" },
+	{ "MODCLK DAC", NULL, "SYSCLK" },
+
+	/* Clock Supply Routes */
+	{ "SYSCLK", NULL, "AIF1CLK" },
 };
 
+static int sun8i_codec_component_probe(struct snd_soc_component *component)
+{
+	struct sun8i_codec *scodec = snd_soc_component_get_drvdata(component);
+
+	/* Set AIF1CLK clock source to PLL */
+	regmap_update_bits(scodec->regmap, SUN8I_SYSCLK_CTL,
+			   SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK,
+			   SUN8I_SYSCLK_CTL_AIF1CLK_SRC_PLL);
+
+	/* Set SYSCLK clock source to AIF1CLK */
+	regmap_update_bits(scodec->regmap, SUN8I_SYSCLK_CTL,
+			   BIT(SUN8I_SYSCLK_CTL_SYSCLK_SRC),
+			   SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF1CLK);
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
 	.hw_params = sun8i_codec_hw_params,
 	.set_fmt = sun8i_set_fmt,
@@ -573,6 +594,7 @@ static const struct snd_soc_component_driver sun8i_soc_component = {
 	.num_dapm_widgets	= ARRAY_SIZE(sun8i_codec_dapm_widgets),
 	.dapm_routes		= sun8i_codec_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(sun8i_codec_dapm_routes),
+	.probe			= sun8i_codec_component_probe,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
