Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFE584E5C7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 17:59:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39068DEE;
	Thu,  8 Feb 2024 17:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39068DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411585;
	bh=UdCYLIte7m8ilxEaeKXcyDxzS4kkNFr4Tmp4bU+PaIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VMX+24yoaSh7N2bu6L+zwNfw4dDhrHZ9BPCzDeS9bthbFTaX8t+CQPYv4pFAuK0ey
	 3paPDaUdFvKuwzJqOdrgRN9sOWd0kIfcuzm3pckqrEU+UCVzPKrgxBnOO7NPSHxEJ9
	 uuVO5u5LLV5zyo4z2kHFAmdGtytOtVkZVOUt+zDo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25BFCF80736; Thu,  8 Feb 2024 17:56:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4033F80715;
	Thu,  8 Feb 2024 17:56:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4759CF8063E; Thu,  8 Feb 2024 17:56:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22A24F80568
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22A24F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=frBzb+NG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411369; x=1738947369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UdCYLIte7m8ilxEaeKXcyDxzS4kkNFr4Tmp4bU+PaIY=;
  b=frBzb+NG6izZWCNSQUH8A47IzpnJkzzzwx1KDw3kt8VnWSapT03hkJx1
   TwesYyMazDOA+tiU92al+5k5DMqjzfpO5H05Fq38qhiWU+agdiHgGtUPz
   wDEmFC8VnvRiz/zxVddvmz/Ia7LExmSyN1wWBdDr6ylatRBXJKTk7JGrd
   tKTq7moBDzqdlRCSQBFrf9zCdi0+aucC+4YOgW2wX+YoVXkyFdXhVrc8a
   p+P1ImpX2j/AyaKGFJRIQKoicQZT++ank5ohvwLJtHTzwWlxnyImQan4U
   e0OzrO2NdNI0s5fbApM29pdnHHqurVtLpunnHM+tCmZ+wBaIH2zEBH9Yv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675364"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675364"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690198"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:00 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/24] ASoC: Intel: sof_sdw_rt_sdca_jack_common: use helper to
 get codec dai by name
Date: Thu,  8 Feb 2024 10:55:32 -0600
Message-Id: <20240208165545.93811-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 47JLPUV55GBMIDGLZOZKKYQECEM2OQ7L
X-Message-ID-Hash: 47JLPUV55GBMIDGLZOZKKYQECEM2OQ7L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47JLPUV55GBMIDGLZOZKKYQECEM2OQ7L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Use helper to get codec dai by name.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                    |  1 +
 sound/soc/intel/boards/sof_board_helpers.c        |  2 +-
 sound/soc/intel/boards/sof_board_helpers.h        |  2 +-
 .../intel/boards/sof_sdw_rt_sdca_jack_common.c    | 15 +++++++++++++--
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 8fd5e7f83054..18ac3ce0752e 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -677,6 +677,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
+	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_MAX98363
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_MAX98373_SDW
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 9c08d3e54e3b..088894ff4165 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -585,7 +585,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 EXPORT_SYMBOL_NS(sof_intel_board_set_dai_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
 struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
-					  const char *dai_name[], int num_dais)
+					  const char * const dai_name[], int num_dais)
 {
 	struct snd_soc_dai *dai;
 	int index;
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index b626198f685d..f42d5d640321 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -119,6 +119,6 @@ int sof_intel_board_set_hdmi_in_link(struct device *dev,
 				     int ssp_hdmi);
 
 struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
-					  const char *dai_name[], int num_dais);
+					  const char * const dai_name[], int num_dais);
 
 #endif /* __SOF_INTEL_BOARD_HELPERS_H */
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index d9c283829fc7..4f2e105a1124 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -15,6 +15,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
+#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 /*
@@ -84,15 +85,24 @@ static struct snd_soc_jack_pin rt_sdca_jack_pins[] = {
 	},
 };
 
+static const char * const jack_codecs[] = {
+	"rt711", "rt712", "rt713"
+};
+
 static int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
 
+	codec_dai = get_codec_dai_by_name(rtd, jack_codecs, ARRAY_SIZE(jack_codecs));
+	if (!codec_dai)
+		return -EINVAL;
+
+	component = codec_dai->component;
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 					  "%s hs:%s-sdca",
 					  card->components, component->name_prefix);
@@ -213,3 +223,4 @@ int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 
 	return 0;
 }
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

