Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FD6160B4D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:57:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCD4E16B9;
	Mon, 17 Feb 2020 07:56:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCD4E16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922658;
	bh=MoloUGSxq45SHvFynfb9e9rFil+Mq5AqKpPtO2ZwDsc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iBxbdWib/lswqw80oBitNSPbL+bkX7kc8ITSzq3M9TC+ShsQymfEfDUoRbg1F0O8e
	 QbXoK9PyZlmrF30Zy9zqo4z8ODKcCSZJRykoYNbtHV5wMJFaDsT6u9BtuEKSuz85BN
	 t97DPDF+hPeNZ4x6cf3q1BpTUXzbrCnwmbKBKFZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1B77F80361;
	Mon, 17 Feb 2020 07:44:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 475E5F802F9; Mon, 17 Feb 2020 07:43:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5686DF80299
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5686DF80299
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="AfJL98fm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vgNuYm5m"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6FF3B5227;
 Mon, 17 Feb 2020 01:43:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=A623uF+Zt8pd+
 G8X0YQI2ZXWxoaPlRIPweAQu1VTmF4=; b=AfJL98fmlBMsUO0xr3bKrgdjg8THH
 BUyrd93/WewF+Y3SWMZjtB4AzlVR5+AOzODyEk8dV0Mz4irKH7jQ/787PRtwC//n
 Vcz27XhwINWrQS3JLmCJBlz/m1A2kOPOFIEMM3A01ljOIOEvj26Hm2lmWsm8YVG7
 pakdbUyChiVJJEoFRspvXo0ujYwiqbhI+ksASX6a/tnM/f8bT22Ul4kJDGF8DAzL
 53lCGC13TO02rkVLfmmHR+0EDwIdTcKkkGh5cr4dwkgS0aTeOOAj9FSF5c0tNxnc
 9UBnwu3MgcJp1PhoyNYYRMOCHW2fGWcYh2fHFHQ6WjLSgEVTLdMayDXUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=A623uF+Zt8pd+G8X0YQI2ZXWxoaPlRIPweAQu1VTmF4=; b=vgNuYm5m
 Pwvo9nJfWJDoXJo51De9m4qV7CGi7DxvfbcfBmedn6MTG1REGLxtUVqAEVsXObFH
 wvEIneKtTGTUwQy3tQ2V1Yk5zq3IC/3YTMjMp5WZSwqWjlEnXtRPtko0CGnMS3sp
 0yy4IdVEk32sRcFPQtUkOsKqlLk2VNUnhCv8A9gwk1TwUUCGHSGLlftMYbgpim5F
 WcBabi1uLx9pg9/bL61awMerJzuXTWKtNLGUygrsVYlweLICPwE3ycO//+MW7nSs
 v4GHrIjT6o8++nLmlw1IYza0iUM9GTQH10miLwNMVcKYRZafq0S0yDogClIB0nHR
 kA+9UYzWXvplEw==
X-ME-Sender: <xms:-TVKXi8h-sRHYAgrftYMp2XLsrxdthQnD_TbHKKV-27QTWYY9LoEnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedujeenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:-TVKXlD_nY7EfLJUG8ylnS7Buiz7Kaz01PlgryqpQ14-ipn8VLEnJQ>
 <xmx:-TVKXmvyOodAbVB69CsS1yxTbn9zqcdHfp4XPIG3PUS8_3tuwQ965A>
 <xmx:-TVKXnZvtkd8M9Jt4JtafxP18KJ7v_mdYqVZjwWrMKKVBafk9kdduQ>
 <xmx:-TVKXq7BuuaaESH1AP8X5WmLu97yhPm-kBV_3ORtgxn7ivTJNkTQEw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id AE9443280059;
 Mon, 17 Feb 2020 01:43:04 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:39 -0600
Message-Id: <20200217064250.15516-24-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 23/34] ASoC: sun8i-codec: Clean up DAC
	widgets
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

