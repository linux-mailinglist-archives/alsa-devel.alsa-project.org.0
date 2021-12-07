Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A4046C39D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 20:26:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68C8C23AB;
	Tue,  7 Dec 2021 20:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68C8C23AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638905215;
	bh=p3xHFCChJYBUfF3yM4QO9XZf4sAk23Dz+gB4xxc7jyg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W6/oTNvz0BSTxtxMQTke8kKSKM9+n0na/RfqIBgmVKV3s6Xtjq3NjGhdoSDO8LU+6
	 v+h6Qn8xEIlOWrFLhEGczF0Gxbkt6pgW6na4Ddoh3HDB1M8JDRwhcsCJtl0obsXjNg
	 k32X3K6xodnCNtOaIiKUHnJLX5rvnlNRk5fbwuDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E707BF80253;
	Tue,  7 Dec 2021 20:25:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D102F8028D; Tue,  7 Dec 2021 20:25:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 939E4F80253
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 20:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 939E4F80253
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="323922140"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="323922140"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:25:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="679570801"
Received: from nthiag2-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.74.17])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:25:06 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: Move rt1015 speaker amp to common
 file
Date: Tue,  7 Dec 2021 13:24:58 -0600
Message-Id: <20211207192458.44007-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

Move rt1015 driver code to common file to be consistent with
rt1011 and rt1015p.

No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_realtek_common.c | 119 +++++++++++++++++++-
 sound/soc/intel/boards/sof_realtek_common.h |   7 ++
 sound/soc/intel/boards/sof_rt5682.c         | 107 +-----------------
 3 files changed, 127 insertions(+), 106 deletions(-)

diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 2ec34f8df9e1..4cf131310ad3 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -12,12 +12,13 @@
 #include <sound/soc-dapm.h>
 #include <uapi/sound/asound.h>
 #include "../../codecs/rt1011.h"
+#include "../../codecs/rt1015.h"
 #include "sof_realtek_common.h"
 
 /*
  * Current only 2-amp configuration is supported for rt1011
  */
-static const struct snd_soc_dapm_route rt1011_dapm_routes[] = {
+static const struct snd_soc_dapm_route speaker_map_lr[] = {
 	/* speaker */
 	{ "Left Spk", NULL, "Left SPO" },
 	{ "Right Spk", NULL, "Right SPO" },
@@ -117,8 +118,8 @@ static int rt1011_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	int ret;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt1011_dapm_routes,
-				      ARRAY_SIZE(rt1011_dapm_routes));
+	ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map_lr,
+				      ARRAY_SIZE(speaker_map_lr));
 	if (ret)
 		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
 	return ret;
@@ -241,3 +242,115 @@ void sof_rt1015p_codec_conf(struct snd_soc_card *card)
 	card->codec_conf = rt1015p_codec_confs;
 	card->num_configs = ARRAY_SIZE(rt1015p_codec_confs);
 }
