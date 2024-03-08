Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E278A876099
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 10:05:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 872AA83B;
	Fri,  8 Mar 2024 10:05:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 872AA83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709888723;
	bh=q07/xiG1a5n/c/8LAvQ0KqcgDLmF5An5u7sbwVefMzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=koy2OoP0sAG76p1ng7E4O1igOAL2JHfKDZZ9uLVkwL34zmW0BAna+cRqNuFmI6+QT
	 cwGYLHMX2oUSTt2cTbqKFkp11c5D2OJXbmyVR1ayajRJqcZB26IZVoN0ehrIYkoLnE
	 fNpuuk0aWYhj3VwGmBT9fsOxo+XwKkNHIGYjNJTc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94EE4F805D3; Fri,  8 Mar 2024 10:04:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0266F80580;
	Fri,  8 Mar 2024 10:04:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01215F80494; Fri,  8 Mar 2024 10:04:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97E86F80093
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 10:03:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97E86F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b06OLqDb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709888619; x=1741424619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q07/xiG1a5n/c/8LAvQ0KqcgDLmF5An5u7sbwVefMzI=;
  b=b06OLqDbVQ0X6PTocHm8Frx8hHtCXuPcK2Tx/UGLDRd2rfUwOdH2TRRO
   pjV6pK8XWdtn/1xGkvxMAzOZFz5v35KhLuR+Voe7/l0+u8ws8h3YfIK0f
   GhP2mh0e34755he+P0Wp44eY9PURWvhdBAj9S/BNt9GMfE281j4cGvLbP
   8Tvm6pKpJEASID459j33KXNNC8UuQ0CzZc9Q0PJiGaKBXcPzBBqYZcUw2
   RztaVR2nDMAmrsHdl/MG4ISu71hngbhVq6vs5rdguWON66gI0OU1fVdvN
   fRxT854gTMp9/tgWU84XVcotWFWkna1XObom6G4xI/Xo0gE4ahzk7ZS55
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15247021"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000";
   d="scan'208";a="15247021"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 01:03:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000";
   d="scan'208";a="10419297"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 01:03:34 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 5/5] ASoC: Intel: avs: i2s_test: Remove redundant dapm
 routes
Date: Fri,  8 Mar 2024 10:05:02 +0100
Message-Id: <20240308090502.2136760-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308090502.2136760-1-cezary.rojewski@intel.com>
References: <20240308090502.2136760-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C2NKPETTDMFFLBHDVL5QK63HLGVPF6KJ
X-Message-ID-Hash: C2NKPETTDMFFLBHDVL5QK63HLGVPF6KJ
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2NKPETTDMFFLBHDVL5QK63HLGVPF6KJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Remove unnecessary widgets and routes as they are created by
snd_soc_dapm_connect_dai_link_widgets() automatically.

Link: https://lore.kernel.org/all/20230612110958.592674-1-brent.lu@intel.com/
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/i2s_test.c | 79 ---------------------------
 1 file changed, 79 deletions(-)

diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 28f254eb0d03..282256d18cc6 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -54,76 +54,13 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	return 0;
 }
 
-static int avs_create_dapm_routes(struct device *dev, int ssp_port, int tdm_slot,
-				  struct snd_soc_dapm_route **routes, int *num_routes)
-{
-	struct snd_soc_dapm_route *dr;
-	const int num_dr = 2;
-
-	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
-	if (!dr)
-		return -ENOMEM;
-
-	dr[0].sink = devm_kasprintf(dev, GFP_KERNEL,
-				    AVS_STRING_FMT("ssp", "pb", ssp_port, tdm_slot));
-	dr[0].source = devm_kasprintf(dev, GFP_KERNEL,
-				      AVS_STRING_FMT("ssp", " Tx", ssp_port, tdm_slot));
-	if (!dr[0].sink || !dr[0].source)
-		return -ENOMEM;
-
-	dr[1].sink = devm_kasprintf(dev, GFP_KERNEL,
-				    AVS_STRING_FMT("ssp", " Rx", ssp_port, tdm_slot));
-	dr[1].source = devm_kasprintf(dev, GFP_KERNEL,
-				      AVS_STRING_FMT("ssp", "cp", ssp_port, tdm_slot));
-	if (!dr[1].sink || !dr[1].source)
-		return -ENOMEM;
-
-	*routes = dr;
-	*num_routes = num_dr;
-
-	return 0;
-}
-
-static int avs_create_dapm_widgets(struct device *dev, int ssp_port, int tdm_slot,
-				   struct snd_soc_dapm_widget **widgets, int *num_widgets)
-{
-	struct snd_soc_dapm_widget *dw;
-	const int num_dw = 2;
-
-	dw = devm_kcalloc(dev, num_dw, sizeof(*dw), GFP_KERNEL);
-	if (!dw)
-		return -ENOMEM;
-
-	dw[0].id = snd_soc_dapm_hp;
-	dw[0].reg = SND_SOC_NOPM;
-	dw[0].name = devm_kasprintf(dev, GFP_KERNEL,
-				    AVS_STRING_FMT("ssp", "pb", ssp_port, tdm_slot));
-	if (!dw[0].name)
-		return -ENOMEM;
-
-	dw[1].id = snd_soc_dapm_mic;
-	dw[1].reg = SND_SOC_NOPM;
-	dw[1].name = devm_kasprintf(dev, GFP_KERNEL,
-				    AVS_STRING_FMT("ssp", "cp", ssp_port, tdm_slot));
-	if (!dw[1].name)
-		return -ENOMEM;
-
-	*widgets = dw;
-	*num_widgets = num_dw;
-
-	return 0;
-}
-
 static int avs_i2s_test_probe(struct platform_device *pdev)
 {
-	struct snd_soc_dapm_widget *widgets;
-	struct snd_soc_dapm_route *routes;
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	const char *pname;
-	int num_routes, num_widgets;
 	int ssp_port, tdm_slot, ret;
 
 	mach = dev_get_platdata(dev);
@@ -156,26 +93,10 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = avs_create_dapm_routes(dev, ssp_port, tdm_slot, &routes, &num_routes);
-	if (ret) {
-		dev_err(dev, "Failed to create dapm routes: %d\n", ret);
-		return ret;
-	}
-
-	ret = avs_create_dapm_widgets(dev, ssp_port, tdm_slot, &widgets, &num_widgets);
-	if (ret) {
-		dev_err(dev, "Failed to create dapm widgets: %d\n", ret);
-		return ret;
-	}
-
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = dai_link;
 	card->num_links = 1;
-	card->dapm_routes = routes;
-	card->num_dapm_routes = num_routes;
-	card->dapm_widgets = widgets;
-	card->num_dapm_widgets = num_widgets;
 	card->fully_routed = true;
 
 	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
-- 
2.25.1

