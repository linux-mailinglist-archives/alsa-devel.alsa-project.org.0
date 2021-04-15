Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55986361183
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 19:55:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4240167D;
	Thu, 15 Apr 2021 19:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4240167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618509345;
	bh=mEixypH7onbDDvFaoS2AC0cdQuHlXqj41uSoQvrqF20=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R3vmcOumD7i/Cikvaqbojc7cNTPY4qI5+PJQYTlQybxQj1QzBREbTOuFcbl5i4A+u
	 P7mHi/5W2a+IbxfkVHZc0nvA+YrmD3o2/k53N0djrROtGQImzQ+EjOoIyVpcJUBZiQ
	 AzghZMWqV92a+XZX5iT6VCOCTHc4vPGmytgon7ZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FD39F804EB;
	Thu, 15 Apr 2021 19:51:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E30BDF80424; Thu, 15 Apr 2021 19:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BF45F800FF
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 19:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BF45F800FF
IronPort-SDR: vAV6eTWiB8RnK5di+fFt03gE8eC0+AWc3nvVgAoVRd1woyUmmid5DqlsDPk645mqjyjyTG3vEg
 YH9LdES1SeyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="174400820"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="174400820"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:44 -0700
IronPort-SDR: dS8xD3owQKdnzsfLONNfxz1H7b5uO86ZwTzY+2AkIAQYlglzdyW4xptoJooMXFwIJV3hMcYFAD
 Bv9QSWNB5Jiw==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="382804688"
Received: from lesterhu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.33.4])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 9/9] ASoC: Intel: boards: create sof-maxim-common module
Date: Thu, 15 Apr 2021 12:50:13 -0500
Message-Id: <20210415175013.192862-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
References: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

sof_maxim_common.o is linked twice, move to a dedicated module.

Also clean-up interfaces to use a consistent 'max_98373' prefix for
all symbols.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig            |  5 +++++
 sound/soc/intel/boards/Makefile           |  6 ++++--
 sound/soc/intel/boards/sof_maxim_common.c | 24 ++++++++++++++++-------
 sound/soc/intel/boards/sof_maxim_common.h |  6 +++---
 sound/soc/intel/boards/sof_rt5682.c       |  5 +++--
 sound/soc/intel/boards/sof_sdw.c          |  1 +
 sound/soc/intel/boards/sof_sdw_max98373.c |  4 ++--
 7 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index ec4d754eb348..ceeb618bd950 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -29,6 +29,9 @@ config SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES
 config SND_SOC_INTEL_HDA_DSP_COMMON
 	tristate
 
+config SND_SOC_INTEL_SOF_MAXIM_COMMON
+	tristate
+
 if SND_SOC_INTEL_CATPT
 
 config SND_SOC_INTEL_HASWELL_MACH
@@ -469,6 +472,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
+	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with rt5682 codec.
@@ -579,6 +583,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT5682_SDW
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
+	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	help
 	  Add support for Intel SoundWire-based platforms connected to
 	  MAX98373, RT700, RT711, RT1308 and RT715
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index a48ee9b74e73..855296e8dfb8 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -19,7 +19,7 @@ snd-soc-sst-byt-cht-cx2072x-objs := bytcht_cx2072x.o
 snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
-snd-soc-sof_rt5682-objs := sof_rt5682.o sof_maxim_common.o sof_realtek_common.o
+snd-soc-sof_rt5682-objs := sof_rt5682.o sof_realtek_common.o
 snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
@@ -38,7 +38,6 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt711_sdca.o 	\
 			sof_sdw_rt715.o	sof_sdw_rt715_sdca.o 	\
-			sof_maxim_common.o                      \
 			sof_sdw_dmic.o sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
@@ -78,3 +77,6 @@ obj-$(CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH) += snd-soc-sof-sdw.o
 # common modules
 snd-soc-intel-hda-dsp-common-objs := hda_dsp_common.o
 obj-$(CONFIG_SND_SOC_INTEL_HDA_DSP_COMMON) += snd-soc-intel-hda-dsp-common.o
+
+snd-soc-intel-sof-maxim-common-objs += sof_maxim_common.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_MAXIM_COMMON) += snd-soc-intel-sof-maxim-common.o
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 437d20562753..7c4af6ec58e8 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
 // Copyright(c) 2020 Intel Corporation. All rights reserved.
+#include <linux/module.h>
 #include <linux/string.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
@@ -16,6 +17,7 @@ const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 	{ "Left Spk", NULL, "Left BE_OUT" },
 	{ "Right Spk", NULL, "Right BE_OUT" },
 };
