Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 202157C67A7
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 10:40:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C72BAE8;
	Thu, 12 Oct 2023 10:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C72BAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697100027;
	bh=l0z6R3tLkxrw0ftRKa62KF2GmKmj9rJlqEM7xSB5JOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s/P3fKgSzv+jFEE/bvZnCNiDjkwy5pTAq3hdPS6uJECgDDpNfwDklhxi+lF5nnist
	 QwHeD6KuXjdiMI8I9VbGxRBgKlVSY3SU/51gPbxltZL/5XYrIp7pzIY3Io4R3VCXfm
	 DRLGiUu7/SYdvv6dT/BQBRmuSzx5tLUdXyw7yw2I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3757F8057A; Thu, 12 Oct 2023 10:38:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E364F8057A;
	Thu, 12 Oct 2023 10:38:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33926F8057B; Thu, 12 Oct 2023 10:35:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13578F802E8
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 10:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13578F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZOU7e5E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697099718; x=1728635718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l0z6R3tLkxrw0ftRKa62KF2GmKmj9rJlqEM7xSB5JOQ=;
  b=ZOU7e5E59boEQj7zZsET2IImUx5d2i4ZIPDn4Dt/yCJL8DHuE24QYbsO
   rjzgqqncCkAX1W0hvT68/CKTWGPaZl/UUiZvfbr0LxyGelkbSAQH8VdkL
   2Ek1tKn6hf5Nqr18xsBFQx84ts3vyjTPt0AvNVylXG5iEdtvfmgf5gRF3
   7QGKc3YGN9sYd3bPQmMTuLqDHvdulseavF+CmtdyoSHphath8TyWNslqk
   /qW3YzXWyscUTvsaFsanTDiWDMeD+XolKvRWCp5LnCFiUuDyXIQfdbCwv
   2RcE34Yq7EnKO3f4CJWOrv8cvqhdodRBUYIyXRDKe41zNrKWkP0W67Skk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6417243"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="6417243"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 01:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824516602"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="824516602"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 01:35:13 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 04/16] ASoC: Intel: avs: i2s_test: Validate machine board
 configuration
Date: Thu, 12 Oct 2023 10:35:02 +0200
Message-Id: <20231012083514.492626-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
References: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P5L5OXP2SDGC7YLZC7MABANI2HRTZCFD
X-Message-ID-Hash: P5L5OXP2SDGC7YLZC7MABANI2HRTZCFD
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5L5OXP2SDGC7YLZC7MABANI2HRTZCFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I2S test board can be used in any SSP and TDM configuration.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/i2s_test.c | 55 ++++++++++++++++++---------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 1dd0c59a8d91..3d03e1eed3a9 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -12,9 +12,10 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
+#include "../utils.h"
 
 static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       struct snd_soc_dai_link **dai_link)
+			       int tdm_slot, struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -26,12 +27,14 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
 	platform->name = platform_name;
 
-	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
+	dl->name = devm_kasprintf(dev, GFP_KERNEL,
+				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
 	if (!dl->name || !dl->cpus)
 		return -ENOMEM;
 
-	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
+	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+					    AVS_STRING_FMT("SSP", " Pin", ssp_port, tdm_slot));
 	dl->codecs = &snd_soc_dummy_dlc;
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
@@ -51,7 +54,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	return 0;
 }
 
