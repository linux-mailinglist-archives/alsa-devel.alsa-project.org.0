Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5568D0E32
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:37:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1A53DEC;
	Mon, 27 May 2024 21:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1A53DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838673;
	bh=/4pDOYBWNcEf9AroYPd8usrLXvoOq2NmzsOK87JNjVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FVTvgZccTounypLB5pl0gXz59/aGlbdIVG08cMYHLmPFO2dtaIKLxHGpuwhHGv6qk
	 5zYUqkahc8pC9fQmoyPopAzv81Byx/ZNSdGOKbYx7wqGzvPKF6OtZULDOY38kvVwNe
	 d+9ZwHtt/JqsHp3AQLPTyNgYO7+fVG4LEQEn1zAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 069E8F80622; Mon, 27 May 2024 21:36:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3361F8061F;
	Mon, 27 May 2024 21:36:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E135F805AE; Mon, 27 May 2024 21:36:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B1B83F80496
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B83F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CuUgn/fG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838578; x=1748374578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/4pDOYBWNcEf9AroYPd8usrLXvoOq2NmzsOK87JNjVU=;
  b=CuUgn/fGNpmIeqOlW6cD+Ehj44NX5Aqh333rbnBiBFINly1o02wq3h4r
   hR43plmr3pnI7vgRZYiASM4lTDdv/yoerROoUPLu9PAYusXWCbUCxbVK/
   7Vn/lttB+w0Z276e5Cm+uhljXHS42i/5qwZq25G0DEeNsJtzf8VmOdJ5p
   b3YqhWyDT24nRyhqDQ62kPKkmv4UWlqALVSZ2uD1reMgx9gyIcNujetUT
   ltFDbPL+mS9PvgriEcQ2gi8QIVSRWJ1CJfj1pJ4P2YjTcvs4apD0Mm3WU
   rVru3N6B5f6VAJKsglPIJluiUyjcykyy43hF8+5e6XsjcSkQnZvfhRisd
   Q==;
X-CSE-ConnectionGUID: TL9hSmT5QKStQqXf6TOITw==
X-CSE-MsgGUID: ZRJsierlSsaolR8o03idDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339334"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339334"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:13 -0700
X-CSE-ConnectionGUID: OvXNVPloTm+aiktCL3ThUA==
X-CSE-MsgGUID: C4GsiRY9SzeO5T+dbVAHqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029761"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/18] ASoC: Intel: sof_sdw_rt_dmic: use from dai parameter
Date: Mon, 27 May 2024 14:35:39 -0500
Message-ID: <20240527193552.165567-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TLUCQ2YPGZAEBKFVILN3EK7XPMBBY6ZR
X-Message-ID-Hash: TLUCQ2YPGZAEBKFVILN3EK7XPMBBY6ZR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLUCQ2YPGZAEBKFVILN3EK7XPMBBY6ZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The dai is passed from the parameter. We don't need to find the dai
by name.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt_dmic.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
index b8b493d5c6ec..ea7c1a4bc566 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -12,25 +12,13 @@
 #include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
-static const char * const dmics[] = {
-	"rt715",
-	"rt715-sdca",
-	"rt712-sdca-dmic",
-	"rt722-sdca",
-};
-
 int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *codec_dai;
 	char *mic_name;
 
-	codec_dai = get_codec_dai_by_name(rtd, dmics, ARRAY_SIZE(dmics));
-	if (!codec_dai)
-		return -EINVAL;
-
-	component = codec_dai->component;
+	component = dai->component;
 
 	/*
 	 * rt715-sdca (aka rt714) is a special case that uses different name in card->components
-- 
2.43.0