+EXPORT_SYMBOL_NS(max_98373_dapm_routes, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
 static struct snd_soc_codec_conf max_98373_codec_conf[] = {
 	{
@@ -38,9 +40,10 @@ struct snd_soc_dai_link_component max_98373_components[] = {
 		.dai_name = MAX_98373_CODEC_DAI,
 	},
 };
+EXPORT_SYMBOL_NS(max_98373_components, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
-static int max98373_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *params)
+static int max_98373_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
@@ -59,7 +62,7 @@ static int max98373_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-int max98373_trigger(struct snd_pcm_substream *substream, int cmd)
+int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
@@ -102,13 +105,15 @@ int max98373_trigger(struct snd_pcm_substream *substream, int cmd)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(max_98373_trigger, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
 struct snd_soc_ops max_98373_ops = {
-	.hw_params = max98373_hw_params,
-	.trigger = max98373_trigger,
+	.hw_params = max_98373_hw_params,
+	.trigger = max_98373_trigger,
 };
+EXPORT_SYMBOL_NS(max_98373_ops, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
-int max98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
+int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -119,9 +124,14 @@ int max98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
 	return ret;
 }
+EXPORT_SYMBOL_NS(max_98373_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
-void sof_max98373_codec_conf(struct snd_soc_card *card)
+void max_98373_set_codec_conf(struct snd_soc_card *card)
 {
 	card->codec_conf = max_98373_codec_conf;
 	card->num_configs = ARRAY_SIZE(max_98373_codec_conf);
 }
+EXPORT_SYMBOL_NS(max_98373_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
+MODULE_DESCRIPTION("ASoC Intel SOF Maxim helpers");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 5240b1c9d379..566a664d5a63 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -20,8 +20,8 @@ extern struct snd_soc_dai_link_component max_98373_components[2];
 extern struct snd_soc_ops max_98373_ops;
 extern const struct snd_soc_dapm_route max_98373_dapm_routes[];
 
-int max98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
-void sof_max98373_codec_conf(struct snd_soc_card *card);
-int max98373_trigger(struct snd_pcm_substream *substream, int cmd);
+int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
+void max_98373_set_codec_conf(struct snd_soc_card *card);
+int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
 
 #endif /* __SOF_MAXIM_COMMON_H */
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 514ee19ab4a2..ee56a95895db 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -756,7 +756,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 				SOF_MAX98373_SPEAKER_AMP_PRESENT) {
 			links[id].codecs = max_98373_components;
 			links[id].num_codecs = ARRAY_SIZE(max_98373_components);
-			links[id].init = max98373_spk_codec_init;
+			links[id].init = max_98373_spk_codec_init;
 			links[id].ops = &max_98373_ops;
 			/* feedback stream */
 			links[id].dpcm_capture = 1;
@@ -902,7 +902,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_audio_card_rt5682.num_links++;
 
 	if (sof_rt5682_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT)
-		sof_max98373_codec_conf(&sof_audio_card_rt5682);
+		max_98373_set_codec_conf(&sof_audio_card_rt5682);
 	else if (sof_rt5682_quirk & SOF_RT1011_SPEAKER_AMP_PRESENT)
 		sof_rt1011_codec_conf(&sof_audio_card_rt5682);
 	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
@@ -1055,3 +1055,4 @@ MODULE_ALIAS("platform:jsl_rt5682_rt1015p");
 MODULE_ALIAS("platform:adl_max98373_rt5682");
 MODULE_ALIAS("platform:adl_max98357a_rt5682");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 73929f238f7b..d65e29ab70c3 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1318,3 +1318,4 @@ MODULE_AUTHOR("Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:sof_sdw");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/boards/sof_sdw_max98373.c b/sound/soc/intel/boards/sof_sdw_max98373.c
index cfdf970c5800..0e7ed906b341 100644
--- a/sound/soc/intel/boards/sof_sdw_max98373.c
+++ b/sound/soc/intel/boards/sof_sdw_max98373.c
@@ -64,7 +64,7 @@ static int max98373_sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		/* enable max98373 first */
-		ret = max98373_trigger(substream, cmd);
+		ret = max_98373_trigger(substream, cmd);
 		if (ret < 0)
 			break;
 
@@ -77,7 +77,7 @@ static int max98373_sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 		if (ret < 0)
 			break;
 
-		ret = max98373_trigger(substream, cmd);
+		ret = max_98373_trigger(substream, cmd);
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.25.1

