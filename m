Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 484FF160B59
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:00:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9D0F16B9;
	Mon, 17 Feb 2020 07:59:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9D0F16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922841;
	bh=czAMXQZ09iGN1O1eF0f9BNUuciFzh20QJOqHGTNoFLU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dEbJ9kcgYO9gALE/2GiEdUa83OT/TGObiBdj66IO59J9x17BzPfl+jyi9j44YAWhf
	 p0dUqF/E2n8RsTe8AegUQlzib2UO0+UTOP+oFsBWZkCHf0kO2rxGtDoRE+SAAAAKSr
	 tofgeMtBj885aSx4VVKZ8KOH35eOqrCUXyyXgJAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0520F80392;
	Mon, 17 Feb 2020 07:44:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB293F80317; Mon, 17 Feb 2020 07:43:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA8B1F802A8
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA8B1F802A8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="YT+1gxF3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YH02rwZU"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id CA305556C;
 Mon, 17 Feb 2020 01:43:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pYU9YfFukonCc
 k11TA95UKeSPmk8o0GDgEu+qK2BUJ8=; b=YT+1gxF3geFrQobbnBnbPt0siMm2v
 rCOzx/uwPOBm+IIcxgzJ1yeJF0c/OtMr5hZadmfbLB6tRmCp6rUEHQn1E06l788t
 T6Ow456Su09p2h3JDZkHWBJTb/3m+NBrbywPL6V3TMXyE7hsBnhGWy+aMLrInd26
 vO9mntRs/HQVcwGHJXBj4OXt7JeNhoteITr1pSGv69QU8LutZGvjc1in52svsMlz
 rSHVfpRjgA9fAEXlE3FrAp4HYbnJAZfvfbZVlA8DJRbR51iW+xdYTENabUghww4S
 4x3SHxHGaXAfSS/3GsyoXlyJrxjlJ/luhpe9QaNnzuYhBM5uBrpOYnM7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=pYU9YfFukonCck11TA95UKeSPmk8o0GDgEu+qK2BUJ8=; b=YH02rwZU
 +zfHwecIPM+swv7llhPdXyN6uehcpqx6Y6nPd848axeB2te+ZhSaZvU8TfeIgxYX
 5mz2BG7W+vizWo84EoCCdTAP2wfW35EfNSh6dunl4uxVlFylmwtjSi93/q2CXcIl
 KUxssCmglRpMvU8V99nJBhlkHtS4C82TVLtcryq0URDkL/v2yO6hCBAqzPAEU3jk
 2/GB9rk9ufnzbNDftVmtgpZZnA5mueiND9TI//Df07uxVNx25qUdoYNIOWGa0u3q
 t9cz13Y0Gw0dA1D5kJo9NadsBykfBzz3yZEVlUxim1TB144jzewQ4AVqIzQVZLso
 LUToqMljtdlTqg==
X-ME-Sender: <xms:-zVKXuA5m2oJHIaqUuRKXG0X4K07mHuvCNusbhYVog5RPuWZTxSY5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedujeenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:-zVKXmuXxe651xEnjDavQU2iyg2X02TBSwiYYmBr88YPzxeOzwKWbA>
 <xmx:-zVKXn5_PcO2ItLlsv2mU-Md2c3P9lRJFdFA4dBv8iDeUBA-MsrwTw>
 <xmx:-zVKXgpCQxEOuONHDH5CglmYOZKCty_v3qmjO8ebqWTSxdQu7KiOJg>
 <xmx:-zVKXuvF6HhOzemMQdCVPErAH0UV1oxKj1LNdWQLLf9__80r9zYIPA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27F223280059;
 Mon, 17 Feb 2020 01:43:07 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:43 -0600
Message-Id: <20200217064250.15516-28-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 27/34] ASoC: sun8i-codec: Add AIF
	mono/stereo controls
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

This allows changing the channel mapping for each digital input/output.
This is useful when the DAI (or the device on the other end of the link)
supports a different number of channels than are desired for routing,
for example when using an I2S-format DAI link with a mono endpoint.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 160 +++++++++++++++++++++++++++++++---
 1 file changed, 146 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 71c4c1f47201..fdb9bf346cc2 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -56,9 +56,13 @@
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
@@ -71,9 +75,13 @@
 #define SUN8I_AIF2_ADCDAT_CTRL				0x084
 #define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_ENA		15
 #define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_ENA		14
