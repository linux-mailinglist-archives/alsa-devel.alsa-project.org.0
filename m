Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1093B160B5B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:01:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D0001703;
	Mon, 17 Feb 2020 08:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D0001703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922905;
	bh=H3gD6/ZHq9F+c9lAC+X7csgKEcRKg0KAn52hMtjz1Bw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CWA4Zqp/q80AVpOgY4kr2JVpBUQ0VpZpvCwV0kuVCytWhbjFzZu29zfi2wuyah8o2
	 TqgtbWICm0LArGgmdEHtCQ9pO8iCLvOtpzeHABr1TlLJemJkS5sQoFu1aQq2hTIsK8
	 /DcpMLsn+j8rwMznmWcStzB3FNjYjZaJ7Lm/zBjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76EDCF803B1;
	Mon, 17 Feb 2020 07:44:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6118CF80321; Mon, 17 Feb 2020 07:43:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04824F8025F
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04824F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="F7IJ71l4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="agSTzwEf"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 22CCF5590;
 Mon, 17 Feb 2020 01:43:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ectfDp539hM3p
 tJyekSj+yRWKWQ4i4xQcJ0r8f3OkZg=; b=F7IJ71l4MsxmVq4huWXG6LnfilrRa
 PEe+HDA5NQrcuy951qPXy2dH8ZaPzUFQMz2SHMVw2hWzEcbHo3TKXmxcUX94Xmz3
 /mSa9mi2iv9sEuBvtXTmRLWKPk4lzpgyh4t/10VDFBUaOCjoUI7jJrxXolnVTeOT
 Vqz7gS3bcK+yYr5eiI96CgtxNjkQXn5Abob/WPibXSRyJz711KPH9VtLsiIhdoPC
 dIsPSX0rIASALTvKFYWyAwWLLNDD0qo3oUn+mh0bYPeqwblsdLd9h3DKfKmigyZQ
 0TQXDFzhLhKk53Br59N6gcvQYWcxHgo7HnOkNsF3iuSkru73kfrS/juYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ectfDp539hM3ptJyekSj+yRWKWQ4i4xQcJ0r8f3OkZg=; b=agSTzwEf
 Uic/LDNzkirTkry/5n12fx4DHRJy+gzejfXJdV2+rBU/8w5L1CweXmTzXiHyHj0N
 8k2rWRy1fr5abvYxbMukBPrknfr/m5yACsbZ5pMOkz5hEsDSFUMG98HxHZnBSSm1
 nrStBUcknkKojORDi5uoDPHyh3nIM2mpgi2vx+7BiSMkhRDPlq4rSisJfAAJv4Ps
 vFJroUm4n9i/goiFOgHbVbXNZq6Y8Jmd3jFj584cJRTKxqG5FJFGNmVPH9H9wIog
 cxAe6oe9pkN7soLPGRswsAinpmT3BIpTY7MyddDp6ucrC7EELzM/n7oYl7MCLFXo
 K0mWBXEA9GAGew==
X-ME-Sender: <xms:_DVKXjCMbXSmVX_qm8JIGG0OBE2efMrP9xAB7AjghsEqLJuIPqbUnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedvjeenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:_TVKXtzF_Hu6hN0cXNTPj9K1w70EDnTgOULcYe2R8NMdRdo0kY8m9w>
 <xmx:_TVKXpnT3tRnltnyCWA8NFXVkNNCezYKrOS1SSAYUgJaCWqnkJZAHA>
 <xmx:_TVKXqGXBqOFE62Qe0ay9vBSBdfuOuZEz1cESeMrLCRi60l65lBhxw>
 <xmx:_TVKXszf4QYA9d_usTG6AjiZJ60jBHwoYoHJfpt7I086t6bCgzFjOw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5CBEE3280059;
 Mon, 17 Feb 2020 01:43:08 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:45 -0600
Message-Id: <20200217064250.15516-30-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 29/34] ASoC: sun8i-codec: Add AIF, ADC,
	and DAC volume controls
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

This allows changing the volume of each digital input/output
independently, and provides the only "master volume" for the DAC.
(The ADC also has a gain control on the analog side.)

While the hardware supports volumes up to +72dB, the controls here
are limited to +24dB maximum, as anything more makes volume sliders
difficult to use, and is extremely likely to cause clipping (this is
simple digital gain).

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 245145e36357..71cd7646a895 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -21,6 +21,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
+#include <sound/tlv.h>
 
 #define SUN8I_SYSCLK_CTL				0x00c
 #define SUN8I_SYSCLK_CTL_AIF1CLK_ENA			11
@@ -73,6 +74,12 @@
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACR	10
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR		9
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL	8
+#define SUN8I_AIF1_VOL_CTRL1				0x050
+#define SUN8I_AIF1_VOL_CTRL1_AD0L_VOL			8
+#define SUN8I_AIF1_VOL_CTRL1_AD0R_VOL			0
+#define SUN8I_AIF1_VOL_CTRL3				0x058
+#define SUN8I_AIF1_VOL_CTRL3_DA0L_VOL			8
+#define SUN8I_AIF1_VOL_CTRL3_DA0R_VOL			0
 #define SUN8I_AIF2_ADCDAT_CTRL				0x084
 #define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_ENA		15
 #define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_ENA		14
