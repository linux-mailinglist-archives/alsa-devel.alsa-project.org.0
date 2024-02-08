Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F79384E5D5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 18:00:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7E92EA3;
	Thu,  8 Feb 2024 18:00:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7E92EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411650;
	bh=WbMrcOtxEPTqPuAD9SZO9DSAuLMiWP+miOcXhisgqok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IHOb13+3t5+q8OxIOEBwIjpk0llfQHbvO8S/uXTngUjsnOUbWtpoPvGefPG/WEdiY
	 Oc5cUvOXiiYV9wrCAU2oZ+LG4LsehgbbXUPTV4Fk8OVS4OknbDStPPS519fdj9pi7C
	 QPdxMBLE+Ddx4pxkdwunHUwNk2G7UYzeGsH2HobQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32449F805EC; Thu,  8 Feb 2024 17:57:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E10FF80878;
	Thu,  8 Feb 2024 17:57:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6C87F80637; Thu,  8 Feb 2024 17:56:25 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B2B16F80579
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2B16F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MiQVfxdg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411371; x=1738947371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WbMrcOtxEPTqPuAD9SZO9DSAuLMiWP+miOcXhisgqok=;
  b=MiQVfxdg2ZINiePtX8rmHeosGi6vSPAQgyv7D5v6OoiTTncuae5OdER3
   zGwSkvbb5e/mRWwLH5FsYhbONPvv+/RhXl5XqUwMwXtWGMcCkEZgG+SiL
   7UFbPoELHnw0iAEfPANAXf0rXLGZU87jvdecA2/SCKGSOF4blUWn4XBw5
   TbHCAeuqm9IuKA7H7G8mUBozP3UJYOr5yAVh/xYrK+CCe75lAjTjyEUgb
   jbbzxuM99ItZ0/h+735gdPvsKIoVJ0ZDl4HkiFso96iynRRK7HmvqgZQC
   dUgnihWibGP13V0iFjoAqHYvKYGrhiCPHD20FI1Ghk01clyrUOg0Vg2iK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675372"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675372"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690207"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:01 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/24] ASoC: Intel: sof_sdw_rt711: use helper to get codec dai
 by name
Date: Thu,  8 Feb 2024 10:55:33 -0600
Message-Id: <20240208165545.93811-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PRON5ESPFMAYAWVS4WMNEMQFVN6SGVEO
X-Message-ID-Hash: PRON5ESPFMAYAWVS4WMNEMQFVN6SGVEO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PRON5ESPFMAYAWVS4WMNEMQFVN6SGVEO/>
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
 sound/soc/intel/boards/sof_sdw_rt711.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 38782fdfcf15..5d8f90f2bf55 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -15,6 +15,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
+#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 /*
@@ -69,15 +70,24 @@ static struct snd_soc_jack_pin rt711_jack_pins[] = {
 	},
 };
 
+static const char * const jack_codecs[] = {
+	"rt711"
+};
+
 static int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
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
 					  "%s hs:rt711",
 					  card->components);
@@ -180,3 +190,4 @@ int sof_sdw_rt711_init(struct snd_soc_card *card,
 
 	return 0;
 }
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