+
+/*
+ * RT1015 audio amplifier
+ */
+
+static int rt1015_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai;
+	int i, fs = 64, ret;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
+					  params_rate(params) * fs,
+					  params_rate(params) * 256);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
+					     params_rate(params) * 256,
+					     SND_SOC_CLOCK_IN);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rt1015_hw_params_pll_and_tdm(struct snd_pcm_substream *substream,
+					 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai;
+	int i, fs = 100, ret;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
+					  params_rate(params) * fs,
+					  params_rate(params) * 256);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
+					     params_rate(params) * 256,
+					     SND_SOC_CLOCK_IN);
+		if (ret)
+			return ret;
+	}
+	/* rx slot 1 for RT1015_DEV0_NAME */
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0),
+				       0x0, 0x1, 4, 24);
+	if (ret)
+		return ret;
+
+	/* rx slot 2 for RT1015_DEV1_NAME */
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 1),
+				       0x0, 0x2, 4, 24);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static struct snd_soc_ops rt1015_ops = {
+	.hw_params = rt1015_hw_params,
+};
+
+static struct snd_soc_codec_conf rt1015_amp_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(RT1015_DEV0_NAME),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1015_DEV1_NAME),
+		.name_prefix = "Right",
+	},
+};
+
+static struct snd_soc_dai_link_component rt1015_components[] = {
+	{
+		.name = RT1015_DEV0_NAME,
+		.dai_name = RT1015_CODEC_DAI,
+	},
+	{
+		.name = RT1015_DEV1_NAME,
+		.dai_name = RT1015_CODEC_DAI,
+	},
+};
+
+static int speaker_codec_init_lr(struct snd_soc_pcm_runtime *rtd)
+{
+	return snd_soc_dapm_add_routes(&rtd->card->dapm, speaker_map_lr,
+					ARRAY_SIZE(speaker_map_lr));
+}
+
+void sof_rt1015_codec_conf(struct snd_soc_card *card)
+{
+	card->codec_conf = rt1015_amp_conf;
+	card->num_configs = ARRAY_SIZE(rt1015_amp_conf);
+}
+
+void sof_rt1015_dai_link(struct snd_soc_dai_link *link, unsigned int fs)
+{
+	link->codecs = rt1015_components;
+	link->num_codecs = ARRAY_SIZE(rt1015_components);
+	link->init = speaker_codec_init_lr;
+	link->ops = &rt1015_ops;
+
+	if (fs == 100)
+		rt1015_ops.hw_params = rt1015_hw_params_pll_and_tdm;
+}
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index cb0b49b2855c..228ac9c08430 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -28,4 +28,11 @@ void sof_rt1011_codec_conf(struct snd_soc_card *card);
 void sof_rt1015p_dai_link(struct snd_soc_dai_link *link);
 void sof_rt1015p_codec_conf(struct snd_soc_card *card);
 
+#define RT1015_CODEC_DAI	"rt1015-aif"
+#define RT1015_DEV0_NAME	"i2c-10EC1015:00"
+#define RT1015_DEV1_NAME	"i2c-10EC1015:01"
+
+void sof_rt1015_dai_link(struct snd_soc_dai_link *link, unsigned int fs);
+void sof_rt1015_codec_conf(struct snd_soc_card *card);
+
 #endif /* __SOF_REALTEK_COMMON_H */
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 6cadb5fb72e0..bd6d2e7dea53 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -20,7 +20,6 @@
 #include <sound/rt5682.h>
 #include <sound/rt5682s.h>
 #include <sound/soc-acpi.h>
-#include "../../codecs/rt1015.h"
 #include "../../codecs/rt5682.h"
 #include "../../codecs/rt5682s.h"
 #include "../../codecs/hdac_hdmi.h"
@@ -400,67 +399,6 @@ static struct snd_soc_ops sof_rt5682_ops = {
 	.hw_params = sof_rt5682_hw_params,
 };
 
