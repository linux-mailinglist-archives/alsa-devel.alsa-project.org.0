Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C1B7C7682
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:15:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD8084B;
	Thu, 12 Oct 2023 21:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD8084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138112;
	bh=+TEvCNxr+TbBo0n3kvy5FYli96u/PkE1rZMu67xyivU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aeeCh5apL3IC4wdVoCsxsC2EyCewN/ApYKcaub+gOv2cDK9+xewsCbMKeZ2Z8wkvr
	 sf/0mi8kBsoernrwqbS7bMvslmWfxW+LatBEoyqUKo2dmEclgmnXyL/MKuou9CTdGJ
	 eBEJFrZ1lDn3tvAOdNcUMxMdaDiUkLz686dvJs3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47661F8062F; Thu, 12 Oct 2023 21:10:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56CC2F8063C;
	Thu, 12 Oct 2023 21:10:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9918FF80578; Thu, 12 Oct 2023 21:09:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD6F9F80578
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD6F9F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zgntzgzt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137748; x=1728673748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+TEvCNxr+TbBo0n3kvy5FYli96u/PkE1rZMu67xyivU=;
  b=ZgntzgztsX97ADK490fWfoxE2egdr6uEoqoaA3tFuLbIUmT+jqxewPgt
   v99cVDcCIXHywPkNvvzgHgKmpqoEKZqtp2rBJLvUbSI6Q2QVhYM+9GVJw
   r8fZjasZ5GvGkWn9vQfJVGz7f9xVHwF15Alf6qqILL6rzEggg+tAssMeh
   et5nU+XaD/iNX4oUgx1FGi7dEg3ZovxIoZHx7mY3Z0qET6SAhfWc8kOoO
   08Htd5IhCZU2PprCeZQOpTBgVsZH94ia4sICV5aYrpZV8TqSz9qw3gIFI
   tw0ct/PKF99lR7qmpKGHtWnKXXNDZ6vG/QHyr497AAT+GHmPj5slUUu6d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060256"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060256"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108123"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108123"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 21/23] ASoC: Intel: sof_nau8825: use common module for HDMI
 link
Date: Thu, 12 Oct 2023 15:08:24 -0400
Message-Id: <20231012190826.142619-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F47ASMW2BPAMZSCLAZNXASQXQHMCHBHX
X-Message-ID-Hash: F47ASMW2BPAMZSCLAZNXASQXQHMCHBHX
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F47ASMW2BPAMZSCLAZNXASQXQHMCHBHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module for Intel HDMI DAI link initialization.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig       |  1 +
 sound/soc/intel/boards/sof_nau8825.c | 99 ++++++----------------------
 2 files changed, 22 insertions(+), 78 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 926305ba0511..126224824105 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -568,6 +568,7 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
 	select SND_SOC_NAU8315
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
+	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_NUVOTON_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 5c594e6d2fb4..116281262859 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -20,9 +20,8 @@
 #include <sound/soc-acpi.h>
 #include "../../codecs/nau8825.h"
 #include "../common/soc-intel-quirks.h"
-#include "hda_dsp_common.h"
+#include "sof_board_helpers.h"
 #include "sof_realtek_common.h"
-#include "sof_hdmi_common.h"
 #include "sof_maxim_common.h"
 #include "sof_nuvoton_common.h"
 #include "sof_ssp_common.h"
@@ -47,24 +46,6 @@
 
 static unsigned long sof_nau8825_quirk = SOF_NAU8825_SSP_CODEC(0);
 
