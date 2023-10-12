Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C06127C7670
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 026C1857;
	Thu, 12 Oct 2023 21:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 026C1857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697137894;
	bh=U4KvNWDD4j/cATO2R9hRQEqu1e6gpnMn76GJaNJP2qM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fwk1dgzz+kBBfXopDUsG0/kvqc10hh+QhHgVD6iVwT6bkf2M9xHBpXRHXUl3ItB4B
	 /yH+8xR6iqu5yq84Q9cSDNVo2QW8Xp7bPBs/8i1JNCVU+be68vihQcHm+k3QIaEQ3f
	 slTe/42nbnBki4MDYjvVNwOMT/GEAy1tunuTSvgc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94A94F805C4; Thu, 12 Oct 2023 21:09:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B600EF80553;
	Thu, 12 Oct 2023 21:09:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 305DCF805C6; Thu, 12 Oct 2023 21:09:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 518E7F80536
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 518E7F80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GfZNQmGe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137741; x=1728673741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U4KvNWDD4j/cATO2R9hRQEqu1e6gpnMn76GJaNJP2qM=;
  b=GfZNQmGeY1bSEh3tcv7QlSmxh8IJbiCgn8W3muGBIR2BOLu8I8lYgqU4
   cFcobZC60J13nFh0eor2oX2vZhXKrK+/HacQQp5Twffb8WF3NApA8Ng8+
   15a7I069+avJXiKVDCCu/XIeIBHTP6ILQ5NAunV/fUCu8h1ZT6mzJDbph
   a0iQZfFtFDMxejWwDSAhXyRFrOZL36V+p4Qyy+92neT16FdrI8VLMOkTS
   cI9CCsV9kEsKGD18wKNUtVEOcMrc271TvY2hfvDjpiDMqVK+gwxsnI24B
   d12culnmq5eBbbYoZP9H/TBe/cAp7NSZuksGkSYBIZWlUgaSXq+u4cs8F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060190"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060190"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108068"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108068"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/23] ASoC: Intel: sof_cs42l42: remove hdac-hdmi support
Date: Thu, 12 Oct 2023 15:08:10 -0400
Message-Id: <20231012190826.142619-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RT3Z2MRZTETDWR7QMIVOEPPYNYNFJZ7A
X-Message-ID-Hash: RT3Z2MRZTETDWR7QMIVOEPPYNYNFJZ7A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RT3Z2MRZTETDWR7QMIVOEPPYNYNFJZ7A/>
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
 sound/soc/intel/boards/Kconfig       |  1 -
 sound/soc/intel/boards/sof_cs42l42.c | 45 ++++------------------------
 2 files changed, 5 insertions(+), 41 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index fa3252b6f1bf..d130244c8705 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -514,7 +514,6 @@ config SND_SOC_INTEL_SOF_CS42L42_MACH
 	select SND_SOC_CS42L42
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_SSP_COMMON
diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 56582e561fb7..eeae65ac06c2 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -19,14 +19,11 @@
 #include <sound/sof.h>
 #include <sound/soc-acpi.h>
 #include <dt-bindings/sound/cs42l42.h>
-#include "../../codecs/hdac_hdmi.h"
 #include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
 #include "sof_maxim_common.h"
 #include "sof_ssp_common.h"
 
-#define NAME_SIZE 32
-
 #define SOF_CS42L42_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
 #define SOF_CS42L42_SSP_CODEC_MASK		(GENMASK(2, 0))
 #define SOF_CS42L42_SSP_AMP_SHIFT		4
@@ -73,14 +70,11 @@ static unsigned long sof_cs42l42_quirk = SOF_CS42L42_SSP_CODEC(2);
 struct sof_hdmi_pcm {
 	struct list_head head;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_jack hdmi_jack;
-	int device;
 };
 
 struct sof_card_private {
 	struct snd_soc_jack headset_jack;
 	struct list_head hdmi_pcm_list;
-	bool common_hdmi_codec_drv;
 	enum sof_ssp_codec codec_type;
 	enum sof_ssp_codec amp_type;
 };
@@ -95,8 +89,6 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (!pcm)
 		return -ENOMEM;
 
-	/* dai_link id is 1:1 mapped to the PCM device */
-	pcm->device = rtd->dai_link->id;
 	pcm->codec_dai = dai;
 
 	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
@@ -186,37 +178,14 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component = NULL;
-	char jack_name[NAME_SIZE];
 	struct sof_hdmi_pcm *pcm;
-	int err;
 
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
@@ -478,7 +447,7 @@ static int create_hdmi_dai_links(struct device *dev,
 		links[*id].num_codecs = 1;
 		links[*id].platforms = platform_component;
 		links[*id].num_platforms = ARRAY_SIZE(platform_component);
-		links[*id].init = sof_hdmi_init;
+		links[*id].init = (i == 1) ? sof_hdmi_init : NULL;
 		links[*id].dpcm_playback = 1;
 		links[*id].no_pcm = 1;
 
@@ -611,8 +580,8 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
 static int sof_audio_probe(struct platform_device *pdev)
 {
+	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
-	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
 	int dmic_be_num, hdmi_num;
 	int ret, ssp_bt, ssp_amp, ssp_codec;
@@ -624,8 +593,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (pdev->id_entry && pdev->id_entry->driver_data)
 		sof_cs42l42_quirk = (unsigned long)pdev->id_entry->driver_data;
 
-	mach = pdev->dev.platform_data;
-
 	ctx->codec_type = sof_ssp_detect_codec_type(&pdev->dev);
 	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
 
@@ -677,8 +644,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
-
 	snd_soc_card_set_drvdata(&sof_audio_card_cs42l42, ctx);
 
 	return devm_snd_soc_register_card(&pdev->dev,
-- 
2.39.2