-static int sof_rt1015_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai;
-	int i, fs, ret;
-
-	if (!snd_soc_card_get_codec_dai(card, "rt1015-aif"))
-		return 0;
-
-	if (sof_rt5682_quirk & SOF_RT1015_SPEAKER_AMP_100FS)
-		fs = 100;
-	else
-		fs = 64;
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
-					  params_rate(params) * fs,
-					  params_rate(params) * 256);
-		if (ret < 0) {
-			dev_err(card->dev, "failed to set pll\n");
-			return ret;
-		}
-		/* Configure sysclk for codec */
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
-					     params_rate(params) * 256,
-					     SND_SOC_CLOCK_IN);
-		if (ret < 0) {
-			dev_err(card->dev, "failed to set sysclk\n");
-			return ret;
-		}
-
-		if (sof_rt5682_quirk & SOF_RT1015_SPEAKER_AMP_100FS) {
-			if (!strcmp(codec_dai->component->name, "i2c-10EC1015:00")) {
-				ret = snd_soc_dai_set_tdm_slot(codec_dai,
-							       0x0, 0x1, 4, 24);
-				if (ret < 0) {
-					dev_err(card->dev, "failed to set tdm slot\n");
-					return ret;
-				}
-			}
-
-			if (!strcmp(codec_dai->component->name, "i2c-10EC1015:01")) {
-				ret = snd_soc_dai_set_tdm_slot(codec_dai,
-							       0x0, 0x2, 4, 24);
-				if (ret < 0) {
-					dev_err(card->dev, "failed to set tdm slot\n");
-					return ret;
-				}
-			}
-		}
-	}
-
-	return 0;
-}
-
-static struct snd_soc_ops sof_rt1015_ops = {
-	.hw_params = sof_rt1015_hw_params,
-};
-
 static struct snd_soc_dai_link_component platform_component[] = {
 	{
 		/* name might be overridden during probe */
@@ -551,22 +489,11 @@ static const struct snd_soc_dapm_route sof_map[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 };
 
-static const struct snd_soc_dapm_route speaker_map_lr[] = {
-	{ "Left Spk", NULL, "Left SPO" },
-	{ "Right Spk", NULL, "Right SPO" },
-};
-
 static const struct snd_soc_dapm_route dmic_map[] = {
 	/* digital mics */
 	{"DMic", NULL, "SoC DMIC"},
 };
 
-static int speaker_codec_init_lr(struct snd_soc_pcm_runtime *rtd)
-{
-	return snd_soc_dapm_add_routes(&rtd->card->dapm, speaker_map_lr,
-				       ARRAY_SIZE(speaker_map_lr));
-}
-
 static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -589,17 +516,6 @@ static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-static struct snd_soc_codec_conf rt1015_amp_conf[] = {
-	{
-		.dlc = COMP_CODEC_CONF("i2c-10EC1015:00"),
-		.name_prefix = "Left",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("i2c-10EC1015:01"),
-		.name_prefix = "Right",
-	},
-};
-
 /* sof audio machine driver for rt5682 codec */
 static struct snd_soc_card sof_audio_card_rt5682 = {
 	.name = "rt5682", /* the sof- prefix is added by the core */
@@ -635,17 +551,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component rt1015_components[] = {
-	{
-		.name = "i2c-10EC1015:00",
-		.dai_name = "rt1015-aif",
-	},
-	{
-		.name = "i2c-10EC1015:01",
-		.dai_name = "rt1015-aif",
-	},
-};
-
 static struct snd_soc_dai_link_component dummy_component[] = {
 	{
 		.name = "snd-soc-dummy",
@@ -798,10 +703,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 
 		links[id].id = id;
 		if (sof_rt5682_quirk & SOF_RT1015_SPEAKER_AMP_PRESENT) {
-			links[id].codecs = rt1015_components;
-			links[id].num_codecs = ARRAY_SIZE(rt1015_components);
-			links[id].init = speaker_codec_init_lr;
-			links[id].ops = &sof_rt1015_ops;
+			sof_rt1015_dai_link(&links[id], (sof_rt5682_quirk &
+					SOF_RT1015_SPEAKER_AMP_100FS) ? 100 : 64);
 		} else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT) {
 			sof_rt1015p_dai_link(&links[id]);
 		} else if (sof_rt5682_quirk &
@@ -995,10 +898,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	sof_audio_card_rt5682.dai_link = dai_links;
 
-	if (sof_rt5682_quirk & SOF_RT1015_SPEAKER_AMP_PRESENT) {
-		sof_audio_card_rt5682.codec_conf = rt1015_amp_conf;
-		sof_audio_card_rt5682.num_configs = ARRAY_SIZE(rt1015_amp_conf);
-	}
+	if (sof_rt5682_quirk & SOF_RT1015_SPEAKER_AMP_PRESENT)
+		sof_rt1015_codec_conf(&sof_audio_card_rt5682);
 
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
-- 
2.25.1