@@ -93,6 +100,12 @@
 #define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA1R	10
 #define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF2DACL	9
 #define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_ADCR		8
+#define SUN8I_AIF2_VOL_CTRL1				0x090
+#define SUN8I_AIF2_VOL_CTRL1_ADCL_VOL			8
+#define SUN8I_AIF2_VOL_CTRL1_ADCR_VOL			0
+#define SUN8I_AIF2_VOL_CTRL2				0x098
+#define SUN8I_AIF2_VOL_CTRL2_DACL_VOL			8
+#define SUN8I_AIF2_VOL_CTRL2_DACR_VOL			0
 #define SUN8I_AIF3_CLK_CTRL_AIF3_CLOCK_SRC_AIF1		(0x0 << 0)
 #define SUN8I_AIF3_CLK_CTRL_AIF3_CLOCK_SRC_AIF2		(0x1 << 0)
 #define SUN8I_AIF3_CLK_CTRL_AIF3_CLOCK_SRC_AIF1CLK	(0x2 << 0)
@@ -106,8 +119,14 @@
 #define SUN8I_ADC_DIG_CTRL_ENAD				15
 #define SUN8I_ADC_DIG_CTRL_ADOUT_DTS			2
 #define SUN8I_ADC_DIG_CTRL_ADOUT_DLY			1
+#define SUN8I_ADC_VOL_CTRL				0x104
+#define SUN8I_ADC_VOL_CTRL_ADCL_VOL			8
+#define SUN8I_ADC_VOL_CTRL_ADCR_VOL			0
 #define SUN8I_DAC_DIG_CTRL				0x120
 #define SUN8I_DAC_DIG_CTRL_ENDA				15
+#define SUN8I_DAC_VOL_CTRL				0x124
+#define SUN8I_DAC_VOL_CTRL_DACL_VOL			8
+#define SUN8I_DAC_VOL_CTRL_DACR_VOL			0
 #define SUN8I_DAC_MXR_SRC				0x130
 #define SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA0L		15
 #define SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA1L		14
@@ -521,6 +540,41 @@ static struct snd_soc_dai_driver sun8i_codec_dais[] = {
 	},
 };
 
+static const DECLARE_TLV_DB_SCALE(sun8i_codec_vol_scale, -12000, 75, 1);
+
+static const struct snd_kcontrol_new sun8i_codec_controls[] = {
+	SOC_DOUBLE_TLV("AIF1 AD0 Capture Volume",
+		       SUN8I_AIF1_VOL_CTRL1,
+		       SUN8I_AIF1_VOL_CTRL1_AD0L_VOL,
+		       SUN8I_AIF1_VOL_CTRL1_AD0R_VOL,
+		       0xc0, 0, sun8i_codec_vol_scale),
+	SOC_DOUBLE_TLV("AIF1 DA0 Playback Volume",
+		       SUN8I_AIF1_VOL_CTRL3,
+		       SUN8I_AIF1_VOL_CTRL3_DA0L_VOL,
+		       SUN8I_AIF1_VOL_CTRL3_DA0R_VOL,
+		       0xc0, 0, sun8i_codec_vol_scale),
+	SOC_DOUBLE_TLV("AIF2 ADC Capture Volume",
+		       SUN8I_AIF2_VOL_CTRL1,
+		       SUN8I_AIF2_VOL_CTRL1_ADCL_VOL,
+		       SUN8I_AIF2_VOL_CTRL1_ADCR_VOL,
+		       0xc0, 0, sun8i_codec_vol_scale),
+	SOC_DOUBLE_TLV("AIF2 DAC Playback Volume",
+		       SUN8I_AIF2_VOL_CTRL2,
+		       SUN8I_AIF2_VOL_CTRL2_DACL_VOL,
+		       SUN8I_AIF2_VOL_CTRL2_DACR_VOL,
+		       0xc0, 0, sun8i_codec_vol_scale),
+	SOC_DOUBLE_TLV("ADC Capture Volume",
+		       SUN8I_ADC_VOL_CTRL,
+		       SUN8I_ADC_VOL_CTRL_ADCL_VOL,
+		       SUN8I_ADC_VOL_CTRL_ADCR_VOL,
+		       0xc0, 0, sun8i_codec_vol_scale),
+	SOC_DOUBLE_TLV("DAC Playback Volume",
+		       SUN8I_DAC_VOL_CTRL,
+		       SUN8I_DAC_VOL_CTRL_DACL_VOL,
+		       SUN8I_DAC_VOL_CTRL_DACR_VOL,
+		       0xc0, 0, sun8i_codec_vol_scale),
+};
+
 static const struct snd_kcontrol_new sun8i_aif1_loopback_switch =
 	SOC_DAPM_SINGLE("AIF1 Loopback Switch",
 			SUN8I_AIF1_DACDAT_CTRL,
@@ -1017,6 +1071,8 @@ static int sun8i_codec_component_probe(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_component_driver sun8i_soc_component = {
+	.controls		= sun8i_codec_controls,
+	.num_controls		= ARRAY_SIZE(sun8i_codec_controls),
 	.dapm_widgets		= sun8i_codec_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(sun8i_codec_dapm_widgets),
 	.dapm_routes		= sun8i_codec_dapm_routes,
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
