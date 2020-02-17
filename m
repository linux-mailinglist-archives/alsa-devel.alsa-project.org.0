Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8653D160B41
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:57:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F64916BD;
	Mon, 17 Feb 2020 07:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F64916BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922622;
	bh=dREvPRmoA3hXIluxVcK3/1LeT/B3MwrRyIbNwYtPhwE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NNToUAX9RPS1Ugvmv40pBGIWtPgOYeMGkPZK+Bz9cHU6XyJ6y+hG4UzqUEmaKdjOh
	 smWz2pgL6+0ncYez5Ngz0oHiQm4KThETraXuPe4zsYSDG5+e56X11K34ZuqiC1aIqY
	 Jqwh85v4pGE9B49JmPj/6Q1mfD8jwFZ9qGHhx1yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DD10F80351;
	Mon, 17 Feb 2020 07:44:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B09CF8028F; Mon, 17 Feb 2020 07:43:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9E6CF801F4
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E6CF801F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="gfcAKqPH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="0d10K7zW"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id CCF19552C;
 Mon, 17 Feb 2020 01:43:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=DBdByb7xpH/PX
 xP1Vq/SOFf147fSI39LL4w1DRyW60M=; b=gfcAKqPHI/PCNWUOJLTb4aqKLiziN
 RbVe9b+TOHRmARy8fjMcWTPclAQQRrFPTizZkrsi2UjJaaYhOBZw3b7V+MtM4KEJ
 J9G3/7EpOaiBwNr1N7vntPEt3nXmwYX+pIX2rS4gh4kEJtR3NTySnGAvJHRIEvxR
 B80hlPS69ieN/W/abS8kMt/xHbWofoVjmiE8bB0NqO3C56d1EKt9UD5FR4wmAD8n
 F0D5wBu2wryiM1PT1xm1pAWaSkjEKe2ZKQxbvz0c8suQ1bK2mEs3WE6SRnQ3lm+S
 oFuuSWVWISMhLQUt3pqAKxmJ5gIxaQpomna11o8AhhTQSkVmRqUNLKHGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=DBdByb7xpH/PXxP1Vq/SOFf147fSI39LL4w1DRyW60M=; b=0d10K7zW
 IyrE4ZaBnbYuf++JeGo1aWD2p+4S0ZrtikqBgn9XrRBrL6prMOq9N77o4k6wQfqG
 OTxrBtOYe9lx+58W8qO0e4eyNCSn9iHyF0GiI4BjqT8OWkZkXlB/G2qu636vyEpi
 9SBDld6S+rTJGhNGCGUkziFGyO8MCUziAPPvR+1vHDl+LHewvhu2+14RP8vSL3nk
 kH8EVxfciAbjsXIi1mRkF01koK0JEki6eWvioB/IdaFQ+fX5oURrkYa923vukO+M
 vkRvkyE24s68W/oj8rfra+LyLWWIpaQDKJIsU1VSCpi6f1vBQx3ksQoFtHyPf+8I
 d8zlENB1a5a86A==
X-ME-Sender: <xms:-DVKXv6ebhxOmcinyiXb6ejtOG_lPYUeYqyjZh2xxtRSBg34cBfTmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedujeenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:-DVKXu9YdFOWN83IahKDNl6kKKYUrGbXLiiAumicc5nG-x3RusSnHg>
 <xmx:-DVKXlizALPX0isjQOZRM0kWxZbOle_-ShXZH_nuqs9PJMWi4GP-gg>
 <xmx:-DVKXoTf-DJ0peZMTokfm2IL7J4q4e_RCuSeZtUzXEpzMKNR4dK5gw>
 <xmx:-DVKXiYFytttnwEMOw7v79ErpTSV8JEU_-pg5IybOmfEJQBPKMx8XQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1A9353280064;
 Mon, 17 Feb 2020 01:43:04 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:38 -0600
