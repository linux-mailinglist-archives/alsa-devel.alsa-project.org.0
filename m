Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B6F7C53A9
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 14:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C9A516CB;
	Wed, 11 Oct 2023 14:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C9A516CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697026953;
	bh=rig0i5SlHvNLnqyGWw6lYF6YH9YHeCbrKue532/lv/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BeytZgpyaTGiF7Op03y4yw3nrlwcNGBcO23a5HYS6A6db//TwEj+9T8nxaliW6uuE
	 WMu4FfOeKydCcaB1Hy39Miq7P7mt45u2bkGbN7BRFkd3LQblpgpWNw6O0T6V5UKYNj
	 v60cqvtPjNrXBeNTK2lI+xEGZW5TLgcMxIahVsN8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53064F80563; Wed, 11 Oct 2023 14:20:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24B90F802E8;
	Wed, 11 Oct 2023 14:20:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C73C3F80553; Wed, 11 Oct 2023 14:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1756F802E8
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 14:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1756F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UfsWXQxZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697026635; x=1728562635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rig0i5SlHvNLnqyGWw6lYF6YH9YHeCbrKue532/lv/I=;
  b=UfsWXQxZOpyIjl4NwkUy7S5WcsKkO2mp5aDeL9PK0+UiH50Ze1ER4AxB
   cRhIkw2lzadDchyIDL/t3twy+lEKVJp98X+blXpz+cQZAExfjGPVvYSUI
   LmIz5ZZBVJzghp8rGVKehCMNHLt6oHb1TbY3B17jHFCxTLkCVn3Um4J57
   +OkuwYnHxgOlLnqm22GGV9DLGucOIQz3bPs2IJe1qFTHU54xXsHQ4v6Xh
   M3bGDRmFfBzvPIm9mtRF1OngFKvn8dklDZdP8zsmhww0Vdd13OiEsBgo3
   yac90kQf68qzo4H+i0RgNjpAlf4zthrWU6+ut4qnWmMC8EJMFyyE4LX5L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374988415"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200";
   d="scan'208";a="374988415"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747428364"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200";
   d="scan'208";a="747428364"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 05:17:04 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 05/16] ASoC: Intel: avs: rt274: Validate machine board
 configuration
Date: Wed, 11 Oct 2023 14:16:52 +0200
Message-Id: <20231011121703.363652-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011121703.363652-1-amadeuszx.slawinski@linux.intel.com>
References: <20231011121703.363652-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XZIQEEIKJXNTB5F3E27FBAUGZBUBU6LU
X-Message-ID-Hash: XZIQEEIKJXNTB5F3E27FBAUGZBUBU6LU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZIQEEIKJXNTB5F3E27FBAUGZBUBU6LU/>
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
 sound/soc/intel/avs/boards/rt274.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index b376d4c2d706..157183b1de24 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -13,6 +13,7 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include "../../../codecs/rt274.h"
+#include "../utils.h"
 
 #define AVS_RT274_FREQ_OUT	24000000
 #define AVS_RT274_BE_FIXUP_RATE	48000
@@ -145,7 +146,7 @@ static int avs_rt274_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pc
 }
 
 static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       struct snd_soc_dai_link **dai_link)
+			       int tdm_slot, struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -157,13 +158,15 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
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
 	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-INT34C2:00");
 	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, RT274_CODEC_DAI);
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
@@ -211,13 +214,16 @@ static int avs_rt274_probe(struct platform_device *pdev)
 	struct snd_soc_jack *jack;
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

