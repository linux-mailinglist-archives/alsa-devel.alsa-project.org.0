Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E507C5381
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 14:20:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A9681675;
	Wed, 11 Oct 2023 14:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A9681675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697026814;
	bh=RyO1xqGSW3MjafxHkADBd+GajxGrSgb35YSpbUerElU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ofRux5RAHYtfem1Y7cXBpBiYADEwZ9HB2Cp/9EzsmhwBK9I56Jid4KM7xGiFQq6HO
	 qhj3X3wFUBEUYOI19d2OOnbTRQCfT1kEdNF6qr+Ed7VWmsSL3Xy5o1QDtNnpDdInpQ
	 5S9oX0/A3uy/v0n93KNI+dMI+r/9mZflB9GKVUmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 944E4F805D4; Wed, 11 Oct 2023 14:17:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57C98F805C9;
	Wed, 11 Oct 2023 14:17:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ECABF8055C; Wed, 11 Oct 2023 14:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 324F2F80552
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 14:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 324F2F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KFkv/cx2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697026638; x=1728562638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RyO1xqGSW3MjafxHkADBd+GajxGrSgb35YSpbUerElU=;
  b=KFkv/cx25ouZgbL5DI/q8hHPnFX320ynEP4UDDDcCnzTdxn4Or0x7pzr
   EHsjNRkZWQfWWL6ODQ74ydxeAHpvrc1xHfS1C0CpzhKaW4y5ckHIMZUEJ
   pNr1zU0jO9C/ZxpY2Q64boz0+h76StUawOkA+b+MBIHjz74kCAUHGp11m
   IHiK18XJYWxY/AV4WRiIRyRlmuitb2fxNOA6xoYF1McwL9wCltVZGE4ge
   QP9JGjlHlcgNf/T+XQpqolTnoG+Pmr0mB3KOm39bZ9k9BXFUUvTmBu2AD
   GzSYPjFHVoSrtslHWG1mErZ7UaL1DXoOLqds5LW5kETnYJAT3LkHwaDVQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374988453"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200";
   d="scan'208";a="374988453"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747428394"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200";
   d="scan'208";a="747428394"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 05:17:08 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 07/16] ASoC: Intel: avs: max98357a: Validate machine board
 configuration
Date: Wed, 11 Oct 2023 14:16:54 +0200
Message-Id: <20231011121703.363652-8-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011121703.363652-1-amadeuszx.slawinski@linux.intel.com>
References: <20231011121703.363652-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5GKQXJDKH7NCC37LKKC2ECGD7KYGIQL7
X-Message-ID-Hash: 5GKQXJDKH7NCC37LKKC2ECGD7KYGIQL7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GKQXJDKH7NCC37LKKC2ECGD7KYGIQL7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allow for board to be used with TDMs.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/max98357a.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index b9b20562c691..6ba7b6564279 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -12,6 +12,7 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
+#include "../utils.h"
 
 static const struct snd_kcontrol_new card_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Spk"),
@@ -46,7 +47,7 @@ avs_max98357a_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_pa
 }
 
 static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       struct snd_soc_dai_link **dai_link)
+			       int tdm_slot, struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -58,13 +59,15 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
 	platform->name = platform_name;
 
-	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
+	dl->name = devm_kasprintf(dev, GFP_KERNEL,
+				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
 	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
 	if (!dl->name || !dl->cpus || !dl->codecs)
 		return -ENOMEM;
 
-	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
+	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+					    AVS_STRING_FMT("SSP", " Pin", ssp_port, tdm_slot));
 	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "MX98357A:00");
 	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "HiFi");
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
@@ -93,13 +96,16 @@ static int avs_max98357a_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	const char *pname;
-	int ssp_port, ret;
+	int ssp_port, tdm_slot, ret;
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
-	ssp_port = __ffs(mach->mach_params.i2s_link_mask);
 
-	ret = avs_create_dai_link(dev, pname, ssp_port, &dai_link);
+	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
+	if (ret)
+		return ret;
+
+	ret = avs_create_dai_link(dev, pname, ssp_port, tdm_slot, &dai_link);
 	if (ret) {
 		dev_err(dev, "Failed to create dai link: %d", ret);
 		return ret;
-- 
2.34.1

