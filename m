Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D041384E5BB
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 17:59:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14DE8DEC;
	Thu,  8 Feb 2024 17:59:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14DE8DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411551;
	bh=rQO9FLpkFRLxbU1v+Ijha8xImycqkNNU8d2LzJfHFaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rsKcb3CqOZVkEXKAZn+DxfFx3CgXSoE2rGgoGcVOPlVJWGeI8O7Qt3YevNjq8j8Zp
	 ET9l/DwHG1ruLJFJv2Xi36hNuSKL+VrzjxNRNyF837lUEtVbkxQNQz310L5XsdB3lX
	 +GoUbVp13UOX8QBeIOczxJEBRkv7qE9LcwRleOyc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64A8FF805C9; Thu,  8 Feb 2024 17:56:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E88FF806DE;
	Thu,  8 Feb 2024 17:56:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 078F8F8060B; Thu,  8 Feb 2024 17:56:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DCE4F801EB
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DCE4F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eh/KHK39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411366; x=1738947366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rQO9FLpkFRLxbU1v+Ijha8xImycqkNNU8d2LzJfHFaU=;
  b=eh/KHK39dkTNiRi0TSR7g4otJwjAD/YeY73c/HH2JuqufkMsfhUFMUFB
   R1WWwVahe4YX5Oj+ImxNX3vmLByT1vU7rVQHyeyKcBvRf+kZeZvHXO8e2
   /iSCCoHXPatGhCneZXfP+IgTiQcWKI10f8mLJxp9P8bCxscbY8IkDsM2p
   3TD1fjMJpiN40pAJ95k7HOKeHqWKPorwYp4xilZ/l6Sy1AGcdc1BgsXNL
   gYY1p9vue8uhg4g82C1lbAJk2qUXEhvPnvmn5J+4dK1Kala8Xv7fFOH/3
   e2uVuoO2K6TLAOAXjiHX9e8dOvTqJ+e2jmCX/FMLdKD8jYaU6zP8IIHln
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675333"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675333"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690166"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:58 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/24] ASoC: Intel: sof_rt5682: dmi quirk cleanup for mtl
 boards
Date: Thu,  8 Feb 2024 10:55:27 -0600
Message-Id: <20240208165545.93811-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3T6V5J5TTN4ECXLMOGLISYEE4H464HY3
X-Message-ID-Hash: 3T6V5J5TTN4ECXLMOGLISYEE4H464HY3
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Some dmi quirks are duplicated since codec and amplifier type are
removed from board quirk. Remove redundant quirks.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 40 -----------------------------
 1 file changed, 40 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index fc2582045598..640d17c6cd35 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -154,46 +154,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
-			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98360_ALC5682I_I2S"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(2) |
-					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(3) |
-					SOF_BT_OFFLOAD_SSP(1) |
-					SOF_SSP_BT_OFFLOAD_PRESENT
-					),
-	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
-			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98360_ALC5682I_DISCRETE_I2S_BT"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(2) |
-					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(3) |
-					SOF_BT_OFFLOAD_SSP(1) |
-					SOF_SSP_BT_OFFLOAD_PRESENT
-					),
-	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
-			DMI_MATCH(DMI_OEM_STRING, "AUDIO-ALC1019_ALC5682I_I2S"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(2) |
-					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(3)
-					),
-	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
-- 
2.40.1

