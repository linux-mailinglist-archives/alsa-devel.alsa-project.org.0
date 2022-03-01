Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A05A4C9513
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 20:51:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3FAA1B38;
	Tue,  1 Mar 2022 20:51:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3FAA1B38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646164315;
	bh=op+kuWhB/CG0oX7mmKMPBA/PcIrUxK7caqToZ1P2vik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FxRmC1VCzcuynQa0zuTTmQxbINc01lwpYVmWUfNX0BHtspB7fCmVbmmmUvsgGDy/K
	 94Ho4JAfC4YiBi8u8OkwkuMkEpaH7wTD6fv7qEOv0kVmZeg1as+HRJduWofkHRCYdq
	 h75ZmU237o5+84iNhFynziSvMrhMKrwF7Ac2Nnz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6277CF8052D;
	Tue,  1 Mar 2022 20:49:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF96DF80528; Tue,  1 Mar 2022 20:49:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A83F7F80227
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 20:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A83F7F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kkY6NQ4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646164161; x=1677700161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=op+kuWhB/CG0oX7mmKMPBA/PcIrUxK7caqToZ1P2vik=;
 b=kkY6NQ4D0AVNGzfjb2uI1IVxJbJ1AAS3JIfs5jEt06+cy6iF+fJwQjgf
 3XOlweofje5luxcOOn816ZlfheB5fBNr59a05h3dMDK+HCwKzNbotErcb
 aTr9ns0Zc/5XE3pQ/2P5EywBj2XDvd9Qkg9c2hcz8M9BM4Vj1J0+RjcD8
 mxhWNMWlxxUT8nieKjIvTEcBi6t746jlAlr6v8M01A6TwkKZW8SIlO4Qr
 Juwq5acqu/04dQJZT9aHsr2UcW07h4RIGIsUanZ60XBNCA3oKBjN2PQtG
 LPMEzZRltitjDg8GV/eaH1GzFf8RzH49BnyOFEw5RtTkGEof+bE6hKPei Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233841069"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233841069"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:16 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="630131859"
Received: from rbrosius-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.131.146])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:15 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/8] ASoC: Intel: sof_rt1308: move rt1308 code to common module
Date: Tue,  1 Mar 2022 13:49:00 -0600
Message-Id: <20220301194903.60859-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

Move the code related to rt1308 dai link to the realtek common module.
It creates a clean base to add more amplifier support to this machine
driver in the future.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig              |  1 +
 sound/soc/intel/boards/sof_realtek_common.c | 98 +++++++++++++++++++++
 sound/soc/intel/boards/sof_realtek_common.h |  4 +
 sound/soc/intel/boards/sof_rt1308.c         | 70 +++------------
 4 files changed, 114 insertions(+), 59 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index cdf94b09c372..d96ebc335249 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -609,6 +609,7 @@ config SND_SOC_INTEL_SOF_RT1308_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT1308
 	select SND_SOC_DMIC
+	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	help
 	   This adds support for ASoC machine driver for Tigerlake platforms
 	   with RT1308 I2S audio codec.
diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 669e44c73c17..a2bcbeee0216 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -10,9 +10,11 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
+#include <sound/sof.h>
 #include <uapi/sound/asound.h>
 #include "../../codecs/rt1011.h"
 #include "../../codecs/rt1015.h"
