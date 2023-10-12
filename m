Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4CD7C7675
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:12:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECCEDE0F;
	Thu, 12 Oct 2023 21:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECCEDE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697137954;
	bh=s51Zolb2EqGSytG8ya80leYqFLdiwRxImIF8zSGBIXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TViuuiJcntRc1SUOK9xCgJ1qQY/q0p8b2mxXrb8rYvQUYP7U/YM4AoWy50UHdRXPa
	 qoMwJ/53OABKR++Y5lNsvERwgqr+Q6TKptIpwQqWBiSyQk7fwA1dQbdvbzfT3OIxY8
	 RYVzoSbvdS+nl6Yraz0rpse8dQqOmQXW3MVoZW6M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29204F805EB; Thu, 12 Oct 2023 21:09:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AA51F805E8;
	Thu, 12 Oct 2023 21:09:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A975F805D2; Thu, 12 Oct 2023 21:09:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF3B1F80557
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF3B1F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SplQO8nu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137743; x=1728673743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s51Zolb2EqGSytG8ya80leYqFLdiwRxImIF8zSGBIXg=;
  b=SplQO8nuZMBqcUi+Vdfv3xlkCtPXL6Qa+t+3YO5sGVTwZ6WsAZYvpD45
   lxHvABTGMMVzrjdxMJyuqDkle5rNAujekrddAMOxt+jwSQMtABcie0rar
   5LkTyrrKhn/xkXq4DGp51gxPrcCN3rFRcL0HCCiTyenNxt3GiUh6fW8A1
   /bNl8xR44YFOy5RpUS4R5OQBiyV0t+JM0w8GzG5fnlAIauvyB71iLHPRw
   DoKckhi9YKu0/HXYyngFb8Y4NnYJxuXSt/zOVGkVmJ5wNi00jmSK5z0cX
   W9JbySufix2ve6uJLQDq+I47ZLOid76+72JdLCkEduoNPxwQl3YUzyLnV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060204"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060204"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108078"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108078"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/23] ASoC: Intel: sof_rt5682: remove hdac-hdmi support
Date: Thu, 12 Oct 2023 15:08:13 -0400
Message-Id: <20231012190826.142619-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PHJWYXAOX22UBSFM23ABQAXOZQGNXG2V
X-Message-ID-Hash: PHJWYXAOX22UBSFM23ABQAXOZQGNXG2V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHJWYXAOX22UBSFM23ABQAXOZQGNXG2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Remove hdac-hdmi support code since we are now using
snd-hda-codec-hdmi codec driver for hdmi.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig      |  1 -
 sound/soc/intel/boards/sof_rt5682.c | 44 ++++-------------------------
 2 files changed, 5 insertions(+), 40 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index b5f3887e0323..38cb494e3ca0 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -495,7 +495,6 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_RT5682S
 	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 991763efb7d2..e256430b65a8 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -23,15 +23,12 @@
 #include "../../codecs/rt5682.h"
 #include "../../codecs/rt5682s.h"
 #include "../../codecs/rt5645.h"
-#include "../../codecs/hdac_hdmi.h"
 #include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
 #include "sof_maxim_common.h"
 #include "sof_realtek_common.h"
 #include "sof_ssp_common.h"
 
-#define NAME_SIZE 32
-
 #define SOF_RT5682_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
 #define SOF_RT5682_SSP_CODEC_MASK			(GENMASK(2, 0))
 #define SOF_RT5682_MCLK_EN			BIT(3)
@@ -67,15 +64,12 @@ static int is_legacy_cpu;
 struct sof_hdmi_pcm {
 	struct list_head head;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_jack hdmi_jack;
-	int device;
 };
 
 struct sof_card_private {
 	struct clk *mclk;
 	struct snd_soc_jack sof_headset;
 	struct list_head hdmi_pcm_list;
-	bool common_hdmi_codec_drv;
 	bool idisp_codec;
 	enum sof_ssp_codec codec_type;
 	enum sof_ssp_codec amp_type;
@@ -242,8 +236,6 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (!pcm)
 		return -ENOMEM;
 
-	/* dai_link id is 1:1 mapped to the PCM device */
-	pcm->device = rtd->dai_link->id;
 	pcm->codec_dai = dai;
 
 	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
@@ -518,7 +510,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component = NULL;
 	struct snd_soc_dapm_context *dapm = &card->dapm;
-	char jack_name[NAME_SIZE];
 	struct sof_hdmi_pcm *pcm;
 	int err;
 
@@ -538,30 +529,9 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	if (list_empty(&ctx->hdmi_pcm_list))
 		return -EINVAL;
 
-	if (ctx->common_hdmi_codec_drv) {
-		pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm,
-				       head);
-		component = pcm->codec_dai->component;
-		return hda_dsp_hdmi_build_controls(card, component);
-	}
-
-	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
-		component = pcm->codec_dai->component;
-		snprintf(jack_name, sizeof(jack_name),
-			 "HDMI/DP, pcm=%d Jack", pcm->device);
-		err = snd_soc_card_jack_new(card, jack_name,
-					    SND_JACK_AVOUT, &pcm->hdmi_jack);
-
-		if (err)
-			return err;
-
-		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
-					  &pcm->hdmi_jack);
-		if (err < 0)
-			return err;
-	}
-
-	return hdac_hdmi_jack_port_init(component, &card->dapm);
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
+	component = pcm->codec_dai->component;
+	return hda_dsp_hdmi_build_controls(card, component);
 }
 
 static const struct snd_kcontrol_new sof_controls[] = {
@@ -834,7 +804,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].init = sof_hdmi_init;
+		links[id].init = (i == 1) ? sof_hdmi_init : NULL;
 		links[id].dpcm_playback = 1;
 		links[id].no_pcm = 1;
 		id++;
@@ -974,8 +944,8 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 
 static int sof_audio_probe(struct platform_device *pdev)
 {
+	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
-	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
 	int dmic_be_num, hdmi_num;
 	int ret, ssp_amp, ssp_codec;
@@ -989,8 +959,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dmi_check_system(sof_rt5682_quirk_table);
 
-	mach = pdev->dev.platform_data;
-
 	ctx->codec_type = sof_ssp_detect_codec_type(&pdev->dev);
 	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
 
@@ -1112,8 +1080,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
-
 	snd_soc_card_set_drvdata(&sof_audio_card_rt5682, ctx);
 
 	return devm_snd_soc_register_card(&pdev->dev,
-- 
2.39.2

