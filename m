Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C79AD7C7674
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F706DED;
	Thu, 12 Oct 2023 21:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F706DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697137943;
	bh=hJTSU45gaPt8RmP5/cJTPf6QIRWxPG+c/h4xsB7Ccyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XPev1u6LWrAbCUyGdaYQgYFXFYOrxYew23rxT+toB5gJPQbqMfUPEGLplMG5l68M/
	 7hx8FKWSkE037inv2lUXftyjVlAw7Bdjtv0Q0j+HCB1qnIBieFLVjrHd2tWL7ofUkG
	 6Ws0PKYK1OfxJQ1b5Rp22AwAZpo6OZnXKfqDs3X8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A099F805E6; Thu, 12 Oct 2023 21:09:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33CE8F80564;
	Thu, 12 Oct 2023 21:09:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93E67F805B5; Thu, 12 Oct 2023 21:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E726F8055B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E726F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GrX2ME71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137743; x=1728673743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hJTSU45gaPt8RmP5/cJTPf6QIRWxPG+c/h4xsB7Ccyo=;
  b=GrX2ME71083zN/1ptoXx5eaa06RmBX/OpW+6Vi+7QeN3wUP7AYvMrp2P
   vLKJV3z2UE7tScZ4MbbVp7oGNMJ06/Mcb3UWafMA+w5d8Y9ImkK8h6pof
   Q56scvZkjH94tbSRkUD/yZ/rkbR678Kt/x1KkXgGP97aZW2c5NFl0hrPO
   6q6qGnK2nm2YHiWP5Cy3B/CK86oTCAB5rpfPfhzf+SAJcxCB1dqmSo2yW
   LomFzuRf76qR89ce+oJSvLJtaN/NYOaLGEXhzvqxWx9/j2tad2VhOMP3G
   Re7amxugm94c3Oj+8+hou/nrDpj5WLSDG+ijBkioN0OJv36ekXC0P/icY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060208"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060208"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108082"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108082"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/23] ASoC: Intel: sof_ssp_amp: remove hdac-hdmi support
Date: Thu, 12 Oct 2023 15:08:14 -0400
Message-Id: <20231012190826.142619-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KDTHP35OM6HXEANAKOP7QEUPWBZKIUJK
X-Message-ID-Hash: KDTHP35OM6HXEANAKOP7QEUPWBZKIUJK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDTHP35OM6HXEANAKOP7QEUPWBZKIUJK/>
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
 sound/soc/intel/boards/sof_ssp_amp.c | 45 ++++------------------------
 2 files changed, 5 insertions(+), 41 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 38cb494e3ca0..d67867ce4c74 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -634,7 +634,6 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH
 	select SND_SOC_RT1308
 	select SND_SOC_CS35L41_I2C
 	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	select SND_SOC_INTEL_SOF_CIRRUS_COMMON
diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 22abcf9f7f74..a3ac1e8c4c07 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -17,14 +17,11 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/sof.h>
-#include "../../codecs/hdac_hdmi.h"
 #include "hda_dsp_common.h"
 #include "sof_realtek_common.h"
 #include "sof_cirrus_common.h"
 #include "sof_ssp_common.h"
 
-#define NAME_SIZE 32
-
 /* SSP port ID for speaker amplifier */
 #define SOF_AMPLIFIER_SSP(quirk)		((quirk) & GENMASK(3, 0))
 #define SOF_AMPLIFIER_SSP_MASK			(GENMASK(3, 0))
@@ -65,14 +62,11 @@ static unsigned long sof_ssp_amp_quirk = SOF_AMPLIFIER_SSP(2);
 
 struct sof_hdmi_pcm {
 	struct list_head head;
-	struct snd_soc_jack sof_hdmi;
 	struct snd_soc_dai *codec_dai;
-	int device;
 };
 
 struct sof_card_private {
 	struct list_head hdmi_pcm_list;
-	bool common_hdmi_codec_drv;
 	bool idisp_codec;
 	enum sof_ssp_codec amp_type;
 };
@@ -100,9 +94,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component = NULL;
-	char jack_name[NAME_SIZE];
 	struct sof_hdmi_pcm *pcm;
-	int err;
 
 	if (!(sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT))
 		return 0;
@@ -114,30 +106,9 @@ static int sof_card_late_probe(struct snd_soc_card *card)
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
-					    SND_JACK_AVOUT, &pcm->sof_hdmi);
-
-		if (err)
-			return err;
-
-		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
-					  &pcm->sof_hdmi);
-		if (err < 0)
-			return err;
-	}
-
-	return hdac_hdmi_jack_port_init(component, &card->dapm);
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
+	component = pcm->codec_dai->component;
+	return hda_dsp_hdmi_build_controls(card, component);
 }
 
 static struct snd_soc_card sof_ssp_amp_card = {
@@ -175,8 +146,6 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (!pcm)
 		return -ENOMEM;
 
-	/* dai_link id is 1:1 mapped to the PCM device */
-	pcm->device = rtd->dai_link->id;
 	pcm->codec_dai = dai;
 
 	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
@@ -348,7 +317,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
-			links[id].init = sof_hdmi_init;
+			links[id].init = (i == 1) ? sof_hdmi_init : NULL;
 			links[id].dpcm_playback = 1;
 			links[id].no_pcm = 1;
 			id++;
@@ -387,8 +356,8 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
 static int sof_ssp_amp_probe(struct platform_device *pdev)
 {
+	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
-	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
 	int dmic_be_num = 0, hdmi_num = 0;
 	int ret, ssp_codec;
@@ -400,8 +369,6 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	if (pdev->id_entry && pdev->id_entry->driver_data)
 		sof_ssp_amp_quirk = (unsigned long)pdev->id_entry->driver_data;
 
-	mach = pdev->dev.platform_data;
-
 	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
 
 	if (dmi_check_system(chromebook_platforms) || mach->mach_params.dmic_num > 0)
@@ -467,8 +434,6 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
-
 	snd_soc_card_set_drvdata(&sof_ssp_amp_card, ctx);
 
 	return devm_snd_soc_register_card(&pdev->dev, &sof_ssp_amp_card);
-- 
2.39.2

