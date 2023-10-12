Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED57C67D4
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 10:41:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE4BE73;
	Thu, 12 Oct 2023 10:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE4BE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697100107;
	bh=I4lmN1gig4vyawfJ5Qjfb5ATCZk4ADN3yc84/zAiIsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JW0v9Y3RVLF76/3FtyBpiB+oi664E8BamcSwD6w6doTldh7mZ1if+XsrGl9ESsbjy
	 wVKXjctld9T/WrwDAw1oRURLqD1XyDNHmPJ+5LROyP829BrH16TTlc2ZQte3VQ5WFh
	 eQGFVwrqZGzXvMn6L3TzR4COVBCELpp9NegjxyL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BE7AF805D3; Thu, 12 Oct 2023 10:39:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACEBAF805B2;
	Thu, 12 Oct 2023 10:38:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 996F9F80310; Thu, 12 Oct 2023 10:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 560E5F80558
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 10:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 560E5F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nS3s0AfP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697099729; x=1728635729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I4lmN1gig4vyawfJ5Qjfb5ATCZk4ADN3yc84/zAiIsg=;
  b=nS3s0AfPhEvZY20OIvMCDIm+GQbVB/E6Kf7gZsZcXt7RLAfFWRB5MBz2
   QjzEIpDgcNds04bko14blKannUaNHMm4ia8QTuW2fyz6zC2rS/dL/jduM
   xCC9z7fAtg3pga46srcphYjmBjoJrFp0rcE396brWGwP9XeHDqihhipct
   kOX1tO7C8bzKSLKsJ6XaO4hNo7oJ5DnG+sUiFR/jQm8roKA7UsUXi4vnf
   gcY8b6fU2MEw92lMV41wTTn8LZDaiYKqTgmXfpJSch1+Ug8bZHMX2aQGg
   WArBMc9B3xjrU5Kiv/UbVvbcPkmQn2EDXDrBc9j7E9FQ33FgIb2ytPOXh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6417284"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="6417284"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 01:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824516650"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="824516650"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 01:35:24 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 10/16] ASoC: Intel: avs: es8336: Validate machine board
 configuration
Date: Thu, 12 Oct 2023 10:35:08 +0200
Message-Id: <20231012083514.492626-11-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
References: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CVYCD77E45GBI5UXL7ZN6TFCTL5LIZJX
X-Message-ID-Hash: CVYCD77E45GBI5UXL7ZN6TFCTL5LIZJX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVYCD77E45GBI5UXL7ZN6TFCTL5LIZJX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allow for board to be used with TDMs.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/es8336.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 6d2a7c8e445e..f972ef64d284 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -19,6 +19,7 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <asm/intel-family.h>
+#include "../utils.h"
 
 #define ES8336_CODEC_DAI	"ES8316 HiFi"
 
@@ -194,7 +195,7 @@ static int avs_es8336_be_fixup(struct snd_soc_pcm_runtime *runtime,
 	return 0;
 }
 static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       struct snd_soc_dai_link **dai_link)
+			       int tdm_slot, struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -206,13 +207,15 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
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
 	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-ESSX8336:00");
 	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, ES8336_CODEC_DAI);
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
@@ -261,13 +264,16 @@ static int avs_es8336_probe(struct platform_device *pdev)
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