-struct sof_card_private {
-	struct clk *mclk;
-	struct snd_soc_jack sof_headset;
-	struct sof_hdmi_private hdmi;
-	enum sof_ssp_codec codec_type;
-	enum sof_ssp_codec amp_type;
-};
-
-static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-
-	ctx->hdmi.hdmi_comp = dai->component;
-
-	return 0;
-}
-
 static struct snd_soc_jack_pin jack_pins[] = {
 	{
 		.pin    = "Headphone Jack",
@@ -80,8 +61,7 @@ static int sof_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-
-	struct snd_soc_jack *jack;
+	struct snd_soc_jack *jack = &ctx->headset_jack;
 	int ret;
 
 	/*
@@ -92,7 +72,7 @@ static int sof_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
 					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
 					 SND_JACK_BTN_3,
-					 &ctx->sof_headset,
+					 jack,
 					 jack_pins,
 					 ARRAY_SIZE(jack_pins));
 	if (ret) {
@@ -100,14 +80,12 @@ static int sof_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	jack = &ctx->sof_headset;
-
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
 	ret = snd_soc_component_set_jack(component, jack, NULL);
-
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
 		return ret;
@@ -182,13 +160,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 			return err;
 	}
 
-	if (!ctx->hdmi.idisp_codec)
-		return 0;
-
-	if (!ctx->hdmi.hdmi_comp)
-		return -EINVAL;
-
-	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
+	return sof_intel_board_card_late_probe(card);
 }
 
 static const struct snd_kcontrol_new sof_controls[] = {
@@ -276,12 +248,13 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			  int ssp_codec, int ssp_amp, int dmic_be_num,
-			  int hdmi_num)
+			  int hdmi_num, bool idisp_codec)
 {
-	struct snd_soc_dai_link_component *idisp_components;
 	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
-	int i, id = 0;
+	int i;
+	int id = 0;
+	int ret;
 
 	links = devm_kcalloc(dev, sof_audio_card_nau8825.num_links,
 			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
@@ -348,43 +321,12 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 	}
 
 	/* HDMI */
-	if (hdmi_num > 0) {
-		idisp_components = devm_kcalloc(dev,
-						hdmi_num,
-						sizeof(struct snd_soc_dai_link_component),
-						GFP_KERNEL);
-		if (!idisp_components)
-			goto devm_err;
-	}
 	for (i = 1; i <= hdmi_num; i++) {
-		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-						"iDisp%d", i);
-		if (!links[id].name)
-			goto devm_err;
+		ret = sof_intel_board_set_intel_hdmi_link(dev, &links[id], id,
+							  i, idisp_codec);
+		if (ret)
+			return NULL;
 
-		links[id].id = id;
-		links[id].cpus = &cpus[id];
-		links[id].num_cpus = 1;
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "iDisp%d Pin", i);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
-
-		idisp_components[i - 1].name = "ehdaudio0D2";
-		idisp_components[i - 1].dai_name = devm_kasprintf(dev,
-								  GFP_KERNEL,
-								  "intel-hdmi-hifi%d",
-								  i);
-		if (!idisp_components[i - 1].dai_name)
-			goto devm_err;
-
-		links[id].codecs = &idisp_components[i - 1];
-		links[id].num_codecs = 1;
-		links[id].platforms = platform_component;
-		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].init = (i == 1) ? sof_hdmi_init : NULL;
-		links[id].dpcm_playback = 1;
-		links[id].no_pcm = 1;
 		id++;
 	}
 
@@ -472,7 +414,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int dmic_be_num, hdmi_num;
+	int dmic_be_num;
 	int ret, ssp_amp, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -489,11 +431,11 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	/* default number of DMIC DAI's */
 	dmic_be_num = 2;
-	hdmi_num = (sof_nau8825_quirk & SOF_NAU8825_NUM_HDMIDEV_MASK) >>
+	ctx->hdmi_num = (sof_nau8825_quirk & SOF_NAU8825_NUM_HDMIDEV_MASK) >>
 			SOF_NAU8825_NUM_HDMIDEV_SHIFT;
 	/* default number of HDMI DAI's */
-	if (!hdmi_num)
-		hdmi_num = 3;
+	if (!ctx->hdmi_num)
+		ctx->hdmi_num = 3;
 
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
@@ -504,7 +446,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_codec = sof_nau8825_quirk & SOF_NAU8825_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
-	sof_audio_card_nau8825.num_links = 1 + dmic_be_num + hdmi_num;
+	sof_audio_card_nau8825.num_links = 1 + dmic_be_num + ctx->hdmi_num;
 
 	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_nau8825.num_links++;
@@ -514,7 +456,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
 					      ssp_codec, ssp_amp, dmic_be_num,
-					      hdmi_num);
+					      ctx->hdmi_num,
+					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
 
@@ -638,7 +581,7 @@ MODULE_AUTHOR("David Lin <ctlin0@nuvoton.com>");
 MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_NUVOTON_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
-- 
2.39.2

