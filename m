Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B58DF8C130A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F00F385D;
	Thu,  9 May 2024 18:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F00F385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272549;
	bh=X3iPFhHwtJ8qI46Vi0iGYgNWN3iJMpwLBgwPSrm5E3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SBVh1T9c+6wfKxeg7xTipAu/pfHN6KKn4pQDNzKY325l8SrbZIlTqaeI+Cj9vImkr
	 7lVp1u+ozQo1K6RgznPlBaXCwAhPrjS1BXenFd6fsNi+BsxTmHbkruWRIgzfuBWIJA
	 WFMr1+P1hiz6FCe/PrvOlR9pC8ZDlZFMtYX70OEI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 566EBF805DA; Thu,  9 May 2024 18:34:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8FE5F805D3;
	Thu,  9 May 2024 18:34:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66FADF8057C; Thu,  9 May 2024 18:34:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46C8BF80423
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46C8BF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hbIXXaLP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272474; x=1746808474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X3iPFhHwtJ8qI46Vi0iGYgNWN3iJMpwLBgwPSrm5E3M=;
  b=hbIXXaLPOzCqUZkG6n0V1EQImzdjUI4pN5vOlDZabY9j968pFFkO0Pyv
   IU+W8FpqsUJGgBuCBTZ6QN6ksfvw5YBQlCKO6izvoGdjY/OdSVU3T06Db
   /f1L6wxiurgjRRFGOM6BtESVnxtSIWHozxY6cyA4T3ynkTD8R6Nfjn223
   m9KipFifPRGzFb9WY6GPUaZ+327TpFoF7q2XvgXt5GkqU/4zGpgCmxb5T
   +pYSOC5ifGjylSnix7I6ZamxC00xUOrUE5LSgGdooqrI8afy5bBwtH3nP
   nQnpdmmR4Alu+7OryorQ+YfnGyGNa3xhv4obk2rxpRmkZqmL5hI/WjxXa
   w==;
X-CSE-ConnectionGUID: +iZ+DZXsSLGr3lzxDwsZBQ==
X-CSE-MsgGUID: 5B/L9AroSN640fFJdRmX4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017519"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017519"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:26 -0700
X-CSE-ConnectionGUID: ZxgXETYZQMGnLG0xoOh/3g==
X-CSE-MsgGUID: Kc741M+OQ0yLQsFZ3ADVWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33760977"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/18] ASoC: Intel: sof-rt5682: remove DMI quirk for hatch
Date: Thu,  9 May 2024 11:34:02 -0500
Message-Id: <20240509163418.67746-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ICMITM4HV3E5XB7ZXDCKPYEL2AGFKYPM
X-Message-ID-Hash: ICMITM4HV3E5XB7ZXDCKPYEL2AGFKYPM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICMITM4HV3E5XB7ZXDCKPYEL2AGFKYPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

The quirk for cml chromebook hatch could be removed since we have
cml_rt5682_def board id now.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index e3a2ec6b4c7c..5a189c165e2d 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -67,15 +67,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(1)),
 	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Hatch"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_SSP_PORT_CODEC(0) |
-					SOF_SSP_PORT_AMP(1)),
-	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
-- 
2.40.1

