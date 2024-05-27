Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A34398D0E4E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:40:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E90B7DEC;
	Mon, 27 May 2024 21:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E90B7DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838832;
	bh=lw+prEpe7Ix+5pRhOT5340vUgwTIFSCUbquZ/PYAjDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G0OQZ4htiqM+z8rhdiNKIQfP8ibrMRxH9Om+47zDdsEaxiNAuz/jouXuFfLxfSrvp
	 fdhbL7rBnWyUeJFOegEf+ApfZ3SQQp29AR7CWHg6lvI15JA9Btgp1N5BfTFhU7FiyM
	 9v1FNllqZXI1ul/xra+w0I6nif9ycGAd7G6Iu4OE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E02F3F807DE; Mon, 27 May 2024 21:37:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17EE9F805DF;
	Mon, 27 May 2024 21:37:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE019F80772; Mon, 27 May 2024 21:37:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37A04F805C5
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37A04F805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k8MyzLgs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838586; x=1748374586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lw+prEpe7Ix+5pRhOT5340vUgwTIFSCUbquZ/PYAjDI=;
  b=k8MyzLgsDFeht6I9f8jjWw3XXueCGPuHhQUAd8YAA5gsYLPvPThQuj0Y
   Pe6jyIxJl+j/6qqRtX5As4jETuQMwZ9ejs9BugVn3BHp5o7h3i5ABo95n
   bgL+jsrSd5YRiZzFcgjKmArh1qSThLaalbRFlT186ttQwlYNDCFkny0xm
   vlzpIjOcppyah4qC3kywskmN/fhz74yjSuYnq39KD7dUDZ5HOSqComaLg
   WtZqLv4PBc37mz8Bz+503pEuyCW3FFkiroCpbAkVueGGcFay+NZ1X0pe2
   ag9w0u41va5SllP6Y+uomziQ1z0fIsLU9jf7IgNtRw3XN6dQrDfzIWKvV
   g==;
X-CSE-ConnectionGUID: SY0WkWFLQBG5sdhBPbK0RA==
X-CSE-MsgGUID: aOj0IMByRlyb7nuWmCaeRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339400"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339400"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:22 -0700
X-CSE-ConnectionGUID: jY6XLPGMRjWg04bM6vQt4w==
X-CSE-MsgGUID: qTBBpu8UQb+QOmigmDFwIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029798"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/18] ASoC: Intel: sof_da7219: remove local max98373 ops
Date: Mon, 27 May 2024 14:35:51 -0500
Message-ID: <20240527193552.165567-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3Y56NF5YEUB26LQKT3MTGSLBASTUVDU4
X-Message-ID-Hash: 3Y56NF5YEUB26LQKT3MTGSLBASTUVDU4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3Y56NF5YEUB26LQKT3MTGSLBASTUVDU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Since maxim-module could detect tdm slot number in runtime, we could
remove local ops and use maxim-module to handle max98373.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.h |  2 -
 sound/soc/intel/boards/sof_da7219.c        | 44 ----------------------
 2 files changed, 46 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index dfcc2c5c25cc..faba847bb7c9 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -86,12 +86,10 @@ enum {
 /*
  * sof_da7219_private: private data for da7219 machine driver
  *
- * @is_jsl_board: true for JSL boards
  * @mclk_en: true for mclk pin is connected
  * @pll_bypass: true for PLL bypass mode
  */
 struct sof_da7219_private {
-	bool is_jsl_board;
 	bool mclk_en;
 	bool pll_bypass;
 };
diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 886771e9b9d6..0e3c352a1672 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -178,40 +178,6 @@ static void da7219_codec_exit(struct snd_soc_pcm_runtime *rtd)
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
 
-static int max98373_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
-	int ret, j;
-
-	for (j = 0; j < runtime->dai_link->num_codecs; j++) {
-		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, j);
-
-		if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) {
-			/* vmon_slot_no = 0 imon_slot_no = 1 for TX slots */
-			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 3, 4, 16);
-			if (ret < 0) {
-				dev_err(runtime->dev, "DEV0 TDM slot err:%d\n", ret);
-				return ret;
-			}
-		}
-		if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
-			/* vmon_slot_no = 2 imon_slot_no = 3 for TX slots */
-			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xC, 3, 4, 16);
-			if (ret < 0) {
-				dev_err(runtime->dev, "DEV1 TDM slot err:%d\n", ret);
-				return ret;
-			}
-		}
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops max98373_ops = {
-	.hw_params = max98373_hw_params,
-};
-
 static int card_late_probe(struct snd_soc_card *card)
 {
 	return sof_intel_board_card_late_probe(card);
@@ -276,14 +242,6 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 		break;
 	case CODEC_MAX98373:
 		max_98373_dai_link(dev, ctx->amp_link);
-
-		if (ctx->da7219.is_jsl_board) {
-			ctx->amp_link->ops = &max98373_ops; /* use local ops */
-		} else {
-			/* TBD: implement the amp for later platform */
-			dev_err(dev, "max98373 not support yet\n");
-			return -EINVAL;
-		}
 		break;
 	case CODEC_MAX98390:
 		max_98390_dai_link(dev, ctx->amp_link);
@@ -388,8 +346,6 @@ static int audio_probe(struct platform_device *pdev)
 			break;
 		}
 	} else if (board_quirk & SOF_DA7219_JSL_BOARD) {
-		ctx->da7219.is_jsl_board = true;
-
 		/* overwrite the DAI link order for JSL boards */
 		ctx->link_order_overwrite = JSL_LINK_ORDER;
 
-- 
2.43.0