+#define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_SRC		10
+#define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_SRC		8
 #define SUN8I_AIF2_DACDAT_CTRL				0x088
 #define SUN8I_AIF2_DACDAT_CTRL_AIF2_DACL_ENA		15
 #define SUN8I_AIF2_DACDAT_CTRL_AIF2_DACR_ENA		14
+#define SUN8I_AIF2_DACDAT_CTRL_AIF2_DACL_SRC		10
+#define SUN8I_AIF2_DACDAT_CTRL_AIF2_DACR_SRC		8
 #define SUN8I_AIF2_MXR_SRC				0x08c
 #define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA0L	15
 #define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA1L	14
@@ -511,6 +519,50 @@ static struct snd_soc_dai_driver sun8i_codec_dais[] = {
 	},
 };
 
+static const char *const sun8i_aif_stereo_mux_enum_names[] = {
+	"Stereo", "Reverse Stereo", "Sum Mono", "Mix Mono"
+};
+
+static SOC_ENUM_DOUBLE_DECL(sun8i_aif1_ad0_stereo_mux_enum,
+			    SUN8I_AIF1_ADCDAT_CTRL,
+			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_SRC,
+			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_SRC,
+			    sun8i_aif_stereo_mux_enum_names);
+
+static const struct snd_kcontrol_new sun8i_aif1_ad0_stereo_mux_control =
+	SOC_DAPM_ENUM("AIF1 AD0 Stereo Capture Route",
+		      sun8i_aif1_ad0_stereo_mux_enum);
+
+static SOC_ENUM_DOUBLE_DECL(sun8i_aif1_da0_stereo_mux_enum,
+			    SUN8I_AIF1_DACDAT_CTRL,
+			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_SRC,
+			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_SRC,
+			    sun8i_aif_stereo_mux_enum_names);
+
+static const struct snd_kcontrol_new sun8i_aif1_da0_stereo_mux_control =
+	SOC_DAPM_ENUM("AIF1 DA0 Stereo Playback Route",
+		      sun8i_aif1_da0_stereo_mux_enum);
+
+static SOC_ENUM_DOUBLE_DECL(sun8i_aif2_adc_stereo_mux_enum,
+			    SUN8I_AIF2_ADCDAT_CTRL,
+			    SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_SRC,
+			    SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_SRC,
+			    sun8i_aif_stereo_mux_enum_names);
+
+static const struct snd_kcontrol_new sun8i_aif2_adc_stereo_mux_control =
+	SOC_DAPM_ENUM("AIF2 ADC Stereo Capture Route",
+		      sun8i_aif2_adc_stereo_mux_enum);
+
+static SOC_ENUM_DOUBLE_DECL(sun8i_aif2_dac_stereo_mux_enum,
+			    SUN8I_AIF2_DACDAT_CTRL,
+			    SUN8I_AIF2_DACDAT_CTRL_AIF2_DACL_SRC,
+			    SUN8I_AIF2_DACDAT_CTRL_AIF2_DACR_SRC,
+			    sun8i_aif_stereo_mux_enum_names);
+
+static const struct snd_kcontrol_new sun8i_aif2_dac_stereo_mux_control =
+	SOC_DAPM_ENUM("AIF2 DAC Stereo Playback Route",
+		      sun8i_aif2_dac_stereo_mux_enum);
+
 static const char *const sun8i_aif3_mux_enum_names[] = {
 	"None", "AIF2 Left", "AIF2 Right"
 };
@@ -609,6 +661,17 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("AIF3 ADC", "AIF3 Capture", 0,
 			     SND_SOC_NOPM, 0, 0),
 
