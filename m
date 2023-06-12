Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC96572B601
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 05:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93DB6DE5;
	Mon, 12 Jun 2023 05:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93DB6DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686539967;
	bh=oLPs9XeZPB29Gk2q8nALmTV059usJ3RGv1ZaTgGsjRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b0jqjY341L4EerAehqVf5vfCZb0TpWKFzj8Cbyof3FswvgTC+P4bB7CXgBFUqHRRM
	 3SnT2U0ga9qOxCaiZZ/HMpEXOBhc54klHViTgY15n0MfhgCEO5Tgm2vpCGeTlEb1BK
	 nth/goU0IrPVldouFE1WZYTJG6pmdHGiuiYU7iMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B6D1F805EF; Mon, 12 Jun 2023 05:15:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8B1FF805E3;
	Mon, 12 Jun 2023 05:15:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38AC6F805CA; Mon, 12 Jun 2023 05:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAA10F80246
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 05:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAA10F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nPKCFTWi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686539701; x=1718075701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oLPs9XeZPB29Gk2q8nALmTV059usJ3RGv1ZaTgGsjRQ=;
  b=nPKCFTWihJ0e1mOfPC7N8agoYedehtprCoWRcQbpoCR7mPvbTmXfxcFc
   lpEf/mt4FPe6Jv6PA+3ExdBDfKQNMHFKm2O3eMGoHDXvPon7EIeHK6Ay5
   hobTlYIAKbJNpaFfv2Toq625J9/XJDeoFANMjw9PoNAQK0DagClClTd2h
   j9+8uv1u7t71r0wON/n69IJKxEr3zUN6LDWDQbVuc5gLzg3a+kqEdlpKZ
   1nx+AAlQNG48s+BXlWjx57ldMoMiQVZzmR+eBcd4Fegyqs6UCH50WyjTu
   jcMU0/FP8abYM+F/LSm7wGSkK4wFOsJDokVMWxJkXUWFxV2Bhy2F49vQr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347578953"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400";
   d="scan'208";a="347578953"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 20:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="776191923"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400";
   d="scan'208";a="776191923"
Received: from brentlu-desktop.itwn.intel.com ([10.5.252.92])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jun 2023 20:14:54 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	linux-kernel@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/12] ASoC: Intel: avs-max98373: remove redundant dapm routes
Date: Mon, 12 Jun 2023 19:09:51 +0800
Message-Id: <20230612110958.592674-6-brent.lu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612110958.592674-1-brent.lu@intel.com>
References: <20230612110958.592674-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SCLA24DDZC6TKUJMVLWZDM5KYZYX2JAU
X-Message-ID-Hash: SCLA24DDZC6TKUJMVLWZDM5KYZYX2JAU
X-MailFrom: brent.lu@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SCLA24DDZC6TKUJMVLWZDM5KYZYX2JAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Two routes "Left HiFi Playback<-sspX Tx" and
"Right HiFi Playback<-sspX Tx" are created by
snd_soc_dapm_connect_dai_link_widgets() automatically. Remove the
duplicate routes.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/avs/boards/max98373.c | 45 ++-------------------------
 1 file changed, 3 insertions(+), 42 deletions(-)

diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 8e221ecd34b0..3833251ade26 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -141,47 +141,14 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	return 0;
 }
 
-static int avs_create_dapm_routes(struct device *dev, int ssp_port,
-				  struct snd_soc_dapm_route **routes, int *num_routes)
-{
-	struct snd_soc_dapm_route *dr;
-	const int num_base = ARRAY_SIZE(card_base_routes);
-	const int num_dr = num_base + 2;
-	int idx;
-
-	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
-	if (!dr)
-		return -ENOMEM;
-
-	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
-
-	idx = num_base;
-	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Left HiFi Playback");
-	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
-	if (!dr[idx].sink || !dr[idx].source)
-		return -ENOMEM;
-
-	idx++;
-	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Right HiFi Playback");
-	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
-	if (!dr[idx].sink || !dr[idx].source)
-		return -ENOMEM;
-
-	*routes = dr;
-	*num_routes = num_dr;
-
-	return 0;
-}
-
 static int avs_max98373_probe(struct platform_device *pdev)
 {
-	struct snd_soc_dapm_route *routes;
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	const char *pname;
-	int num_routes, ssp_port, ret;
+	int ssp_port, ret;
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
@@ -193,12 +160,6 @@ static int avs_max98373_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = avs_create_dapm_routes(dev, ssp_port, &routes, &num_routes);
-	if (ret) {
-		dev_err(dev, "Failed to create dapm routes: %d", ret);
-		return ret;
-	}
-
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
@@ -214,8 +175,8 @@ static int avs_max98373_probe(struct platform_device *pdev)
 	card->num_controls = ARRAY_SIZE(card_controls);
 	card->dapm_widgets = card_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(card_widgets);
-	card->dapm_routes = routes;
-	card->num_dapm_routes = num_routes;
+	card->dapm_routes = card_base_routes;
+	card->num_dapm_routes = ARRAY_SIZE(card_base_routes);
 	card->fully_routed = true;
 
 	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
-- 
2.34.1