Again, rename the widgets and controls to match their actual function
(and disambiguate the mixers), then sort the widgets and routes in a
topological sink<-source ordering.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 61 ++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 6f589e93850a..5dfaf656b5b1 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -384,23 +384,6 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
-	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital DAC Playback Switch",
-			SUN8I_DAC_MXR_SRC,
-			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA0L,
-			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA0R, 1, 0),
-	SOC_DAPM_DOUBLE("AIF1 Slot 1 Digital DAC Playback Switch",
-			SUN8I_DAC_MXR_SRC,
-			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA1L,
-			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA1R, 1, 0),
-	SOC_DAPM_DOUBLE("AIF2 Digital DAC Playback Switch", SUN8I_DAC_MXR_SRC,
-			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF2DACL,
-			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR, 1, 0),
-	SOC_DAPM_DOUBLE("ADC Digital DAC Playback Switch", SUN8I_DAC_MXR_SRC,
-			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_ADCL,
-			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR, 1, 0),
-};
-
 static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("AIF1 AD0 Mixer AIF1 DA0 Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
@@ -420,6 +403,25 @@ static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL, 1, 0),
 };
 
+static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
+	SOC_DAPM_DOUBLE("DAC Mixer AIF1 DA0 Playback Switch",
+			SUN8I_DAC_MXR_SRC,
+			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA0L,
+			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA0R, 1, 0),
+	SOC_DAPM_DOUBLE("DAC Mixer AIF1 DA1 Playback Switch",
+			SUN8I_DAC_MXR_SRC,
+			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA1L,
+			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA1R, 1, 0),
+	SOC_DAPM_DOUBLE("DAC Mixer AIF2 DAC Playback Switch",
+			SUN8I_DAC_MXR_SRC,
+			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF2DACL,
+			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR, 1, 0),
+	SOC_DAPM_DOUBLE("DAC Mixer ADC Playback Switch",
+			SUN8I_DAC_MXR_SRC,
+			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_ADCL,
+			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR, 1, 0),
+};
+
 static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	/* AIF "ADC" Outputs */
 	SND_SOC_DAPM_AIF_OUT("AIF1 AD0 Left", "Capture", 0,
@@ -450,10 +452,10 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("DAC", SUN8I_DAC_DIG_CTRL,
 			    SUN8I_DAC_DIG_CTRL_ENDA, 0, NULL, 0),
 
-	/* DAC and ADC Mixers */
-	SOC_MIXER_ARRAY("Left Digital DAC Mixer", SND_SOC_NOPM, 0, 0,
+	/* Main DAC Mixers */
+	SOC_MIXER_ARRAY("DAC Left Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_dac_mixer_controls),
-	SOC_MIXER_ARRAY("Right Digital DAC Mixer", SND_SOC_NOPM, 0, 0,
+	SOC_MIXER_ARRAY("DAC Right Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_dac_mixer_controls),
 
 	/* Main ADC Inputs (connected to analog codec DAPM context) */
@@ -505,20 +507,21 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	{ "AIF1 DA0 Left", NULL, "AIF1CLK" },
 	{ "AIF1 DA0 Right", NULL, "AIF1CLK" },
 
-	/* DAC Routes */
-	{ "DAC Left", NULL, "Left Digital DAC Mixer" },
-	{ "DAC Right", NULL, "Right Digital DAC Mixer" },
+	/* Main DAC Output Routes */
+	{ "DAC Left", NULL, "DAC Left Mixer" },
+	{ "DAC Right", NULL, "DAC Right Mixer" },
 
 	{ "DAC Left", NULL, "DAC" },
 	{ "DAC Right", NULL, "DAC" },
 
-	/* DAC Mixer Routes */
-	{ "Left Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch",
-	  "AIF1 DA0 Left"},
-	{ "Right Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch",
-	  "AIF1 DA0 Right"},
+	/* Main DAC Mixer Routes */
+	{ "DAC Left Mixer", "DAC Mixer AIF1 DA0 Playback Switch", "AIF1 DA0 Left" },
+	{ "DAC Left Mixer", "DAC Mixer ADC Playback Switch", "ADC Left" },
+
+	{ "DAC Right Mixer", "DAC Mixer AIF1 DA0 Playback Switch", "AIF1 DA0 Right" },
+	{ "DAC Right Mixer", "DAC Mixer ADC Playback Switch", "ADC Right" },
 
-	/* ADC Routes */
+	/* Main ADC Input Routes */
 	{ "ADC Left", NULL, "ADC" },
 	{ "ADC Right", NULL, "ADC" },
 
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
