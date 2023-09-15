Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 707DF7A1F17
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:45:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FA29A4A;
	Fri, 15 Sep 2023 14:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FA29A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781948;
	bh=YXSSgOw5N8MwBgTNoSH8ULGEgSmUm7QP4kIXSJZ0t0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cdELOA+hgozQ/UY/DVem2mSJ+rQ4F2HIDA7zFz8VUmwvynht3E0JxoX9348wveKyY
	 jsc85D411LURoB6S5QkgVc/UZ2yoeU3RximkH0FnEMTWsLuDs9W4u4IvdAGYV/+4ct
	 1/E6G+sioZoihTm+BM0vlMx/VvBWf5kC/a/rbtZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABE70F80634; Fri, 15 Sep 2023 14:41:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA984F8062E;
	Fri, 15 Sep 2023 14:41:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79749F805CA; Fri, 15 Sep 2023 14:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D758F805B2
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D758F805B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nZJptxmA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781646; x=1726317646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YXSSgOw5N8MwBgTNoSH8ULGEgSmUm7QP4kIXSJZ0t0o=;
  b=nZJptxmA8ORiTlkSTeL3gY6yzjX88PPUqZsM8dD0M0+R2amAp31ilQdI
   bNNKUAbBJjPd3TPB84P3HRk0t0nl04tIsHVNTNBCDrKi/t/aQeKVczrdh
   42k9fQVSRkEIbmsxgfRHtM4x6O5075MzWokVVB8tz8N4Z386Af3lfFbiC
   ZEgIN6idVCGyrulqJ2z68TkfvLtAtqcEZXhYdFlxhy7h28kh7DuasBRzN
   iiLsO1+fEzIbF2A2Tt7yXVm2AspzkkrkqocEF9K7xosn/k+bJnSXiH7wX
   8s2/gxxn243TP9oEH1Bs90deKS0O4EVXXlMg1PypMvNqmJSnaLS6j/O5S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653221"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653221"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304639"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304639"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:41 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	brent.lu@intel.com,
	uday.m.bhat@intel.com,
	balamurugan.c@intel.com
Subject: [PATCH 14/19] ASoC: Intel: sof_nau8825: use nuvoton-common module
Date: Fri, 15 Sep 2023 20:48:47 +0800
Message-Id: <20230915124852.1696857-15-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5A5TGGMMDGHWVANP3DIPVOBK6ZSSSBQ6
X-Message-ID-Hash: 5A5TGGMMDGHWVANP3DIPVOBK6ZSSSBQ6
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A5TGGMMDGHWVANP3DIPVOBK6ZSSSBQ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use nuvoton-common module to support nau8318 speaker amplifier.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig       |  1 +
 sound/soc/intel/boards/sof_nau8825.c | 13 +++----------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index d32098e0c576..f3901a6259f7 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -568,6 +568,7 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
+	select SND_SOC_INTEL_SOF_NUVOTON_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	select SND_SOC_INTEL_SOF_SSP_COMMON
 	help
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 1e4fa5dbe0f6..1e4e58f22ca6 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -23,6 +23,7 @@
 #include "hda_dsp_common.h"
 #include "sof_realtek_common.h"
 #include "sof_maxim_common.h"
+#include "sof_nuvoton_common.h"
 #include "sof_ssp_common.h"
 
 #define NAME_SIZE 32
@@ -336,13 +337,6 @@ static struct snd_soc_dai_link_component rt1019p_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component nau8318_components[] = {
-	{
-		.name = "NVTN2012:00",
-		.dai_name = "nau8315-hifi",
-	}
-};
-
 static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			  int ssp_codec, int ssp_amp, int dmic_be_num,
@@ -478,9 +472,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			links[id].ops = &max_98373_ops;
 			break;
 		case CODEC_NAU8318:
-			links[id].codecs = nau8318_components;
-			links[id].num_codecs = ARRAY_SIZE(nau8318_components);
-			links[id].init = speaker_codec_init;
+			nau8318_set_dai_link(&links[id]);
 			break;
 		case CODEC_RT1015P:
 			sof_rt1015p_dai_link(&links[id]);
@@ -715,5 +707,6 @@ MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_NUVOTON_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.25.1