-static int avs_create_dapm_routes(struct device *dev, int ssp_port,
+static int avs_create_dapm_routes(struct device *dev, int ssp_port, int tdm_slot,
 				  struct snd_soc_dapm_route **routes, int *num_routes)
 {
 	struct snd_soc_dapm_route *dr;
@@ -61,13 +64,17 @@ static int avs_create_dapm_routes(struct device *dev, int ssp_port,
 	if (!dr)
 		return -ENOMEM;
 
-	dr[0].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%dpb", ssp_port);
-	dr[0].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
+	dr[0].sink = devm_kasprintf(dev, GFP_KERNEL,
+				    AVS_STRING_FMT("ssp", "pb", ssp_port, tdm_slot));
+	dr[0].source = devm_kasprintf(dev, GFP_KERNEL,
+				      AVS_STRING_FMT("ssp", " Tx", ssp_port, tdm_slot));
 	if (!dr[0].sink || !dr[0].source)
 		return -ENOMEM;
 
-	dr[1].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
-	dr[1].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%dcp", ssp_port);
+	dr[1].sink = devm_kasprintf(dev, GFP_KERNEL,
+				    AVS_STRING_FMT("ssp", " Rx", ssp_port, tdm_slot));
+	dr[1].source = devm_kasprintf(dev, GFP_KERNEL,
+				      AVS_STRING_FMT("ssp", "cp", ssp_port, tdm_slot));
 	if (!dr[1].sink || !dr[1].source)
 		return -ENOMEM;
 
@@ -77,7 +84,7 @@ static int avs_create_dapm_routes(struct device *dev, int ssp_port,
 	return 0;
 }
 
-static int avs_create_dapm_widgets(struct device *dev, int ssp_port,
+static int avs_create_dapm_widgets(struct device *dev, int ssp_port, int tdm_slot,
 				   struct snd_soc_dapm_widget **widgets, int *num_widgets)
 {
 	struct snd_soc_dapm_widget *dw;
@@ -89,13 +96,15 @@ static int avs_create_dapm_widgets(struct device *dev, int ssp_port,
 
 	dw[0].id = snd_soc_dapm_hp;
 	dw[0].reg = SND_SOC_NOPM;
-	dw[0].name = devm_kasprintf(dev, GFP_KERNEL, "ssp%dpb", ssp_port);
+	dw[0].name = devm_kasprintf(dev, GFP_KERNEL,
+				    AVS_STRING_FMT("ssp", "pb", ssp_port, tdm_slot));
 	if (!dw[0].name)
 		return -ENOMEM;
 
 	dw[1].id = snd_soc_dapm_mic;
 	dw[1].reg = SND_SOC_NOPM;
-	dw[1].name = devm_kasprintf(dev, GFP_KERNEL, "ssp%dcp", ssp_port);
+	dw[1].name = devm_kasprintf(dev, GFP_KERNEL,
+				    AVS_STRING_FMT("ssp", "cp", ssp_port, tdm_slot));
 	if (!dw[1].name)
 		return -ENOMEM;
 
@@ -115,33 +124,45 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	const char *pname;
 	int num_routes, num_widgets;
-	int ssp_port, ret;
+	int ssp_port, tdm_slot, ret;
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
-	ssp_port = __ffs(mach->mach_params.i2s_link_mask);
+
+	if (!avs_mach_singular_ssp(mach)) {
+		dev_err(dev, "Invalid SSP configuration\n");
+		return -EINVAL;
+	}
+	ssp_port = avs_mach_ssp_port(mach);
+
+	if (!avs_mach_singular_tdm(mach, ssp_port)) {
+		dev_err(dev, "Invalid TDM configuration\n");
+		return -EINVAL;
+	}
+	tdm_slot = avs_mach_ssp_tdm(mach, ssp_port);
 
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
 
-	card->name = devm_kasprintf(dev, GFP_KERNEL, "ssp%d-loopback", ssp_port);
+	card->name = devm_kasprintf(dev, GFP_KERNEL,
+				    AVS_STRING_FMT("ssp", "-loopback", ssp_port, tdm_slot));
 	if (!card->name)
 		return -ENOMEM;
 
-	ret = avs_create_dai_link(dev, pname, ssp_port, &dai_link);
+	ret = avs_create_dai_link(dev, pname, ssp_port, tdm_slot, &dai_link);
 	if (ret) {
 		dev_err(dev, "Failed to create dai link: %d\n", ret);
 		return ret;
 	}
 
-	ret = avs_create_dapm_routes(dev, ssp_port, &routes, &num_routes);
+	ret = avs_create_dapm_routes(dev, ssp_port, tdm_slot, &routes, &num_routes);
 	if (ret) {
 		dev_err(dev, "Failed to create dapm routes: %d\n", ret);
 		return ret;
 	}
 
-	ret = avs_create_dapm_widgets(dev, ssp_port, &widgets, &num_widgets);
+	ret = avs_create_dapm_widgets(dev, ssp_port, tdm_slot, &widgets, &num_widgets);
 	if (ret) {
 		dev_err(dev, "Failed to create dapm widgets: %d\n", ret);
 		return ret;
-- 
2.34.1

