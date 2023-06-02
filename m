Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F96720A51
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:30:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEDB4828;
	Fri,  2 Jun 2023 22:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEDB4828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737826;
	bh=awpwyubtmhnnNndQN6CyyVyikHgGbaotccuv9IspnT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LwIZRmjWrV3lH7iB2hD+QnQmNMnXR3TPxtT49O7AAL49GT0BeKFyV0EW1gH8v1XV8
	 R5hTfDvVWK8CTOq8/hFukVfFB39mAsjfckPbNXVi1VgmHL2A5agxDPKeD5ebMrgG/a
	 +viZluYBmHGXKj1aEinh5AFhpCvbSAwXrMX1mHPk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39F74F8068D; Fri,  2 Jun 2023 22:24:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A42FF8068C;
	Fri,  2 Jun 2023 22:24:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 823C8F8062E; Fri,  2 Jun 2023 22:24:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAE75F80568
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAE75F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DXhIZi/d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737398; x=1717273398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=awpwyubtmhnnNndQN6CyyVyikHgGbaotccuv9IspnT0=;
  b=DXhIZi/djz4q7JX7p3cDeEEsnSF0snyG6XZabscClbRXMcPRNWbMq879
   CuDFRNtUOKlra07BL5aSudCtdqxN+2eL3ggk7wMZRQlCmAb4wVdu3ZHoU
   Z1sy66Mw/+XXAQPaFI4pc3cRjEaEUMfX27SPJeDWtjDPzDYgR0JarBFLj
   L6TNqRxq3w0/nfBlG8IArbsGlNGyLxSUAaQlbyO+Jex9uRoSfakgH2LmB
   iFd/MhHepCwootgZfrqIuIPThbFi8Z7IoqFaa0dFzTAL4kWC2lDyLnN0a
   /ZjRvi+M6Aa8o28owiwo18jYxzeo88EIELgrUk4iTzqinUoxY8vq+mrVd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811336"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811336"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020053"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020053"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 25/28] ASoC: Intel: sof_sdw: Modify maxim helper functions and
 structure names
Date: Fri,  2 Jun 2023 15:22:22 -0500
Message-Id: <20230602202225.249209-26-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KAEGSOXX7DJ3DZJHNDOJMB7XXIN72W6Y
X-Message-ID-Hash: KAEGSOXX7DJ3DZJHNDOJMB7XXIN72W6Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAEGSOXX7DJ3DZJHNDOJMB7XXIN72W6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uday M Bhat <uday.m.bhat@intel.com>

Init function and structure names are modified to use maxim
instead of max98373. Card components and speaker names are
updated based on part id.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_common.h | 12 +++---
 sound/soc/intel/boards/sof_sdw_maxim.c  | 52 +++++++++++++++----------
 3 files changed, 39 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 60ce8100e1dc..04d050eac00d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -805,7 +805,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "max98373-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
-				.init = sof_sdw_mx8373_init,
+				.init = sof_sdw_maxim_init,
 			},
 		},
 		.dai_num = 1,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index f98d1ded5b1a..64cfa5d1aceb 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -182,12 +182,12 @@ int sof_sdw_rt715_sdca_init(struct snd_soc_card *card,
 			    struct sof_sdw_codec_info *info,
 			    bool playback);
 
-/* MAX98373 support */
-int sof_sdw_mx8373_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
-			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
-			bool playback);
+/* MAXIM codec support */
+int sof_sdw_maxim_init(struct snd_soc_card *card,
+		       const struct snd_soc_acpi_link_adr *link,
+		       struct snd_soc_dai_link *dai_links,
+		       struct sof_sdw_codec_info *info,
+		       bool playback);
 
 /* RT5682 support */
 int sof_sdw_rt5682_init(struct snd_soc_card *card,
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index 3d7df58c0f1d..3cc47ae98c5e 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2020 Intel Corporation
 //
-// sof_sdw_max98373 - Helpers to handle 2x MAX98373
+// sof_sdw_maxim - Helpers to handle maxim codecs
 // codec devices from generic machine driver
 
 #include <linux/device.h>
@@ -13,12 +13,15 @@
 #include "sof_sdw_common.h"
 #include "sof_maxim_common.h"
 
-static const struct snd_soc_dapm_widget mx8373_widgets[] = {
+static int maxim_part_id;
+#define SOF_SDW_PART_ID_MAX98373 0x8373
+
+static const struct snd_soc_dapm_widget maxim_widgets[] = {
 	SND_SOC_DAPM_SPK("Left Spk", NULL),
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
-static const struct snd_kcontrol_new mx8373_controls[] = {
+static const struct snd_kcontrol_new maxim_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Left Spk"),
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
@@ -29,22 +32,25 @@ static int spk_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s spk:mx8373",
-					  card->components);
+					  "%s spk:mx%04x",
+					  card->components, maxim_part_id);
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, mx8373_controls,
-					ARRAY_SIZE(mx8373_controls));
+	dev_dbg(card->dev, "soundwire maxim card components assigned : %s\n",
+		card->components);
+
+	ret = snd_soc_add_card_controls(card, maxim_controls,
+					ARRAY_SIZE(maxim_controls));
 	if (ret) {
-		dev_err(card->dev, "mx8373 ctrls addition failed: %d\n", ret);
+		dev_err(card->dev, "mx%04x ctrls addition failed: %d\n", maxim_part_id, ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, mx8373_widgets,
-					ARRAY_SIZE(mx8373_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, maxim_widgets,
+					ARRAY_SIZE(maxim_widgets));
 	if (ret) {
-		dev_err(card->dev, "mx8373 widgets addition failed: %d\n", ret);
+		dev_err(card->dev, "mx%04x widgets addition failed: %d\n", maxim_part_id, ret);
 		return ret;
 	}
 
@@ -130,19 +136,25 @@ static int mx8373_sdw_late_probe(struct snd_soc_card *card)
 	return snd_soc_dapm_sync(dapm);
 }
 
-int sof_sdw_mx8373_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
-			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
-			bool playback)
+int sof_sdw_maxim_init(struct snd_soc_card *card,
+		       const struct snd_soc_acpi_link_adr *link,
+		       struct snd_soc_dai_link *dai_links,
+		       struct sof_sdw_codec_info *info,
+		       bool playback)
 {
 	info->amp_num++;
 	if (info->amp_num == 2)
 		dai_links->init = spk_init;
 
-	info->codec_card_late_probe = mx8373_sdw_late_probe;
-
-	dai_links->ops = &max_98373_sdw_ops;
-
+	maxim_part_id = info->part_id;
+	switch (maxim_part_id) {
+	case SOF_SDW_PART_ID_MAX98373:
+		info->codec_card_late_probe = mx8373_sdw_late_probe;
+		dai_links->ops = &max_98373_sdw_ops;
+		break;
+	default:
+		dev_err(card->dev, "Invalid maxim_part_id %#x\n", maxim_part_id);
+		return -EINVAL;
+	}
 	return 0;
 }
-- 
2.37.2

