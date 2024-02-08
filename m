Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF8984E5D4
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 18:00:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC756B76;
	Thu,  8 Feb 2024 18:00:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC756B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411637;
	bh=iEbs4hKQ7oQNy0OveBLK1smzNs90IJnUIpGk9xHZW30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hlds+jng7v8zwssTNAQJ1y8STf70VK6i2iTm8Gdy9cRlt2kd69Mv6jq6sVH4/MROo
	 yYdz2hgi39QlqrVOHXjDSdqn9Q7ESEkU86Z+qLY+v62J0M2zWnkJZ17gusDtL+qnKX
	 EtoY5CLMg5RbGFRThobJREAGx5p7KWi3PRMdqzzQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BECCAF80814; Thu,  8 Feb 2024 17:57:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1AB9F80844;
	Thu,  8 Feb 2024 17:57:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D115EF8057B; Thu,  8 Feb 2024 17:56:25 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 15A6CF8057B
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15A6CF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LZ8cZsly
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411371; x=1738947371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iEbs4hKQ7oQNy0OveBLK1smzNs90IJnUIpGk9xHZW30=;
  b=LZ8cZslyZpF62FPYMx8tzfLzUmfTupZeV2YNrNEMgN9bPcvvRyu5nIeV
   F3GguOnVCMGw9iMmNkyqSOn/KCk2wdP63TGtJrHy8GOqCIHZ6t3AUPyZ0
   payDiLWkmLhYPGr6rEM7qNApFETqYRVcD3ERbW8V0Y6b3MgN9KAsuW2S4
   99Pextyq0hrh/yLHzhg/KHg1fiDt3aooGXxe8dRCspChnwINaD8jQNNRa
   c+aZcX3qAmvd+7dLaOmhHK+UIwvT6jz7mORikD6KPfvKB2yx5xzqcdj2g
   v6GaahmuyC0CwV15JLQEvih01db8pX4DXyGmugGxclrwtB1ekxVqBauta
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675389"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675389"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690229"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:02 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/24] ASoC: Intel: sof_sdw_rt700: use helper to get codec dai
 by name
Date: Thu,  8 Feb 2024 10:55:35 -0600
Message-Id: <20240208165545.93811-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LNG6WHV7NKE6X4OGQ7D6AZQMXAWN2XZT
X-Message-ID-Hash: LNG6WHV7NKE6X4OGQ7D6AZQMXAWN2XZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNG6WHV7NKE6X4OGQ7D6AZQMXAWN2XZT/>
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
 sound/soc/intel/boards/sof_sdw_rt700.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index a1714afe8515..d9a45392bbbf 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -13,6 +13,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
+#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 static const struct snd_soc_dapm_widget rt700_widgets[] = {
@@ -45,15 +46,24 @@ static struct snd_soc_jack_pin rt700_jack_pins[] = {
 	},
 };
 
+static const char * const jack_codecs[] = {
+	"rt700"
+};
+
 static int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd)
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
 					  "%s hs:rt700",
 					  card->components);
@@ -127,3 +137,4 @@ int sof_sdw_rt700_init(struct snd_soc_card *card,
 
 	return 0;
 }
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