+#include "../../codecs/rt1308.h"
 #include "sof_realtek_common.h"
 
 /*
@@ -361,5 +363,101 @@ void sof_rt1015_dai_link(struct snd_soc_dai_link *link, unsigned int fs)
 }
 EXPORT_SYMBOL_NS(sof_rt1015_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
+/*
+ * RT1308 audio amplifier
+ */
+static const struct snd_kcontrol_new rt1308_kcontrols[] = {
+	SOC_DAPM_PIN_SWITCH("Speakers"),
+};
+
+static const struct snd_soc_dapm_widget rt1308_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("Speakers", NULL),
+};
+
+static const struct snd_soc_dapm_route rt1308_dapm_routes[] = {
+	/* speaker */
+	{"Speakers", NULL, "SPOL"},
+	{"Speakers", NULL, "SPOR"},
+};
+
+static struct snd_soc_dai_link_component rt1308_components[] = {
+	{
+		.name = RT1308_DEV0_NAME,
+		.dai_name = RT1308_CODEC_DAI,
+	}
+};
+
+static int rt1308_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt1308_dapm_widgets,
+					ARRAY_SIZE(rt1308_dapm_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add dapm controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, rt1308_kcontrols,
+					ARRAY_SIZE(rt1308_kcontrols));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1308_dapm_routes,
+				      ARRAY_SIZE(rt1308_dapm_routes));
+
+	if (ret)
+		dev_err(rtd->dev, "fail to add dapm routes, ret %d\n", ret);
+
+	return ret;
+}
+
+static int rt1308_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	int clk_id, clk_freq, pll_out;
+	int ret;
+
+	clk_id = RT1308_PLL_S_MCLK;
+	/* get the tplg configured mclk. */
+	clk_freq = sof_dai_get_mclk(rtd);
+
+	pll_out = params_rate(params) * 512;
+
+	/* Set rt1308 pll */
+	ret = snd_soc_dai_set_pll(codec_dai, 0, clk_id, clk_freq, pll_out);
+	if (ret < 0) {
+		dev_err(card->dev, "Failed to set RT1308 PLL: %d\n", ret);
+		return ret;
+	}
+
+	/* Set rt1308 sysclk */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT1308_FS_SYS_S_PLL, pll_out,
+				     SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		dev_err(card->dev, "Failed to set RT1308 SYSCLK: %d\n", ret);
+
+	return ret;
+}
+
+static const struct snd_soc_ops rt1308_ops = {
+	.hw_params = rt1308_hw_params,
+};
+
+void sof_rt1308_dai_link(struct snd_soc_dai_link *link)
+{
+	link->codecs = rt1308_components;
+	link->num_codecs = ARRAY_SIZE(rt1308_components);
+	link->init = rt1308_init;
+	link->ops = &rt1308_ops;
+}
+EXPORT_SYMBOL_NS(sof_rt1308_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Realtek helpers");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index 228ac9c08430..e0a5518e8dd2 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -35,4 +35,8 @@ void sof_rt1015p_codec_conf(struct snd_soc_card *card);
 void sof_rt1015_dai_link(struct snd_soc_dai_link *link, unsigned int fs);
 void sof_rt1015_codec_conf(struct snd_soc_card *card);
 
+#define RT1308_CODEC_DAI	"rt1308-aif"
+#define RT1308_DEV0_NAME	"i2c-10EC1308:00"
+void sof_rt1308_dai_link(struct snd_soc_dai_link *link);
+
 #endif /* __SOF_REALTEK_COMMON_H */
diff --git a/sound/soc/intel/boards/sof_rt1308.c b/sound/soc/intel/boards/sof_rt1308.c
index 7e33c49b3531..971ab53236a5 100644
--- a/sound/soc/intel/boards/sof_rt1308.c
+++ b/sound/soc/intel/boards/sof_rt1308.c
@@ -16,7 +16,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/sof.h>
-#include "../../codecs/rt1308.h"
+#include "sof_realtek_common.h"
 
 #define SOF_RT1308_SSP_CODEC(quirk)		((quirk) & GENMASK(3, 0))
 #define SOF_RT1308_SSP_CODEC_MASK			(GENMASK(3, 0))
@@ -38,22 +38,16 @@
 #define SOF_HDMI_CAPTURE_2_SSP(quirk)	\
 	(((quirk) << SOF_HDMI_CAPTURE_2_SSP_SHIFT) & SOF_HDMI_CAPTURE_2_SSP_MASK)
 
+#define SOF_RT1308_SPEAKER_AMP_PRESENT		BIT(13)
+
 /* Default: SSP2  */
 static unsigned long sof_rt1308_quirk = SOF_RT1308_SSP_CODEC(2);
 
 static const struct snd_soc_dapm_widget sof_rt1308_dapm_widgets[] = {
-	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
 
-static const struct snd_kcontrol_new sof_rt1308_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speakers"),
-};
-
 static const struct snd_soc_dapm_route sof_rt1308_dapm_routes[] = {
-	{ "Speakers", NULL, "SPOL" },
-	{ "Speakers", NULL, "SPOR" },
-
 	/* digital mics */
 	{"DMic", NULL, "SoC DMIC"},
 };
@@ -61,8 +55,6 @@ static const struct snd_soc_dapm_route sof_rt1308_dapm_routes[] = {
 static struct snd_soc_card sof_rt1308_card = {
 	.name         = "rt1308",
 	.owner        = THIS_MODULE,
-	.controls = sof_rt1308_controls,
-	.num_controls = ARRAY_SIZE(sof_rt1308_controls),
 	.dapm_widgets = sof_rt1308_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sof_rt1308_dapm_widgets),
 	.dapm_routes = sof_rt1308_dapm_routes,
@@ -70,37 +62,6 @@ static struct snd_soc_card sof_rt1308_card = {
 	.fully_routed = true,
 };
 
-static int sof_rt1308_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	int clk_id, clk_freq, pll_out;
-	int ret;
-
-	clk_id = RT1308_PLL_S_MCLK;
-	/* get the tplg configured mclk. */
-	clk_freq = sof_dai_get_mclk(rtd);
-
-	pll_out = params_rate(params) * 512;
-
-	/* Set rt1308 pll */
-	ret = snd_soc_dai_set_pll(codec_dai, 0, clk_id, clk_freq, pll_out);
-	if (ret < 0) {
-		dev_err(card->dev, "Failed to set RT1308 PLL: %d\n", ret);
-		return ret;
-	}
-
-	/* Set rt1308 sysclk */
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT1308_FS_SYS_S_PLL, pll_out,
-				     SND_SOC_CLOCK_IN);
-	if (ret < 0)
-		dev_err(card->dev, "Failed to set RT1308 SYSCLK: %d\n", ret);
-
-	return ret;
-}
-
 static struct snd_soc_dai_link_component platform_component[] = {
 	{
 		/* name might be overridden during probe */
@@ -108,13 +69,6 @@ static struct snd_soc_dai_link_component platform_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component rt1308_component[] = {
-	{
-		.name = "i2c-10EC1308:00",
-		.dai_name = "rt1308-aif",
-	}
-};
-
 static struct snd_soc_dai_link_component dmic_component[] = {
 	{
 		.name = "dmic-codec",
@@ -129,11 +83,6 @@ static struct snd_soc_dai_link_component dummy_component[] = {
 	}
 };
 
-/* machine stream operations */
-static const struct snd_soc_ops sof_rt1308_ops = {
-	.hw_params = sof_rt1308_hw_params,
-};
-
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 							  int ssp_codec,
 							  int dmic_be_num)
@@ -186,11 +135,11 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		return NULL;
 
 	links[id].id = id;
-	links[id].codecs = rt1308_component;
-	links[id].num_codecs = ARRAY_SIZE(rt1308_component);
+	if (sof_rt1308_quirk & SOF_RT1308_SPEAKER_AMP_PRESENT) {
+		sof_rt1308_dai_link(&links[id]);
+	}
 	links[id].platforms = platform_component;
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
-	links[id].ops = &sof_rt1308_ops;
 	links[id].dpcm_playback = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
@@ -284,7 +233,8 @@ static const struct platform_device_id board_ids[] = {
 					SOF_NO_OF_HDMI_CAPTURE_SSP(2) |
 					SOF_HDMI_CAPTURE_1_SSP(1) |
 					SOF_HDMI_CAPTURE_2_SSP(5) |
-					SOF_SSP_HDMI_CAPTURE_PRESENT),
+					SOF_SSP_HDMI_CAPTURE_PRESENT |
+					SOF_RT1308_SPEAKER_AMP_PRESENT),
 	},
 	{ }
 };
@@ -301,5 +251,7 @@ static struct platform_driver sof_rt1308_driver = {
 module_platform_driver(sof_rt1308_driver);
 
 MODULE_DESCRIPTION("ASoC Intel(R) SOF + RT1308 Machine driver");
+MODULE_AUTHOR("balamurugan.c <balamurugan.c@intel.com>");
+MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:sof_rt1308");
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
-- 
2.25.1

