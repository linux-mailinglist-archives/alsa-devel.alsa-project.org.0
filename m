Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B8645537D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 04:38:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D7218D9;
	Thu, 18 Nov 2021 04:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D7218D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637206702;
	bh=JFcoebrDwKnLO9mILLVPX0+q0zCmz+iO3rONDkQTO2Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jyVD9HaAtIkmUuEL38C7hIBbVzCXI5vnHHB0lqBJuMMgPBQdQggnT9uJGtUHj8twd
	 z5R8BOpqcUMXc6O3rMlDk5AbuFBa4Ejtw4ZViW2rNRXRqVkrJsb+f6sn64VWrWpzJ6
	 0A62d73BvLTRAVtUgQfAPz9Zx+mNUywccnYwZKDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EC79F8010B;
	Thu, 18 Nov 2021 04:37:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CD74F80272; Thu, 18 Nov 2021 04:37:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C97DF8010B
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 04:36:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C97DF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="mr/+oqxf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DSFhbU+j"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 162865C0199;
 Wed, 17 Nov 2021 22:36:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 17 Nov 2021 22:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=71AZcMww/v9dGhq5/Lg9/+aqxm
 2uzvsx7xw8b2lcXco=; b=mr/+oqxfKgG7E6ArPEO9HhV7fZYYKYgOOL17+S4QeI
 kasgonFtAjXA02DSbiGlPKcmtv2o1IhqXLvsUmfsRG2FHI5ztu+xcRGnAFDfqE0p
 PPuFva0g4Dyo5kIRl0cwqBV8oe7KGeq7d+Kv5LEPZQdpw8M2NC6Ar5ToOCsmuCNP
 Yj4Yo3AVfP/8f5q6Omd9BaSiBDvMkmpIyyPhQYBcqLP/lTS0wZOlMvDnw9CMOpEJ
 zbtCnfO/u5rffwI6qsRKBzeRsnMYd3LoM1lTiWwoB90poGW49suK9IKiC2Xs0LFv
 yExbEqu19YurTMecgtRc/Xs/7FOZK8TVoYZcqz3eSXSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=71AZcMww/v9dGhq5/
 Lg9/+aqxm2uzvsx7xw8b2lcXco=; b=DSFhbU+jdHf2uvAAKCeK9HKZ6XvILIjZI
 /H32KSNzAxrKSHdUhucCrKoA2NpbBCoJW3AIX3YLtzuk1t50g+rtzFmuxMQAcreY
 RxWiDNV1YMU5SslMwyqzAJVQh03L3V6OlOlJMbQ0o2yoSJXMB1UbEHicl3ugGIg9
 eDq15sAW8jX71aiY/HE51RNHKI8NhdtjTXXZ2Wwl1YUICRr7HygTmILHoZGbSAUn
 Dq9E9jNf4z52qqhHupDjftZzQOAKHDRMPcC7NTGgyfBtLsiWoqUpP7vMpYUFcM+6
 q7ugf0vW4+fEVldVjKCAaybdK8stDSHA4GZiTlpEVic46Mc+7ZjRA==
X-ME-Sender: <xms:TsqVYTsJdLBml6rILFTxjjtcgVb9vzspNEi9nmHM_hsLfFT0ocQbiA>
 <xme:TsqVYUcMDVZMGLpU09ec4_QpaC9tZFf2f0Fdr8O67zwyJfWqJxNEG9YpKR4GoLBbm
 v5kqzFrDqPfBlJgUA>
X-ME-Received: <xmr:TsqVYWxcajcOLEJ644Amuw-EsAiZWT0dMXVUWycd-byDaa-LQcw-MzEaMlOEb7Da1GCVoj8T_LkmqGq1NhPmtkrzbOvYYcxLFGFtx4SoyE_2oCDobqo-DZo5H65sQxEOtZjEwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeehgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
 ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
 htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
 tdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
 grmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:TsqVYSPOxUdvMXFqYuwLBz_ZVQUZXG8AUT5fwrbEeCKSRQm02cxRFA>
 <xmx:TsqVYT_78-SHf-AslkJ1SCW_kQYmHaBUZNeAB5y_c3SH5jMj3115AA>
 <xmx:TsqVYSUwl3C6uTbW9TUB97oxCUv_bKvhZNgTndZ6Usz182XX5P-Z7A>
 <xmx:T8qVYUM2_hUf6R8FQpMbcfDJFc0ZrDvKEIXtQmUE9YYfVBaOjLXp2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 22:36:45 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: sun8i-codec: Add AIF, ADC, and DAC volume controls
Date: Wed, 17 Nov 2021 21:36:45 -0600
Message-Id: <20211118033645.43524-1-samuel@sholland.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev
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

This allows changing the volume of each digital input/output
independently, and provides the only "master volume" for the DAC.
(The ADC also has a gain control on the analog side.)

While the hardware supports digital gain up to +72dB, the controls here
are limited to +24dB maximum, as any gain above that level makes volume
sliders difficult to use, and is extremely likely to cause clipping.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 518bfb724a5b..0bea2162f68d 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -21,6 +21,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
+#include <sound/tlv.h>
 
 #define SUN8I_SYSCLK_CTL				0x00c
 #define SUN8I_SYSCLK_CTL_AIF1CLK_ENA			11
@@ -72,6 +73,12 @@
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
@@ -91,6 +98,12 @@
 #define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA1R	10
 #define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF2DACL	9
 #define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_ADCR		8
+#define SUN8I_AIF2_VOL_CTRL1				0x090
+#define SUN8I_AIF2_VOL_CTRL1_ADCL_VOL			8
+#define SUN8I_AIF2_VOL_CTRL1_ADCR_VOL			0
+#define SUN8I_AIF2_VOL_CTRL2				0x098
+#define SUN8I_AIF2_VOL_CTRL2_DACL_VOL			8
+#define SUN8I_AIF2_VOL_CTRL2_DACR_VOL			0
 #define SUN8I_AIF3_CLK_CTRL_AIF3_CLK_SRC_AIF1		(0x0 << 0)
 #define SUN8I_AIF3_CLK_CTRL_AIF3_CLK_SRC_AIF2		(0x1 << 0)
 #define SUN8I_AIF3_CLK_CTRL_AIF3_CLK_SRC_AIF1CLK	(0x2 << 0)
@@ -102,8 +115,14 @@
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
@@ -696,6 +715,41 @@ static struct snd_soc_dai_driver sun8i_codec_dais[] = {
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
 static int sun8i_codec_aif_event(struct snd_soc_dapm_widget *w,
 				 struct snd_kcontrol *kcontrol, int event)
 {
@@ -1215,6 +1269,8 @@ static int sun8i_codec_component_probe(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_component_driver sun8i_soc_component = {
+	.controls		= sun8i_codec_controls,
+	.num_controls		= ARRAY_SIZE(sun8i_codec_controls),
 	.dapm_widgets		= sun8i_codec_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(sun8i_codec_dapm_widgets),
 	.dapm_routes		= sun8i_codec_dapm_routes,
-- 
2.32.0

