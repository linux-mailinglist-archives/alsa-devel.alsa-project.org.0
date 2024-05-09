Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD6B8C1315
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39A84E80;
	Thu,  9 May 2024 18:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39A84E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272638;
	bh=5p/ULIDJcgG6EicAZJS+bv/Iz0bKhiKlJfRY4VecTMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aFMprJdsNk87Kugs5/OztjQ+1QSWpAHvCguq7LfCf02Bb3Tqcoq7ZnD6zUTLhChtf
	 HlLyF6U9YdZaauzmqMV7x2cZsATfP9aPnVCiSrgeN8nXvPsgpN2OQwKZ/RZEqWpdSf
	 XDbcB/uITRZM8F92f7LJFeb8+HZY2XUk2aZnQ1xo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B71EF806C3; Thu,  9 May 2024 18:35:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63232F806AE;
	Thu,  9 May 2024 18:35:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11634F80564; Thu,  9 May 2024 18:34:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 372CCF80152
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 372CCF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KvYdSqks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272480; x=1746808480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5p/ULIDJcgG6EicAZJS+bv/Iz0bKhiKlJfRY4VecTMk=;
  b=KvYdSqkscezSg0ordVJR6GMKbb80mO/lKxe/NPAsYMcINtJESmSPAQBO
   UQcnwgTdK2vhNK4jQLdoHKFb+o6ClRs1v6GGqZ5kt3gj6/ORBAHOrS5Hc
   0DiKSIDq75kuvHdBMKDAxxOLQ3vOXN29VLY+sXkJKRbR7nIdQabTA4t99
   Ol2WTzPgbqFi5BJpn/Lyl9FQVKazlN1Z9hpeXBiP0Uj+3hfdB4qPtBtk0
   zrzaJ2BfHT+LCpOgbgL3MYgIg/3S4W3ZbLVD+045nFsdX71tjVeXSeTZp
   ofY0seS1MOpS4TAmJi9RBAGTbWCpqJK5H0y3mwPfrpysBCwNBEkZfkeaV
   A==;
X-CSE-ConnectionGUID: wXGIMy3JRYWEGEvHBt8Miw==
X-CSE-MsgGUID: yRYRmTX6RU+YO2KYWVEW0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017584"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017584"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:31 -0700
X-CSE-ConnectionGUID: KdXl9t/DSvejQT5YJUi0bQ==
X-CSE-MsgGUID: yMK/7CQ6TiiSPnADrvEMUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33761030"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/18] ASoC: Intel: sof_sdw: add max98373 dapm routes
Date: Thu,  9 May 2024 11:34:11 -0500
Message-Id: <20240509163418.67746-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FVDCWKYP6IJU37WI7RVIOQTQ56CYZ7Q7
X-Message-ID-Hash: FVDCWKYP6IJU37WI7RVIOQTQ56CYZ7Q7
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVDCWKYP6IJU37WI7RVIOQTQ56CYZ7Q7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add dapm routes of max98373 to sdw driver and remove dependency of
maxim-common module.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig         | 1 -
 sound/soc/intel/boards/sof_sdw.c       | 1 -
 sound/soc/intel/boards/sof_sdw_maxim.c | 6 +++++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 17bd0f883b9e..3ed81ab649c5 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -681,7 +681,6 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_CS35L56_SDW
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
-	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	imply SND_SOC_SDW_MOCKUP
 	help
 	  Add support for Intel SoundWire-based platforms connected to
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b1595fdb500d..2b97972f85ef 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -2067,4 +2067,3 @@ MODULE_AUTHOR("Rander Wang <rander.wang@linux.intel.com>");
 MODULE_AUTHOR("Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index 432e5112415a..57c1a5fb17a9 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -11,7 +11,6 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
-#include "sof_maxim_common.h"
 
 static int maxim_part_id;
 #define SOF_SDW_PART_ID_MAX98363 0x8363
@@ -27,6 +26,11 @@ static const struct snd_kcontrol_new maxim_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
 
+static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
+	{ "Left Spk", NULL, "Left BE_OUT" },
+	{ "Right Spk", NULL, "Right BE_OUT" },
+};
+
 int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-- 
2.40.1