+	/* AIF "ADC" Mono/Stereo Muxes */
+	SND_SOC_DAPM_MUX("AIF1 AD0 Left Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif1_ad0_stereo_mux_control),
+	SND_SOC_DAPM_MUX("AIF1 AD0 Right Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif1_ad0_stereo_mux_control),
+
+	SND_SOC_DAPM_MUX("AIF2 ADC Left Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif2_adc_stereo_mux_control),
+	SND_SOC_DAPM_MUX("AIF2 ADC Right Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif2_adc_stereo_mux_control),
+
 	/* AIF "ADC" Muxes */
 	SND_SOC_DAPM_MUX("AIF3 ADC Capture Route", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif3_adc_mux_control),
@@ -630,6 +693,17 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("AIF2 DAC Right Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif2_dac_mux_control),
 
+	/* AIF "DAC" Mono/Stereo Muxes */
+	SND_SOC_DAPM_MUX("AIF1 DA0 Left Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif1_da0_stereo_mux_control),
+	SND_SOC_DAPM_MUX("AIF1 DA0 Right Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif1_da0_stereo_mux_control),
+
+	SND_SOC_DAPM_MUX("AIF2 DAC Left Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif2_dac_stereo_mux_control),
+	SND_SOC_DAPM_MUX("AIF2 DAC Right Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif2_dac_stereo_mux_control),
+
 	/* AIF "DAC" Inputs */
 	SND_SOC_DAPM_AIF_IN("AIF1 DA0 Left", "AIF1 Playback", 0,
 			    SUN8I_AIF1_DACDAT_CTRL,
@@ -703,52 +777,110 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 
 static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	/* AIF "ADC" Output Routes */
-	{ "AIF1 AD0 Left", NULL, "AIF1 AD0 Left Mixer" },
-	{ "AIF1 AD0 Right", NULL, "AIF1 AD0 Right Mixer" },
+	{ "AIF1 AD0 Left", NULL, "AIF1 AD0 Left Stereo Mux" },
+	{ "AIF1 AD0 Right", NULL, "AIF1 AD0 Right Stereo Mux" },
 
 	{ "AIF1 AD0 Left", NULL, "AIF1CLK" },
 	{ "AIF1 AD0 Right", NULL, "AIF1CLK" },
 
-	{ "AIF2 ADC Left", NULL, "AIF2 ADC Left Mixer" },
-	{ "AIF2 ADC Right", NULL, "AIF2 ADC Right Mixer" },
+	{ "AIF2 ADC Left", NULL, "AIF2 ADC Left Stereo Mux" },
+	{ "AIF2 ADC Right", NULL, "AIF2 ADC Right Stereo Mux" },
 
 	{ "AIF2 ADC Left", NULL, "AIF2CLK" },
 	{ "AIF2 ADC Right", NULL, "AIF2CLK" },
 
 	{ "AIF3 ADC", NULL, "AIF3 ADC Capture Route" },
 
+	/* AIF "ADC" Mono/Stereo Mux Routes */
+	{ "AIF1 AD0 Left Stereo Mux", "Stereo", "AIF1 AD0 Left Mixer" },
+	{ "AIF1 AD0 Left Stereo Mux", "Reverse Stereo", "AIF1 AD0 Right Mixer" },
+	{ "AIF1 AD0 Left Stereo Mux", "Sum Mono", "AIF1 AD0 Left Mixer" },
+	{ "AIF1 AD0 Left Stereo Mux", "Sum Mono", "AIF1 AD0 Right Mixer" },
+	{ "AIF1 AD0 Left Stereo Mux", "Mix Mono", "AIF1 AD0 Left Mixer" },
+	{ "AIF1 AD0 Left Stereo Mux", "Mix Mono", "AIF1 AD0 Right Mixer" },
+
+	{ "AIF1 AD0 Right Stereo Mux", "Stereo", "AIF1 AD0 Right Mixer" },
+	{ "AIF1 AD0 Right Stereo Mux", "Reverse Stereo", "AIF1 AD0 Left Mixer" },
+	{ "AIF1 AD0 Right Stereo Mux", "Sum Mono", "AIF1 AD0 Left Mixer" },
+	{ "AIF1 AD0 Right Stereo Mux", "Sum Mono", "AIF1 AD0 Right Mixer" },
+	{ "AIF1 AD0 Right Stereo Mux", "Mix Mono", "AIF1 AD0 Left Mixer" },
+	{ "AIF1 AD0 Right Stereo Mux", "Mix Mono", "AIF1 AD0 Right Mixer" },
+
+	{ "AIF2 ADC Left Stereo Mux", "Stereo", "AIF2 ADC Left Mixer" },
+	{ "AIF2 ADC Left Stereo Mux", "Reverse Stereo", "AIF2 ADC Right Mixer" },
+	{ "AIF2 ADC Left Stereo Mux", "Sum Mono", "AIF2 ADC Left Mixer" },
+	{ "AIF2 ADC Left Stereo Mux", "Sum Mono", "AIF2 ADC Right Mixer" },
+	{ "AIF2 ADC Left Stereo Mux", "Mix Mono", "AIF2 ADC Left Mixer" },
+	{ "AIF2 ADC Left Stereo Mux", "Mix Mono", "AIF2 ADC Right Mixer" },
+
+	{ "AIF2 ADC Right Stereo Mux", "Stereo", "AIF2 ADC Right Mixer" },
+	{ "AIF2 ADC Right Stereo Mux", "Reverse Stereo", "AIF2 ADC Left Mixer" },
+	{ "AIF2 ADC Right Stereo Mux", "Sum Mono", "AIF2 ADC Left Mixer" },
+	{ "AIF2 ADC Right Stereo Mux", "Sum Mono", "AIF2 ADC Right Mixer" },
+	{ "AIF2 ADC Right Stereo Mux", "Mix Mono", "AIF2 ADC Left Mixer" },
+	{ "AIF2 ADC Right Stereo Mux", "Mix Mono", "AIF2 ADC Right Mixer" },
+
 	/* AIF "ADC" Mux Routes */
 	{ "AIF3 ADC Capture Route", "AIF2 Left", "AIF2 ADC Left Mixer" },
 	{ "AIF3 ADC Capture Route", "AIF2 Right", "AIF2 ADC Right Mixer" },
 
 	/* AIF "ADC" Mixer Routes */
-	{ "AIF1 AD0 Left Mixer", "AIF1 AD0 Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Left" },
+	{ "AIF1 AD0 Left Mixer", "AIF1 AD0 Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Left Stereo Mux" },
 	{ "AIF1 AD0 Left Mixer", "AIF1 AD0 Mixer AIF2 DAC Capture Switch", "AIF2 DAC Left Mux" },
 	{ "AIF1 AD0 Left Mixer", "AIF1 AD0 Mixer ADC Capture Switch", "ADC Left" },
 	{ "AIF1 AD0 Left Mixer", "AIF1 AD0 Mixer AIF2 DAC Rev Capture Switch", "AIF2 DAC Right Mux" },
 
-	{ "AIF1 AD0 Right Mixer", "AIF1 AD0 Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Right" },
+	{ "AIF1 AD0 Right Mixer", "AIF1 AD0 Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Right Stereo Mux" },
 	{ "AIF1 AD0 Right Mixer", "AIF1 AD0 Mixer AIF2 DAC Capture Switch", "AIF2 DAC Right Mux" },
 	{ "AIF1 AD0 Right Mixer", "AIF1 AD0 Mixer ADC Capture Switch", "ADC Right" },
 	{ "AIF1 AD0 Right Mixer", "AIF1 AD0 Mixer AIF2 DAC Rev Capture Switch", "AIF2 DAC Left Mux" },
 
-	{ "AIF2 ADC Left Mixer", "AIF2 ADC Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Left" },
+	{ "AIF2 ADC Left Mixer", "AIF2 ADC Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Left Stereo Mux" },
 	{ "AIF2 ADC Left Mixer", "AIF2 ADC Mixer AIF2 DAC Rev Capture Switch", "AIF2 DAC Right Mux" },
 	{ "AIF2 ADC Left Mixer", "AIF2 ADC Mixer ADC Capture Switch", "ADC Left" },
 
-	{ "AIF2 ADC Right Mixer", "AIF2 ADC Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Right" },
+	{ "AIF2 ADC Right Mixer", "AIF2 ADC Mixer AIF1 DA0 Capture Switch", "AIF1 DA0 Right Stereo Mux" },
 	{ "AIF2 ADC Right Mixer", "AIF2 ADC Mixer AIF2 DAC Rev Capture Switch", "AIF2 DAC Left Mux" },
 	{ "AIF2 ADC Right Mixer", "AIF2 ADC Mixer ADC Capture Switch", "ADC Right" },
 
 	/* AIF "DAC" Mux Routes */
-	{ "AIF2 DAC Left Mux", "None", "AIF2 DAC Left" },
+	{ "AIF2 DAC Left Mux", "None", "AIF2 DAC Left Stereo Mux" },
 	{ "AIF2 DAC Left Mux", "AIF2 Left", "AIF3 DAC" },
-	{ "AIF2 DAC Left Mux", "AIF2 Right", "AIF2 DAC Left" },
+	{ "AIF2 DAC Left Mux", "AIF2 Right", "AIF2 DAC Left Stereo Mux" },
 
-	{ "AIF2 DAC Right Mux", "None", "AIF2 DAC Right" },
-	{ "AIF2 DAC Right Mux", "AIF2 Left", "AIF2 DAC Right" },
+	{ "AIF2 DAC Right Mux", "None", "AIF2 DAC Right Stereo Mux" },
+	{ "AIF2 DAC Right Mux", "AIF2 Left", "AIF2 DAC Right Stereo Mux" },
 	{ "AIF2 DAC Right Mux", "AIF2 Right", "AIF3 DAC" },
 
+	/* AIF "DAC" Mono/Stereo Mux Routes */
+	{ "AIF1 DA0 Left Stereo Mux", "Stereo", "AIF1 DA0 Left" },
+	{ "AIF1 DA0 Left Stereo Mux", "Reverse Stereo", "AIF1 DA0 Right" },
+	{ "AIF1 DA0 Left Stereo Mux", "Sum Mono", "AIF1 DA0 Left" },
+	{ "AIF1 DA0 Left Stereo Mux", "Sum Mono", "AIF1 DA0 Right" },
+	{ "AIF1 DA0 Left Stereo Mux", "Mix Mono", "AIF1 DA0 Left" },
+	{ "AIF1 DA0 Left Stereo Mux", "Mix Mono", "AIF1 DA0 Right" },
+
+	{ "AIF1 DA0 Right Stereo Mux", "Stereo", "AIF1 DA0 Right" },
+	{ "AIF1 DA0 Right Stereo Mux", "Reverse Stereo", "AIF1 DA0 Left" },
+	{ "AIF1 DA0 Right Stereo Mux", "Sum Mono", "AIF1 DA0 Left" },
+	{ "AIF1 DA0 Right Stereo Mux", "Sum Mono", "AIF1 DA0 Right" },
+	{ "AIF1 DA0 Right Stereo Mux", "Mix Mono", "AIF1 DA0 Left" },
+	{ "AIF1 DA0 Right Stereo Mux", "Mix Mono", "AIF1 DA0 Right" },
+
+	{ "AIF2 DAC Left Stereo Mux", "Stereo", "AIF2 DAC Left" },
+	{ "AIF2 DAC Left Stereo Mux", "Reverse Stereo", "AIF2 DAC Right" },
+	{ "AIF2 DAC Left Stereo Mux", "Sum Mono", "AIF2 DAC Left" },
+	{ "AIF2 DAC Left Stereo Mux", "Sum Mono", "AIF2 DAC Right" },
+	{ "AIF2 DAC Left Stereo Mux", "Mix Mono", "AIF2 DAC Left" },
+	{ "AIF2 DAC Left Stereo Mux", "Mix Mono", "AIF2 DAC Right" },
+
+	{ "AIF2 DAC Right Stereo Mux", "Stereo", "AIF2 DAC Right" },
+	{ "AIF2 DAC Right Stereo Mux", "Reverse Stereo", "AIF2 DAC Left" },
+	{ "AIF2 DAC Right Stereo Mux", "Sum Mono", "AIF2 DAC Left" },
+	{ "AIF2 DAC Right Stereo Mux", "Sum Mono", "AIF2 DAC Right" },
+	{ "AIF2 DAC Right Stereo Mux", "Mix Mono", "AIF2 DAC Left" },
+	{ "AIF2 DAC Right Stereo Mux", "Mix Mono", "AIF2 DAC Right" },
+
 	/* AIF "DAC" Input Routes */
 	{ "AIF1 DA0 Left", NULL, "AIF1CLK" },
 	{ "AIF1 DA0 Right", NULL, "AIF1CLK" },
@@ -764,11 +896,11 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	{ "DAC Right", NULL, "DAC" },
 
 	/* Main DAC Mixer Routes */
-	{ "DAC Left Mixer", "DAC Mixer AIF1 DA0 Playback Switch", "AIF1 DA0 Left" },
+	{ "DAC Left Mixer", "DAC Mixer AIF1 DA0 Playback Switch", "AIF1 DA0 Left Stereo Mux" },
 	{ "DAC Left Mixer", "DAC Mixer AIF2 DAC Playback Switch", "AIF2 DAC Left Mux" },
 	{ "DAC Left Mixer", "DAC Mixer ADC Playback Switch", "ADC Left" },
 
-	{ "DAC Right Mixer", "DAC Mixer AIF1 DA0 Playback Switch", "AIF1 DA0 Right" },
+	{ "DAC Right Mixer", "DAC Mixer AIF1 DA0 Playback Switch", "AIF1 DA0 Right Stereo Mux" },
 	{ "DAC Right Mixer", "DAC Mixer AIF2 DAC Playback Switch", "AIF2 DAC Right Mux" },
 	{ "DAC Right Mixer", "DAC Mixer ADC Playback Switch", "ADC Right" },
 
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
