Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED77C767D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:14:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66019E7C;
	Thu, 12 Oct 2023 21:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66019E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138062;
	bh=444YwLklG04ymgeVtbgM9fKkbLDRhpb1PpUV8AnjXpw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xp+qTyGhgDRUUzeZ9Mmy34iW/DmyhABqbshdNWOBDFK/L7Z/sszk9lXnkkvBVVUp2
	 N0ge0SY3jusPkS62RnFaYD5CULY4/Kte9WE2JSpSQ/zkp3AVO8ridcHOAHoS3vlIFK
	 wBjEk2BIQP0KYJwkSpzH19hztWVoIYtwuxvpoofs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7253CF80616; Thu, 12 Oct 2023 21:09:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B40AFF80616;
	Thu, 12 Oct 2023 21:09:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E45AF8015B; Thu, 12 Oct 2023 21:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64497F8015B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64497F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BkVZr5KU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137746; x=1728673746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=444YwLklG04ymgeVtbgM9fKkbLDRhpb1PpUV8AnjXpw=;
  b=BkVZr5KUInDBdfnlbK7GpH0ODbolVDlVnJF8RAg5So7QtPR2SiPomPBI
   2sVjTUUVY3dAU5wZHno1AZqv3CtI0m3k7tngw0dgCh2Lle1MsxZpG+7Aa
   Uo0oROxfmwOKUR4kwLJB7+QTbbJyrzzfXqEVnn8V3Elmv9GOagTWuCrvi
   iE9aCIuO0u4ddBZYKXTRiAlWGzPxNtSAcc50N6zG+83bV3vqBXm3N0dsH
   NUB1qV1OM10qua3QS/3/piwTK1lmRvhoDcPoS6TYDMg3GDolgvYqNpKFY
   11kaKHbwkJSJyIr22tk9k8Wj/BgcaYcFa9PYejzcWiUH4GkaktZ2paNe5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060230"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060230"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108108"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108108"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/23] ASoC: Intel: sof_sdw: use sof_hdmi_private to init HDMI
Date: Thu, 12 Oct 2023 15:08:20 -0400
Message-Id: <20231012190826.142619-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ITONYNXBU2VDEVXZJDKAMPSJIHLUPPRY
X-Message-ID-Hash: ITONYNXBU2VDEVXZJDKAMPSJIHLUPPRY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITONYNXBU2VDEVXZJDKAMPSJIHLUPPRY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use sof_hdmi_private structure instead of a link list of sof_hdmi_pcm
structure for HDMI dai link initialization since hdac-hdmi support is
removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 12 ++++------
 sound/soc/intel/boards/sof_sdw_common.h |  4 ++--
 sound/soc/intel/boards/sof_sdw_hdmi.c   | 30 ++++---------------------
 3 files changed, 10 insertions(+), 36 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index cb5d71350f58..c5d555cc6f8e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1542,8 +1542,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	return 0;
 }
 
-#define IDISP_CODEC_MASK	0x4
-
 static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -1587,7 +1585,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	}
 
 	if (mach_params->codec_mask & IDISP_CODEC_MASK) {
-		ctx->idisp_codec = true;
+		ctx->hdmi.idisp_codec = true;
 
 		if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
 			hdmi_num = SOF_TGL_HDMI_COUNT;
@@ -1757,7 +1755,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", i + 1);
 		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d Pin", i + 1);
 
-		if (ctx->idisp_codec) {
+		if (ctx->hdmi.idisp_codec) {
 			codec_name = "ehdaudio0D2";
 			codec_dai_name = devm_kasprintf(dev, GFP_KERNEL,
 							"intel-hdmi-hifi%d", i + 1);
@@ -1769,7 +1767,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, name,
 					   1, 0, // HDMI only supports playback
 					   cpu_dai_name, codec_name, codec_dai_name,
-					   sof_sdw_hdmi_init, NULL);
+					   i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
 		if (ret)
 			return ret;
 
@@ -1814,7 +1812,7 @@ static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 		}
 	}
 
-	if (ctx->idisp_codec)
+	if (ctx->hdmi.idisp_codec)
 		ret = sof_sdw_hdmi_card_late_probe(card);
 
 	return ret;
@@ -1893,8 +1891,6 @@ static int mc_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
 	snd_soc_card_set_drvdata(card, ctx);
 
 	dmi_check_system(sof_sdw_quirk_table);
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index bfdeab4be1a7..e6b98523b4e7 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/types.h>
 #include <sound/soc.h>
+#include "sof_hdmi_common.h"
 
 #define MAX_NO_PROPS 2
 #define MAX_HDMI_NUM 4
@@ -94,9 +95,8 @@ struct sof_sdw_codec_info {
 };
 
 struct mc_private {
-	struct list_head hdmi_pcm_list;
-	bool idisp_codec;
 	struct snd_soc_jack sdw_headset;
+	struct sof_hdmi_private hdmi;
 	struct device *headset_codec_dev; /* only one headset per card */
 	struct device *amp_dev1, *amp_dev2;
 	/* To store SDW Pin index for each SoundWire link */
diff --git a/sound/soc/intel/boards/sof_sdw_hdmi.c b/sound/soc/intel/boards/sof_sdw_hdmi.c
index 7e07aa685573..f34fabdf9d93 100644
--- a/sound/soc/intel/boards/sof_sdw_hdmi.c
+++ b/sound/soc/intel/boards/sof_sdw_hdmi.c
@@ -15,47 +15,25 @@
 #include "sof_sdw_common.h"
 #include "hda_dsp_common.h"
 
-struct hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-	int device;
-};
-
 int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct hdmi_pcm *pcm;
 
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	/* dai_link id is 1:1 mapped to the PCM device */
-	pcm->device = rtd->dai_link->id;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
+	ctx->hdmi.hdmi_comp = dai->component;
 
 	return 0;
 }
 
-#define NAME_SIZE	32
 int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct hdmi_pcm *pcm;
-	struct snd_soc_component *component = NULL;
 
-	if (!ctx->idisp_codec)
+	if (!ctx->hdmi.idisp_codec)
 		return 0;
 
-	if (list_empty(&ctx->hdmi_pcm_list))
+	if (!ctx->hdmi.hdmi_comp)
 		return -EINVAL;
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct hdmi_pcm,
-			       head);
-	component = pcm->codec_dai->component;
-
-	return hda_dsp_hdmi_build_controls(card, component);
+	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
 }
-- 
2.39.2