Message-Id: <20200217064250.15516-23-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 22/34] ASoC: sun8i-codec: Clean up AIF1
	Slot 0 widgets
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

The driver currently confuses AIF1 AD0 with the ADC. They are
independent. The ADC can be used without AIF1, and AIF1 AD0 can pull
audio from other sources, such as AIF1 DA0 and AIF2. There is no mixer
associated with the main ADC; the mixers are associated with an output,
in this case AIF1 AD0.

This commit renames the AIF1 Slot 0 widgets and routes to match their
actual usage, and sorts them in a topological sink<-source ordering.

Because each of the inputs is sent to multiple mixers, the controls must
be renamed to include both the input name and the mixer name.

It also sets the correct channel for the AIF inputs/outputs, so that the
minimal number of DAPM widgets are turned on for mono routing.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 80 ++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 0561d8d2e941..6f589e93850a 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -401,41 +401,48 @@ static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
 			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR, 1, 0),
 };
 
-static const struct snd_kcontrol_new sun8i_input_mixer_controls[] = {
-	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital ADC Capture Switch",
+static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
+	SOC_DAPM_DOUBLE("AIF1 AD0 Mixer AIF1 DA0 Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF1DA0L,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF1DA0R, 1, 0),
-	SOC_DAPM_DOUBLE("AIF2 Digital ADC Capture Switch", SUN8I_AIF1_MXR_SRC,
+	SOC_DAPM_DOUBLE("AIF1 AD0 Mixer AIF2 DAC Capture Switch",
+			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACL,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACR, 1, 0),
-	SOC_DAPM_DOUBLE("AIF1 Data Digital ADC Capture Switch",
+	SOC_DAPM_DOUBLE("AIF1 AD0 Mixer ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_ADCL,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR, 1, 0),
-	SOC_DAPM_DOUBLE("AIF2 Inv Digital ADC Capture Switch",
+	SOC_DAPM_DOUBLE("AIF1 AD0 Mixer AIF2 DAC Rev Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACR,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL, 1, 0),
 };
 
 static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
-	/* Analog DAC AIF */
-	SND_SOC_DAPM_AIF_IN("AIF1 Slot 0 Left", "Playback", 0,
-			    SUN8I_AIF1_DACDAT_CTRL,
-			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA, 0),
-	SND_SOC_DAPM_AIF_IN("AIF1 Slot 0 Right", "Playback", 0,
-			    SUN8I_AIF1_DACDAT_CTRL,
-			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA, 0),
-
-	/* Analog ADC AIF */
-	SND_SOC_DAPM_AIF_OUT("AIF1 Slot 0 Left ADC", "Capture", 0,
+	/* AIF "ADC" Outputs */
+	SND_SOC_DAPM_AIF_OUT("AIF1 AD0 Left", "Capture", 0,
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0),
-	SND_SOC_DAPM_AIF_OUT("AIF1 Slot 0 Right ADC", "Capture", 0,
+	SND_SOC_DAPM_AIF_OUT("AIF1 AD0 Right", "Capture", 1,
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
 
+	/* AIF "ADC" Mixers */
+	SOC_MIXER_ARRAY("AIF1 AD0 Left Mixer", SND_SOC_NOPM, 0, 0,
+			sun8i_aif1_ad0_mixer_controls),
+	SOC_MIXER_ARRAY("AIF1 AD0 Right Mixer", SND_SOC_NOPM, 0, 0,
+			sun8i_aif1_ad0_mixer_controls),
+
+	/* AIF "DAC" Inputs */
+	SND_SOC_DAPM_AIF_IN("AIF1 DA0 Left", "Playback", 0,
+			    SUN8I_AIF1_DACDAT_CTRL,
+			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA, 0),
+	SND_SOC_DAPM_AIF_IN("AIF1 DA0 Right", "Playback", 1,
+			    SUN8I_AIF1_DACDAT_CTRL,
+			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA, 0),
+
 	/* Main DAC Outputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_PGA("DAC Left", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("DAC Right", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -448,10 +455,6 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 			sun8i_dac_mixer_controls),
 	SOC_MIXER_ARRAY("Right Digital DAC Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_dac_mixer_controls),
-	SOC_MIXER_ARRAY("Left Digital ADC Mixer", SND_SOC_NOPM, 0, 0,
-			sun8i_input_mixer_controls),
-	SOC_MIXER_ARRAY("Right Digital ADC Mixer", SND_SOC_NOPM, 0, 0,
-			sun8i_input_mixer_controls),
 
 	/* Main ADC Inputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_PGA("ADC Left", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -485,15 +488,22 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 
 static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	/* AIF "ADC" Output Routes */
-	{ "AIF1 Slot 0 Left ADC", NULL, "Left Digital ADC Mixer" },
-	{ "AIF1 Slot 0 Right ADC", NULL, "Right Digital ADC Mixer" },
+	{ "AIF1 AD0 Left", NULL, "AIF1 AD0 Left Mixer" },
+	{ "AIF1 AD0 Right", NULL, "AIF1 AD0 Right Mixer" },
 
-	{ "AIF1 Slot 0 Left ADC", NULL, "AIF1CLK" },
-	{ "AIF1 Slot 0 Right ADC", NULL, "AIF1CLK" },
+	{ "AIF1 AD0 Left", NULL, "AIF1CLK" },
+	{ "AIF1 AD0 Right", NULL, "AIF1CLK" },
+
+	/* AIF "ADC" Mixer Routes */
+	{ "AIF1 AD0 Left Mixer", "AIF1 AD0 Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Left" },
+	{ "AIF1 AD0 Left Mixer", "AIF1 AD0 Mixer ADC Capture Switch", "ADC Left" },
+
+	{ "AIF1 AD0 Right Mixer", "AIF1 AD0 Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Right" },
+	{ "AIF1 AD0 Right Mixer", "AIF1 AD0 Mixer ADC Capture Switch", "ADC Right" },
 
 	/* AIF "DAC" Input Routes */
-	{ "AIF1 Slot 0 Left", NULL, "AIF1CLK" },
-	{ "AIF1 Slot 0 Right", NULL, "AIF1CLK" },
+	{ "AIF1 DA0 Left", NULL, "AIF1CLK" },
+	{ "AIF1 DA0 Right", NULL, "AIF1CLK" },
 
 	/* DAC Routes */
 	{ "DAC Left", NULL, "Left Digital DAC Mixer" },
@@ -504,25 +514,19 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 
 	/* DAC Mixer Routes */
 	{ "Left Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch",
-	  "AIF1 Slot 0 Left"},
+	  "AIF1 DA0 Left"},
 	{ "Right Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch",
-	  "AIF1 Slot 0 Right"},
+	  "AIF1 DA0 Right"},
 
 	/* ADC Routes */
 	{ "ADC Left", NULL, "ADC" },
 	{ "ADC Right", NULL, "ADC" },
 
-	/* ADC Mixer Routes */
-	{ "Left Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch",
-	  "ADC Left" },
-	{ "Right Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch",
-	  "ADC Right" },
-
 	/* Module Supply Routes */
-	{ "AIF1 Slot 0 Left ADC", NULL, "RST AIF1" },
-	{ "AIF1 Slot 0 Right ADC", NULL, "RST AIF1" },
-	{ "AIF1 Slot 0 Left", NULL, "RST AIF1" },
-	{ "AIF1 Slot 0 Right", NULL, "RST AIF1" },
+	{ "AIF1 AD0 Left", NULL, "RST AIF1" },
+	{ "AIF1 AD0 Right", NULL, "RST AIF1" },
+	{ "AIF1 DA0 Left", NULL, "RST AIF1" },
+	{ "AIF1 DA0 Right", NULL, "RST AIF1" },
 
 	{ "ADC", NULL, "RST ADC" },
 	{ "DAC", NULL, "RST DAC" },
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
