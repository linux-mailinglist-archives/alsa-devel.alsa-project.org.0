Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4220C870A0E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 20:06:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD680828;
	Mon,  4 Mar 2024 20:06:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD680828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709579178;
	bh=q07/xiG1a5n/c/8LAvQ0KqcgDLmF5An5u7sbwVefMzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IYkXcLmGP7Ogjq0k8sK2W0F22zoGuDaZkfxIsRtMDU6PbUWH7HHtgJQOzC07Ecvth
	 XYo8Vo+BXpCF0dUDY3oj75NVHQxyqEhX3+w6jeMtjCUw0XDp/QHeD426QjIBklKC4p
	 VeByla/U1nDPVABjFAQ3tpmjJbOXBFbGwQsI318Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF4B6F80637; Mon,  4 Mar 2024 20:04:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED0FDF80637;
	Mon,  4 Mar 2024 20:04:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD96DF805CB; Mon,  4 Mar 2024 20:04:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 328C0F80571
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 20:04:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 328C0F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GISiBwGo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709579079; x=1741115079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q07/xiG1a5n/c/8LAvQ0KqcgDLmF5An5u7sbwVefMzI=;
  b=GISiBwGoybnsh8oME9TwKNQvt4Tg6Q3gQEw7O2Z9CFxWZdP6EKmH8CT6
   93EOV4Jw5rGfZIu3+k2IXklndD0GDrEM32zNK9kVjZ604xOhTBfuAX+j5
   RJBxPZJcmyndtHISrLajmXIYkXgknPcG6r66bWCbFt6HTAHTpYPlbFQt9
   vrEWeaovqe5qU4E/R8J3ooXRxKIMNwV0JK7HHq2SGwpBm574rqwjDvu5Q
   xtZ/F+B3Qs49eUUdkNOEBzFgjnsY3J+IMxFJ9wY35/Uxnun9eeEqRJZjI
   96ibTBWLZRgKYfLkyrOFCK+kREiCavmuZMSE/EPw3RMIfIMF+hdChC+hK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4257313"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="4257313"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 11:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="13788298"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2024 11:04:33 -0800
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
Subject: [PATCH 5/5] ASoC: Intel: avs: i2s_test: Remove redundant dapm routes
Date: Mon,  4 Mar 2024 20:05:36 +0100
Message-Id: <20240304190536.1783332-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304190536.1783332-1-cezary.rojewski@intel.com>
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UQWWA6NL4ISHHKU342FSHCUVNFWG4EAJ
X-Message-ID-Hash: UQWWA6NL4ISHHKU342FSHCUVNFWG4EAJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQWWA6NL4ISHHKU342FSHCUVNFWG4EAJ/>
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

